print('Start #################################################################');
db = db.getSiblingDB('tariff');
// db = new Mongo().getDB("tariff");
db.createCollection('products');
db.createCollection('calculations');
db.products.insert([
    {
      "tariffName": "Basic Month",
      "description": "Basic month tariff. (baseCost * 12 + kwhCost * consumptionKwh)",
      "month": true,
      "values": {
        "baseCost": 5,
        "kwhCost": 0.22,
        "maxConsumption": null
      }
    },
    {
      "tariffName": "Packaged Annual",
      "description": "Packaged Annual tariff. (kwhused - maxConsumption = exceeded * kwhCost)",
      "month": false,
      "values": {
        "baseCost": 800,
        "kwhCost": 0.30,
        "maxConsumption": 4000
      }
    }
  ]);
  db.calculations.insert([
    {
      "person": {
        "firstName": "Kevin",
        "lastName": "Durant"
      },
      "dateProcessed": "2021-03-09T20:41:32.813Z",
      "installNumber": "123456789",
      "totalCosts": {
        "kwhYear": 4500,
        "products": [
          {
            "name": "Packaged Annual",
            "description": "Packaged Annual tariff. (kwhused - maxConsumption = exceeded * kwhCost)",
            "charger": "Annual",
            "totalYear": {
              "baseCostsYear": 800,
              "kwhCostsYear": 150,
              "totalCosts": 950
            }
          },
          {
            "name": "Basic Month",
            "description": "Basic month tariff. (baseCost * 12 + kwhCost * consumptionKwh)",
            "charger": "Month",
            "totalYear": {
              "baseCostsYear": 60,
              "kwhCostsYear": 990,
              "totalCosts": 1050
            }
          }
        ]
      }
    },
    {
      "person": {
        "firstName": "Mesut",
        "lastName": "Ozil"
      },
      "dateProcessed": "2021-08-09T20:41:32.823Z",
      "installNumber": "10203040",
      "totalCosts": {
        "kwhYear": 3500,
        "products": [
          {
            "name": "Packaged Annual",
            "description": "Packaged Annual tariff. (kwhused - maxConsumption = exceeded * kwhCost)",
            "charger": "Annual",
            "totalYear": {
              "baseCostsYear": "Using less then:4000 KWH/Year. Charge annual tariff: 800",
              "kwhCostsYear": "Using less then:4000 KWH/Year. Charge annual tariff: 800",
              "totalCosts": 800
            }
          },
          {
            "name": "Basic Month",
            "description": "Basic month tariff. (baseCost * 12 + kwhCost * consumptionKwh)",
            "charger": "Month",
            "totalYear": {
              "baseCostsYear": 60,
              "kwhCostsYear": 770,
              "totalCosts": 830
            }
          }
        ]
      }
    },
    {
      "person": {
        "firstName": "Lionel",
        "lastName": "Messi"
      },
      "dateProcessed": "2021-05-09T20:41:32.813Z",
      "installNumber": "97079375",
      "totalCosts": {
        "kwhYear": 4500,
        "products": [
          {
            "name": "Packaged Annual",
            "description": "Packaged Annual tariff. (kwhused - maxConsumption = exceeded * kwhCost)",
            "charger": "Annual",
            "totalYear": {
              "baseCostsYear": 800,
              "kwhCostsYear": 150,
              "totalCosts": 950
            }
          },
          {
            "name": "Basic Month",
            "description": "Basic month tariff. (baseCost * 12 + kwhCost * consumptionKwh)",
            "charger": "Month",
            "totalYear": {
              "baseCostsYear": 60,
              "kwhCostsYear": 990,
              "totalCosts": 1050
            }
          }
        ]
      }
    },
    {
      "person": {
        "firstName": "Cristiano",
        "lastName": "Ronaldo"
      },
      "dateProcessed": "2021-08-09T20:41:32.823Z",
      "installNumber": "76873580",
      "totalCosts": {
        "kwhYear": 3500,
        "products": [
          {
            "name": "Packaged Annual",
            "description": "Packaged Annual tariff. (kwhused - maxConsumption = exceeded * kwhCost)",
            "charger": "Annual",
            "totalYear": {
              "baseCostsYear": "Using less then:4000 KWH/Year. Charge annual tariff: 800",
              "kwhCostsYear": "Using less then:4000 KWH/Year. Charge annual tariff: 800",
              "totalCosts": 800
            }
          },
          {
            "name": "Basic Month",
            "description": "Basic month tariff. (baseCost * 12 + kwhCost * consumptionKwh)",
            "charger": "Month",
            "totalYear": {
              "baseCostsYear": 60,
              "kwhCostsYear": 770,
              "totalCosts": 830
            }
          }
        ]
      }
    }
  ]);

print('END #################################################################');