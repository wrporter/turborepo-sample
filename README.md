# Turborepo Sample



## Contributing

### Requirements

1. Install the LTS version of Node and npm: https://nodejs.org/en/download/
2. Install monorepo and package dependencies with `npm install`

### Tooling

#### [npm workspaces](https://docs.npmjs.com/cli/v8/using-npm/workspaces)

We use npm workspaces to manage dependencies. A single `package-lock.json` file is located at the root of the project. Development dependencies that are used for the projects should be at the root, while package-specific dependencies (including development dependencies) should be isolated to the consuming package.

#### [Turborepo](https://turborepo.org/)

We use Turborepo to run tasks in parallel with caching. Pipelines are defined in [turbo.json](./turbo.json) and correspond to `scripts` in each package's `package.json` file.

#### [changesets](https://github.com/changesets/changesets)

We use `changesets` to manage package versions, changelogs, and publishing. Versioning adheres to [semver](https://semver.org/). A changeset is created using the `npx changeset` command.

- Not every change in the repo requires a changeset, except for when the change is meant to cause a semantic version change in a package.
- Provide as much detail about a change as you can that is appropriate for consumers and maintainers alike. You can edit the changeset files under [.changeset](.changeset) to provide additional details about your chnages.
- Use one of the following prefixes in each changeset to describe the nature of the change: `Added: `, `Changed: `, `Deprecated: `, `Removed: `, `Fixed: `.

### Making Changes

1. Make changes in the appropriate package(s)
2. Validate changes with `npm run ci`
3. Run `npm run changeset` for each change and package that was modified
4. Create a merge request, get approval, and get it merged
5. When ready to release, bump package versions with `npm run version-packages`
6. Review changes in `CHANGELOG.md` files and add the date next to the version number. For example, `1.3.2 (05-12-2021)`.
7. Commit changes with the message `Release: <package1 name>@<new version> <package2 name>@<new version> ...`
8. Create a merge request and use the `Release` template
9. Once merged, the main Jenkins pipeline will publish packages
   - To publish manually, you can run `.ci/build.sh && .ci/publish.sh`

#### Creating a new package

1. Copy the appropriate template under [./templates](./templates) into the [./packages](./packages) directory.
2. Update the `package.json` with the package name and files to be included. Add any dependencies the package requires.
3. Update the `README.md` for the package.
4. Implement your new package and follow the steps under `Making Changes` above! 🚀

### Scripts

The root `package.json` comes with some helpful scripts that we will describe in detail. Execute a script with `npm run <script name>`.

- `changeset`: Add a changeset for the changes being made in the current commit.
- `ci`: Execute all tasks necessary for validating changes in continuous integration. It is useful to run this locally before committing changes.
- `clean`: Clean the current state of the repo and start fresh. This can be useful at times for a fresh installation of dependencies and to remove Turborepo caches.
- `lint`: Run the `lint` script in each package.
- `lint:fix`: Run the `lint:fix` script in each package.
- `release`: Publish any packages that have not been published with their current version.
- `version-packages`: Update package versions based on existing changesets and move changeset logs to the respective `CHANGELOG.md` files for each package.
