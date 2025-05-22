# Script para garficar ganerar mapas de datos PEMBU

## Ejemplo de la estructura del archivo CSV (separados por comas)  de entrada

El archivo CSV de estrada debera tener la siguiente estructura:

| Estacion | Longitud | Latitud | Tmax | Pmax |   Date  |
|----------|----------|---------|------|------|---------|
| ENP1 | -99.097778 | 19.395278 | 31.4 |  0.2 | 2022-01 |
| ENP2 | -99.002778 | 19.178889 | 29.4 |  0.0 | 2022-01 |
| ENP3 | -99.021944 | 19.190556 | 28.0 |  0.0 | 2022-01 |
| ENP4 | -99.091389 | 19.476667 | 30.9 |  0.0 | 2022-01 |
| ENP5 | -99.148056 | 19.303333 | 32.7 | 0.12 | 2022-01 |
| ENP6 | -99.052778 | 19.429167 | 32.9 |  0.0 | 2022-01 |
| ENP7 | -99.182222 | 19.296944 | 31.4 |  0.0 | 2022-01 |
| ENP8 | -99.173056 | 19.134444 | 27.8 |  0.1 | 2022-01 |
| ENP9 | -99.132222 | 19.333889 | 32.0 |  0.0 | 2022-01 |
| ENP1 | -99.097778 | 19.395278 | 31.4 |  0.1 | 2022-02 |
| ENP2 | -99.002778 | 19.178889 | 29.4 |  0.0 |2022-02 |

### Descripción de las columnas:

- **Estacion**: Identificador de la estación meteorológica (ENP1, ENP2, etc.)
- **Longitud**: Coordenada geográfica de longitud
- **Latitud**: Coordenada geográfica de latitud
- **Tmax**: Temperatura máxima registrada en grados Celsius. Para el caso de precipitación el nombre de la columna es Pmax
- **Date**: Fecha en formato año-mes (YYYY-MM)

Los datos muestran registros de temperaturas máximas para diferentes estaciones durante los meses de enero y febrero de 2022.

## Ejemplo para correr el script de graficación  
  
  python graficar.py --file=datos_estaciones2.csv --variable=Tmax
