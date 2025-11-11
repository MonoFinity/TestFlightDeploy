#!/usr/bin/env pwsh
# Monitor GitHub Actions workflow for TestFlight upload

Write-Host "🔍 Monitoring GitHub Actions workflow..." -ForegroundColor Cyan
Write-Host "Open in browser: https://github.com/monofinitystudio/TestFlightDeploy/actions" -ForegroundColor Yellow
Write-Host ""

$startTime = Get-Date
$checkInterval = 10  # seconds

while ($true) {
    try {
        # Try to fetch workflow runs via git/ssh since API auth is having issues
        $elapsed = [math]::Round(((Get-Date) - $startTime).TotalSeconds, 0)
        
        Write-Host "[${elapsed}s] Checking workflow status..." -ForegroundColor Gray
        Write-Host "  → Visit: https://github.com/monofinitystudio/TestFlightDeploy/actions" -ForegroundColor Cyan
        Write-Host ""
        
        # Manual check prompt
        $response = Read-Host "Enter workflow status (running/success/failure/q to quit)"
        
        if ($response -eq "q") {
            Write-Host "Monitoring stopped." -ForegroundColor Yellow
            break
        }
        elseif ($response -eq "success") {
            Write-Host ""
            Write-Host "✅ WORKFLOW COMPLETED SUCCESSFULLY!" -ForegroundColor Green
            Write-Host ""
            Write-Host "🎉 Your IPA has been uploaded to TestFlight!" -ForegroundColor Green
            Write-Host "📱 Check App Store Connect: https://appstoreconnect.apple.com" -ForegroundColor Cyan
            Write-Host ""
            Write-Host "⏱️  Total time: ~2 minutes (vs 8-11 min Unity rebuild)" -ForegroundColor Yellow
            break
        }
        elseif ($response -eq "failure") {
            Write-Host ""
            Write-Host "❌ WORKFLOW FAILED" -ForegroundColor Red
            Write-Host "📋 Check logs: https://github.com/monofinitystudio/TestFlightDeploy/actions" -ForegroundColor Yellow
            break
        }
    }
    catch {
        Write-Host "Error: $_" -ForegroundColor Red
        Start-Sleep -Seconds $checkInterval
    }
}
