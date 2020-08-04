# Pre Build pyAudioAnalysis Docker image

Built for
* amd64
* arm64
* arm6
* arm7

## Building

Make sure you have experimental support enabled.

```
docker buildx create --name pibuilder --use
```

```
docker buildx build \
    --platform linux/amd64,linux/arm64,linux/arm/v7,linux/arm/v6 \ 
    -t ncrmro/py-audio-analysis:latest \
    -t ncrmro/py-audio-analysis:0.3.5 
    --push .
```
