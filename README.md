# Pre Build pyAudioAnalysis Docker image

Built for
* amd64
* arm7

## Building

```
docker build --target base \
       --cache-from=ncrmro/py-audio-analysis \
       --build-arg BASE_IMAGE=python:3.8.5-slim-buster \
       --tag ncrmro/py-audio-analysis \
       --tag ncrmro/py-audio-analysis:0.3.5 \
       .
```

`docker push ncrmro/py-audio-analysis`

`docker push ncrmro/py-audio-analysis:0.3.5`
