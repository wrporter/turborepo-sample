# Turborepo Sample

**EDIT:** Fixed by copying over all the `package.json` files from the underlying packages. Docker does not have good glob pattern support to do this, so we need to use multi-stage builds to accomplish caching.

This project showcases an issue with Turborepo and npm workspaces being built in Docker.

It seems that some dependencies are required to be installed at the root of the monorepo, when they are only required by specific packages.

To test building, run `.ci/build.sh && .ci/run.sh npm run ci`.

To showcase the issue, remove a shared dependency at the root with `npm rm @sample/eslint-config`, then run the build with the command above. You can remove any of the following shareddependencies from the root and the problems will manifest, all of which should not be required at the root:

- `@sample/tsconfig`
- `@sample/eslint-config`
