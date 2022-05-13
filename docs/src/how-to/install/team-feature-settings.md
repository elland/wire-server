# Server and team feature settings

Features can be enabled or disabled on a team level or server wide. Here we will only cover the server wide configuration.

When a feature's lock status is `unlocked` it means that its settings can be overridden on a team level by team admins. This can be done via the team management app or via the team feature API and is not covered here.

## 2nd factor password challenge

By default Wire enforces a 2nd factor authentication for certain user operations like e.g. activating an account, changing email or password, or deleting an account.

If the `sndFactorPasswordChallenge` feature is enabled, a 6 digit verification code will be send per email to authenticate for additional user operations like e.g. for login, adding a new client, generating SCIM tokens, or deleting a team.

Usually the default is what you want. If you explicitly want to enable additional password challenges, add the following to your Helm overrides in `values/wire-server/values.yaml`:

```yaml
galley:
  # ...
  config:
    # ...
    settings:
      # ...
      featureFlags:
        # ...
        sndFactorPasswordChallenge:
          defaults:
            status: enabled
            lockStatus: locked
```

Note that the lock status is required but has no effect, as it is currently not supported for team admins to enable or disable `sndFactorPasswordChallenge`. We recommend to set the lock status to `locked`.