-- | SCIM errors
module Web.Scim.Schema.Error
  (
  -- * Types
    ScimErrorType(..)
  , ScimError(..)
  , Status(..)

  -- * Constructors
  , notFound
  , badRequest
  , conflict
  , unauthorized
  , forbidden
  , serverError

  -- * Servant interoperability
  , scimToServantErr
  ) where

import Data.Text (Text, pack)
import Data.Aeson hiding (Error)
import Control.Exception
import Web.Scim.Schema.Common
import Web.Scim.Schema.Schema
import Servant (ServantErr (..))

import GHC.Generics (Generic)

----------------------------------------------------------------------------
-- Types

-- | An ADT for error types in the SCIM specification. Not all possible SCIM
-- errors have a corresponding 'ScimErrorType' (for instance, authorization
-- is not covered by this type).
--
-- See <https://tools.ietf.org/html/rfc7644#page-69>
data ScimErrorType
  = InvalidFilter
  | TooMany
  | Uniqueness
  | Mutability
  | InvalidSyntax
  | InvalidPath
  | NoTarget
  | InvalidValue
  | InvalidVers
  | Sensitive
  deriving (Show, Eq, Generic)

instance ToJSON ScimErrorType where
  toJSON InvalidFilter = "invalidFilter"
  toJSON TooMany       = "tooMany"
  toJSON Uniqueness    = "uniqueness"
  toJSON Mutability    = "mutability"
  toJSON InvalidSyntax = "invalidSyntax"
  toJSON InvalidPath   = "invalidPath"
  toJSON NoTarget      = "noTarget"
  toJSON InvalidValue  = "invalidValue"
  toJSON InvalidVers   = "invalidVers"
  toJSON Sensitive     = "sensitive"

-- wrapped in a newtype because SCIM wants strings for status codes
newtype Status = Status {unStatus :: Int}
  deriving (Show, Eq, Generic)

instance ToJSON Status where
  toJSON (Status stat) = String . pack . show $ stat

data ScimError = ScimError
  { schemas :: [Schema]
  , status :: Status
  , scimType :: Maybe ScimErrorType
  , detail :: Maybe Text
  } deriving (Show, Eq, Generic)

instance ToJSON ScimError where
  toJSON = genericToJSON serializeOptions

instance Exception ScimError

----------------------------------------------------------------------------
-- Constructors

badRequest
  :: ScimErrorType  -- ^ Error type
  -> Maybe Text     -- ^ Error details
  -> ScimError
badRequest typ mbDetail =
  ScimError
    { schemas = [Error2_0]
    , status = Status 400
    , scimType = pure typ
    , detail = mbDetail
    }

unauthorized
  :: Text         -- ^ Error details
  -> ScimError
unauthorized details =
  ScimError
    { schemas = [Error2_0]
    , status = Status 401
    , scimType = Nothing
    , detail = pure $ "authorization failed: " <> details
    }

forbidden
  :: Text         -- ^ Error details
  -> ScimError
forbidden details =
  ScimError
    { schemas = [Error2_0]
    , status = Status 403
    , scimType = Nothing
    , detail = pure $ "forbidden: " <> details
    }

notFound
  :: Text        -- ^ Resource type
  -> Text        -- ^ Resource ID
  -> ScimError
notFound resourceType resourceId =
  ScimError
    { schemas = [Error2_0]
    , status = Status 404
    , scimType = Nothing
    , detail = pure $ resourceType <> " " <> resourceId <> " not found"
    }

conflict :: ScimError
conflict =
  ScimError
    { schemas = [Error2_0]
    , status = Status 409
    , scimType = Just Uniqueness
    , detail = Nothing
    }

serverError
  :: Text         -- ^ Error details
  -> ScimError
serverError details =
  ScimError
    { schemas = [Error2_0]
    , status = Status 500
    , scimType = Nothing
    , detail = pure details
    }

----------------------------------------------------------------------------
-- Servant

-- | Convert a SCIM 'Error' to a Servant one by encoding it with the
-- appropriate headers.
scimToServantErr :: ScimError -> ServantErr
scimToServantErr err =
  ServantErr
    { errHTTPCode = unStatus (status err)
    , errReasonPhrase = reasonPhrase (status err)
    , errBody = encode err
    , errHeaders = [("Content-Type", "application/scim+json;charset=utf-8")]
    }

-- | A mapping of error code "reason phrases" (e.g. "Method Not Allowed")
-- for all 4xx and 5xx errors.
reasonPhrase :: Status -> String
reasonPhrase = \case
  Status 400 -> "Bad Request"
  Status 401 -> "Unauthorized"
  Status 402 -> "Payment Required"
  Status 403 -> "Forbidden"
  Status 404 -> "Not Found"
  Status 405 -> "Method Not Allowed"
  Status 406 -> "Not Acceptable"
  Status 407 -> "Proxy Authentication Required"
  Status 408 -> "Request Time-out"
  Status 409 -> "Conflict"
  Status 410 -> "Gone"
  Status 411 -> "Length Required"
  Status 412 -> "Precondition Failed"
  Status 413 -> "Request Entity Too Large"
  Status 414 -> "Request-URI Too Large"
  Status 415 -> "Unsupported Media Type"
  Status 416 -> "Range Not Satisfiable"
  Status 417 -> "Expectation Failed"
  Status 422 -> "Unprocessable Entity"
  Status 500 -> "Internal Server Error"
  Status 501 -> "Not Implemented"
  Status 502 -> "Bad Gateway"
  Status 503 -> "Service Unavailable"
  Status 504 -> "Gateway Time-out"
  Status 505 -> "HTTP Version not supported"
  other      -> show other
