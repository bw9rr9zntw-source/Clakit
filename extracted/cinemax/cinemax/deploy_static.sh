#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
flutter build web --release
mkdir -p deploy
cp -r build/web/. deploy/
echo "Static deployment folder prepared at: $PWD/deploy"
