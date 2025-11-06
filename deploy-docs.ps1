$ErrorActionPreference = "Stop"

Write-Host "Building production assets..." -ForegroundColor Green
npm run build

Write-Host "Syncing build/ to docs/..." -ForegroundColor Green
if (Test-Path "docs") { Remove-Item -Recurse -Force "docs" }
New-Item -ItemType Directory -Force -Path "docs" | Out-Null
Copy-Item -Path "build\*" -Destination "docs" -Recurse -Force

Write-Host "Committing and pushing docs/ to main..." -ForegroundColor Yellow
git add docs
git commit -m "Deploy site to docs" --allow-empty
git push

Write-Host "✅ Done. Enable GitHub Pages: main branch, /docs folder." -ForegroundColor Green
Write-Host "URL: https://faraazkhan1112.github.io/pdaps-geomap-dashboard" -ForegroundColor Cyan


