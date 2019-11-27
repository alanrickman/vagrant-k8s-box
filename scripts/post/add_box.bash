#!/bin/bash

if [ -f metadata.json ]; then
  rm -rf metadata.json
fi

BOXLOCATION="$(pwd)/${OUTDIR}"

cat > metadata.json << EOF
{
  "name": "${REPO}/${NAME}",
  "versions": [
    {
      "version": "${VERSION}",
      "providers": [
        {
          "name": "virtualbox",
          "url": "file:///${BOXLOCATION}/package.box"
        }
      ]
    }
  ]
}
EOF

vagrant box add --force metadata.json
