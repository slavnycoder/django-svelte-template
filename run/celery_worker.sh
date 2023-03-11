#!/bin/bash
set -euo pipefail
dir=$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
celery -A backend worker -Q test -l info
