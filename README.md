# awair-exporter

A Prometheus exporter for the [Awair Local API](https://support.getawair.com/hc/en-us/articles/360049221014-Awair-Element-Local-API-Feature). Exposes air quality metrics from Awair Element devices for scraping by Prometheus.

Based on [Ichabond/awair-exporter](https://github.com/Ichabond/awair-exporter).

## Exported Metrics

All metrics are exposed under the `awair_` namespace with an `instance` label set to the device hostname.

| Metric | Description |
|---|---|
| `awair_awair_score` | Awair Score |
| `awair_temperature` | Temperature |
| `awair_relative_humidity` | Relative Humidity |
| `awair_absolute_humidity` | Absolute Humidity |
| `awair_dew_point` | Dew Point |
| `awair_co2` | CO2 levels |
| `awair_co2_estimate` | CO2 estimated levels |
| `awair_voc` | Volatile Organic Compounds |
| `awair_pm25` | Particulate Matter (2.5 µm) |
| `awair_pm10_estimate` | Particulate Matter (10 µm, estimated) |

## Usage

```
awair-exporter [FLAGS...] HOSTNAME_TO_QUERY
```

**Flags:**
- `-l` — Listen address (default: `:2112`)

**Example:**
```sh
awair-exporter -l :9090 awair-elem-123abc.local
```

Metrics are served at `/metrics`.

## Docker

```sh
docker build -t awair-exporter .
docker run -p 2112:2112 awair-exporter awair-elem-123abc.local
```
