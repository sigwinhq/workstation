# Copilot Instructions

This repository configures a developer workstation environment. It uses `sigwin/infra` (installed via Composer) to provide the build infrastructure, and Docker Compose to run supporting services such as `docker-hostmanager`.

## Repository Structure

- `Makefile` – Entry point for all build and maintenance tasks; delegates to `vendor/sigwin/infra`.
- `docker-compose.yaml` – Defines workstation services (e.g. `hostmanager` for Linux host-file management).
- `.editorconfig` – Enforces consistent editor settings across the project.
- `vendor/` – Managed dependencies (ignored by Git; bootstrapped via `make`).

## Development Workflow

### Bootstrap

Run `make` to install the `sigwin/infra` vendor package and generate all required build targets:

```sh
make
```

Subsequent calls to `make` will use the already-installed vendor package.

### Common Make Targets

All targets are provided by `sigwin/infra`. Run `make help` (if available) to list them. Typical targets include:

- `make` – Bootstrap/update vendor dependencies and refresh generated files.

### Docker Compose

Start the workstation services with:

```sh
docker compose up -d
```

The `hostmanager` service is only active on Linux (via the `linux` profile):

```sh
docker compose --profile linux up -d
```

## Coding Standards

Follow the rules defined in `.editorconfig`:

- **Charset**: UTF-8
- **Line endings**: LF (`\n`)
- **Indentation**: 4 spaces for all files **except** `Makefile` and `*.mk` files, which must use tabs
- **Final newline**: always insert
- **Trailing whitespace**: trim (Markdown files are exempt)

When modifying `docker-compose.yaml`, use 4-space indentation and keep the structure consistent with the existing file.
