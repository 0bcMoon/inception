# Inception

A Docker Compose system administration project with Nginx, WordPress/PHP-FPM, and MariaDB. Additional services provide Redis caching, Adminer, cAdvisor, FTP, and a separate website.

## Requirements

Use a Linux host or VM with Docker, Docker Compose, and permission to create bind-mounted data directories. Nginx publishes port 443; FTP publishes ports 21 and 21000–21010. cAdvisor mounts host system and Docker paths.

## Configuration

Create `srcs/.env` locally. The startup scripts and Compose configuration reference these variables:

| Variables | Purpose |
| --- | --- |
| `DOMAIN_NAME` | WordPress installation URL and primary certificate name |
| `DB_NAME`, `DB_USER`, `DB_PASS`, `DB_ROOT_PASS` | MariaDB database and credentials |
| `WP_TITLE` | WordPress site title |
| `WP_ADMIN_USER`, `WP_ADMIN_PASS`, `WP_ADMIN_EMAIL` | WordPress administrator |
| `WP_USER`, `WP_PASS`, `WP_EMAIL` | Additional WordPress author |
| `REDIS_PASS` | Redis authentication |
| `FTP_USER`, `FTP_PASS`, `FTP_ADDR` | FTP account and passive-mode address |

Set your own local credentials and keep `.env` out of Git. The Nginx configuration uses `hibenouk.42.fr`, `adminer.me`, `cadvisor.me`, and `hibenouk.1337.me`. Configure local hostname resolution for the machine running the stack, or update the server names and certificate setup scripts together. Certificates are self-signed.

## Start

From the repository root:

```sh
mkdir -p "$HOME/data/mariadb" "$HOME/data/wordpress" "$HOME/data/adminer"
docker compose -f srcs/docker-compose.yml config --quiet
docker compose -f srcs/docker-compose.yml up -d --build
docker compose -f srcs/docker-compose.yml ps
```

The Makefile uses the older `docker-compose` executable. If it is installed, `make up`, `make down`, and `make rebuild` are available. The commands above use the Compose plugin directly.

Several setup scripts enable shell tracing with `set -x`, which can print expanded credentials into container logs. Remove tracing before using real credentials or sharing logs.

## Stop

```sh
docker compose -f srcs/docker-compose.yml down
```

Persistent data lives under `$HOME/data/`. The Makefile's `purge` target stops containers across the Docker host and invokes a system-wide prune; it is not a cleanup command scoped to this project.

## Layout

- `srcs/docker-compose.yml`: services, health checks, networking, and volumes.
- `srcs/requirements/{nginx,wordpress,mariadb}/`: core images and setup scripts.
- `srcs/requirements/bonus/`: additional services.
