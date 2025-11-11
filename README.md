# TestFlight Deploy - Fast IPA Upload Without Unity Build

Upload iOS IPAs to TestFlight on GitHub's free Mac runner in < 2 minutes - no Unity rebuild required!

## 🚀 Quick Start

### 1. Configure GitHub Secrets

Go to: https://github.com/monofinitystudio/TestFlightDeploy/settings/secrets/actions

Add these secrets:

| Secret Name | Value |
|-------------|-------|
| `APPLE_ID` | `martiangames@gmail.com` |
| `APPLE_APP_SPECIFIC_PASSWORD` | `hddc-knht-ejpb-cwbf` |
| `APPLE_AUTH_LITEBYTE` | (Base64 PEM content from LiteByteData.md) |
| `APPLE_ISSUER_ID` | `df683906-fb48-497d-ae8e-76dda22778b4` |
| `UNITY_CLOUD_API_KEY` | `dcfe93b2d8fbd7bd1a7f8948eabf5cfa` (optional) |

### 2. Run the Workflow

**Option A**: Upload from Unity Cloud Build (default - Build #5)
1. Go to: https://github.com/monofinitystudio/TestFlightDeploy/actions/workflows/testflight-upload-only.yml
2. Click **"Run workflow"**
3. Leave inputs empty
4. Click **"Run workflow"**

**Option B**: Upload from custom URL
1. Click **"Run workflow"**
2. Enter IPA download URL in `ipa_url` field
3. Click **"Run workflow"**

### 3. Monitor

Check the workflow run - completes in ~2 minutes!

## ✅ Benefits

- **Fast**: 2 min vs 8-11 min Unity builds
- **Free**: GitHub Actions macOS runner
- **No rebuilds**: Uses existing IPAs
- **Perfect for testing**: Iterate on upload scripts without Unity

## 📝 Secrets Details

### APPLE_AUTH_LITEBYTE
```
MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQgw4RxOCGoRQQuAQAQ
vcyCOIWfibsVBcSFsfRSHWkQgsigCgYIKoZIzj0DAQehRANCAATLu29xMYXciGp1
yJcQzyi1nX3CDp4VokYZJjcsuE4k00/Q1s7v++S/85bk+nveZOHnzj8ixjEgcQih
39JIjU6A
```

## 🔗 Links

- Workflow: https://github.com/monofinitystudio/TestFlightDeploy/actions
- App Store Connect: https://appstoreconnect.apple.com
- Unity Cloud Build: https://cloud.unity.com/home/organizations/111662/projects/f33c3007-0edf-4edb-81ca-21e1ccc47092/builds

## 📊 Workflow Details

- Downloads IPA from Unity Cloud Build or custom URL
- Sets up Ruby 3.3 + Fastlane 2.225.0
- Configures Apple authentication
- Runs `fastlane ios tf_upload`
- Uploads logs on failure for debugging

---

**Created**: November 11, 2025  
**Purpose**: Stop wasting time on unnecessary Unity rebuilds
