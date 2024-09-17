#!/bin/bash

npm set @ingka:registry https://npm.m2.blue.cdtapps.com
npm set @frontend:registry=http://nexus-repo.bitboxwebs.com:8081/repository/npmrepo-comun-bbx/
npm set registry=https://registry.npmjs.org
npm set //nexus-repo.bitboxwebs.com:8081/repository/npmrepo-comun-bbx/:_authToken=NpmToken.ceb7452e-cdd4-32ad-8806-46edcbeafbad

# Procesar cada directorio que contenga un package.json
for dir in */; do
    if [ -f "${dir}package.json" ]; then
        pushd "$dir"
        npm install && pm2 start npm --name "${dir%/}" -- run dev && npm run start
        popd
    fi
done

# Mantener el contenedor ejecut?ndose (revisar si es necesario)
while true; do sleep 10; done
