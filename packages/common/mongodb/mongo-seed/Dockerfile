FROM mongo

COPY ./init-tariff/products.json /products.json
COPY ./init-tariff/calculations.json /calculations.json
CMD mongoimport --host mongodb --db tariff --collection products --type json --file /products.json --jsonArray \
    && mongoimport --host mongodb --db tariff --collection calculations --type json --file /calculations.json --jsonArray