# Monitoring Stack - Docker Compose

Stack completa de observabilidade utilizando Docker Compose com:

* Zabbix
* Grafana
* Prometheus
* Loki
* Promtail
* Netdata

Tudo configurado para subir automaticamente com dashboards, logs e monitoramento já provisionados.

---

# Stack

## Monitoramento

* Zabbix
* Prometheus
* Netdata

## Logs

* Loki
* Promtail

## Visualização

* Grafana

---

# Estrutura do Projeto

```bash
repo/
├── docker-compose.yml
├── zabbix.sql
├── grafana/
│   ├── dashboards/
│   └── provisioning/
├── prometheus/
│   ├── prometheus.yml
│   └── alerts.yml
├── loki/
│   └── config.yml
├── promtail/
│   └── config.yml
└── netdata/
    └── docker.conf
```

---

# Requisitos

* Docker
* Docker Compose

---

# Subindo o Ambiente

```bash
docker compose up -d
```

---

# Restaurando Configuração do Zabbix

O projeto utiliza dump PostgreSQL para restaurar automaticamente a configuração do Zabbix.

O arquivo:

```bash
zabbix.sql
```

contém:

* templates
* hosts
* triggers
* dashboards
* actions
* usuários
* configurações

---

# Recriando Ambiente do Zero

Remover containers e volumes:

```bash
docker compose down -v
```

Subir novamente:

```bash
docker compose up -d
```

---

# Serviços

## Zabbix

Monitoramento principal da infraestrutura.

## Grafana

Dashboards e visualização de métricas.

## Prometheus

Coleta de métricas e alertas.

## Loki

Centralização de logs.

## Promtail

Coleta de logs Docker.

## Netdata

Monitoramento em tempo real do host e containers.

---

# Volumes Importantes

## Netdata

Necessário para métricas Docker e host:

```yaml
volumes:
  - ./netdata/docker.conf:/etc/netdata/go.d/docker.conf
  - /var/run/docker.sock:/var/run/docker.sock:ro
  - /proc:/host/proc:ro
  - /sys:/host/sys:ro
```

---

# Grafana Provisioning

Os dashboards são carregados automaticamente através da pasta:

```bash
grafana/dashboards/
```

E os datasources através de:

```bash
grafana/provisioning/
```

---

# Prometheus Alerts

As regras de alerta ficam em:

```bash
prometheus/alerts.yml
```

---

# Logs Docker

O Promtail coleta logs automaticamente utilizando:

```yaml
docker_sd_configs
```

---

# Observações

* Projeto desenvolvido com foco em observabilidade moderna utilizando containers Docker.
* A stack integra monitoramento, coleta de métricas, centralização de logs e visualização de dados em uma única arquitetura.
* Toda a infraestrutura foi estruturada para ser reproduzível via Docker Compose.
* Dashboards, regras de alerta e configurações são provisionados automaticamente durante a inicialização dos serviços.
* O ambiente utiliza persistência de dados e integração entre múltiplas ferramentas de observabilidade.
* A estrutura do projeto foi organizada visando portabilidade, facilidade de manutenção e versionamento no GitHub.
* Algumas configurações podem ser adaptadas conforme requisitos de produção, como autenticação externa, TLS, alta disponibilidade e gerenciamento avançado de secrets.


---

# Comandos Úteis

Ver containers:

```bash
docker ps
```

Ver logs:

```bash
docker logs -f <container>
```

Parar stack:

```bash
docker compose down
```

Subir stack:

```bash
docker compose up -d
```

---

# Objetivo

Criar uma stack completa de observabilidade totalmente reproduzível utilizando apenas:

```bash
git clone
docker compose up -d
```

---

# Autor

Rafael Ferreira Neves

---

# Licença

Projeto desenvolvido para fins educacionais e portfólio DevOps/Cloud.

