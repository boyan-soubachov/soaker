# SimpleSoaker
Deployment soaking action for GitHub workflows.

This is a simple tool which blocks all deployments to a specified branch if the previous commit has been made within the
specified soaking period.

## Inputs

### `branch`

The branch on which to compare soak-times against. Default `"master"`.

### `soakPeriod`

**Required** The time (in seconds) to consider a deployment/release/commit to `branch` soaked.

## Example usage

Make sure `master` has been soaking for at least 7 days.

```
uses: boyan-soubachov/soaker@v0.1.3
with:
  branch: 'master'
  soakPeriod: 604800
```
