[33mcommit 095a32e58a198dfbf66e3eb63f3276f97f4c5e54[m[33m ([m[1;36mHEAD -> [m[1;32mmain[m[33m)[m
Author: maray2208 <metallmarat@gmail.com>
Date:   Sat Feb 18 16:40:14 2023 +0000

    first commit

[1mdiff --git a/README.md b/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..4434a60[m
[1m--- /dev/null[m
[1m+++ b/README.md[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32m# Docker_Ansible[m
[1mdiff --git a/ansible.cfg b/ansible.cfg[m
[1mnew file mode 100644[m
[1mindex 0000000..736b408[m
[1m--- /dev/null[m
[1m+++ b/ansible.cfg[m
[36m@@ -0,0 +1,5 @@[m
[32m+[m[32m[defaults][m
[32m+[m[32mhost_key_checking = false[m
[32m+[m[32minventory         = ./hosts.txt[m
[32m+[m
[32m+[m
[1mdiff --git a/hosts.txt b/hosts.txt[m
[1mnew file mode 100644[m
[1mindex 0000000..81323f4[m
[1m--- /dev/null[m
[1m+++ b/hosts.txt[m
[36m@@ -0,0 +1,7 @@[m
[32m+[m[32m[staging_servers][m
[32m+[m[32mtest_docker ansible_host=192.168.0.113[m
[32m+[m
[32m+[m[32m[staging_servers:vars][m
[32m+[m[32mansible_user=maray[m
[32m+[m[32mansible_password=marat2208[m
[32m+[m[32mansible_sudo_pass=marat2208[m
[1mdiff --git a/playbook.yml b/playbook.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..196c86f[m
[1m--- /dev/null[m
[1m+++ b/playbook.yml[m
[36m@@ -0,0 +1,145 @@[m
[32m+[m[32m---[m
[32m+[m[32m- hosts: all[m
[32m+[m[32m  become: yes[m
[32m+[m[32m  gather_facts: false[m
[32m+[m[32m  tasks:[m
[32m+[m[32m    - name: Create dir[m
[32m+[m[32m      file:[m
[32m+[m[32m        path: "{{ item }}"[m
[32m+[m[32m        state: directory[m
[32m+[m[32m      loop:[m
[32m+[m[32m        - '/home/project/prometheus_stack/alertmanager'[m
[32m+[m[32m        - '/home/project/prometheus_stack/grafana/dashboards'[m
[32m+[m[32m        - '/home/project/prometheus_stack/grafana/datasources'[m
[32m+[m[32m        - '/home/project/prometheus_stack/prometheus'[m
[32m+[m[32m        - '/home/project/src/conf.d'[m
[32m+[m[32m        - '/home/project/src/html'[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/src/html/index.php[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/src/html/index.php[m
[32m+[m[32m        dest: /home/project/src/html[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/src/conf.d/default.conf[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/src/conf.d/default.conf[m
[32m+[m[32m        dest: /home/project/src/conf.d[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/prometheus_stack/alertmanager/alertmanager.yml[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/prometheus_stack/alertmanager/alertmanager.yml[m
[32m+[m[32m        dest: /home/project/prometheus_stack/alertmanager[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/prometheus_stack/grafana/dashboards/dashboards.yml[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/prometheus_stack/grafana/dashboards/dashboards.yml[m
[32m+[m[32m        dest: /home/project/prometheus_stack/grafana/dashboards[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/prometheus_stack/grafana/dashboards/node-exporter-full_rev30.json[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/prometheus_stack/grafana/dashboards/node-exporter-full_rev30.json[m
[32m+[m[32m        dest: /home/project/prometheus_stack/grafana/dashboards[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/prometheus_stack/grafana/datasources/prometheus.yml[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/prometheus_stack/grafana/datasources/prometheus.yml[m
[32m+[m[32m        dest: /home/project/prometheus_stack/grafana/datasources[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/prometheus_stack/prometheus/prometheus.yml[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/prometheus_stack/prometheus/prometheus.yml[m
[32m+[m[32m        dest: /home/project/prometheus_stack/prometheus[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/prometheus_stack/prometheus/alerts.yml[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/prometheus_stack/prometheus/alerts.yml[m
[32m+[m[32m        dest: /home/project/prometheus_stack/prometheus[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m
[32m+[m[32m    - name: Copy /home/project/docker-compose.yml[m
[32m+[m[32m      copy:[m
[32m+[m[32m        src: project/docker-compose.yml[m
[32m+[m[32m        dest: /home/project[m
[32m+[m[32m        remote_src: no[m
[32m+[m[32m        mode: 0644[m
[32m+[m[32m        owner: root[m
[32m+[m[32m        group: root[m
[32m+[m
[32m+[m
[32m+[m[32m    - name: Install docker packages[m
[32m+[m[32m      apt:[m
[32m+[m[32m        name: ['apt-transport-https','ca-certificates', 'curl', 'software-properties-common'][m
[32m+[m[32m        state: present[m
[32m+[m[32m      tags:[m
[32m+[m[32m        - docker[m
[32m+[m
[32m+[m[32m    - name: Add Docker s GPG key for ubuntu from official site[m
[32m+[m[32m      apt_key:[m
[32m+[m[32m        url: https://download.docker.com/linux/ubuntu/gpg[m
[32m+[m[32m        state: present[m
[32m+[m[32m      tags:[m
[32m+[m[32m        - docker[m
[32m+[m
[32m+[m[32m    - name: Verify gpg key with the fingerprint[m
[32m+[m[32m      apt_key:[m
[32m+[m[32m        id: 0EBFCD88[m
[32m+[m[32m        state: present[m
[32m+[m[32m      tags:[m
[32m+[m[32m        - docker[m
[32m+[m
[32m+[m[32m    - name: Configure Docker for ubuntu stable repository[m
[32m+[m[32m      apt_repository:[m
[32m+[m[32m        repo: deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable[m
[32m+[m[32m        state: present[m
[32m+[m[32m      tags:[m
[32m+[m[32m        - docker[m
[32m+[m
[32m+[m[32m    - name: Install docker-ce[m
[32m+[m[32m      apt:[m
[32m+[m[32m        name: docker-ce[m
[32m+[m[32m        state: present[m
[32m+[m[32m      tags:[m
[32m+[m[32m        - docker[m
[32m+[m
[32m+[m[32m    - name: Install docker-compose from official github repo[m
[32m+[m[32m      get_url:[m
[32m+[m[32m        url : https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64[m
[32m+[m[32m        dest: /usr/local/bin/docker-compose[m
[32m+[m[32m        mode: 'u+x,g+x'[m
[32m+[m
[32m+[m[32m    - name:[m
[32m+[m[32m      shell: docker-compose -f '/home/project/docker-compose.yml' up -d[m
[32m+[m[32m      tags:[m
[32m+[m[32m        - docker[m
[1mdiff --git a/playbook2.yml b/playbook2.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..23bf0fd[m
[1m--- /dev/null[m
[1m+++ b/playbook2.yml[m
[36m@@ -0,0 +1,9 @@[m
[32m+[m[32m- hosts: all[m
[32m+[m
[32m+[m[32m  become: yes[m
[32m+[m[32m  gather_facts: false[m
[32m+[m[32m  tasks:[m
[32m+[m[32m   - name:[m
[32m+[m[32m     shell: docker-compose -f '/home/project/docker-compose.yml' down[m
[32m+[m[32m     tags:[m
[32m+[m[32m       - docker[m
[1mdiff --git a/project/docker-compose.yml b/project/docker-compose.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..1b5ed01[m
[1m--- /dev/null[m
[1m+++ b/project/docker-compose.yml[m
[36m@@ -0,0 +1,69 @@[m
[32m+[m[32mversion: '3'[m
[32m+[m[32mservices:[m
[32m+[m[32m  php:[m
[32m+[m[32m    image: php:8.0-fpm[m
[32m+[m[32m    volumes:[m
[32m+[m[32m      - '/home/project/src/html:/var/www/html'[m
[32m+[m
[32m+[m
[32m+[m[32m  nginx:[m
[32m+[m[32m    image: nginx:latest[m
[32m+[m[32m    ports:[m
[32m+[m[32m      - 80:80[m
[32m+[m[32m    volumes:[m
[32m+[m[32m      - '/home/project/src/conf.d:/etc/nginx/conf.d'[m
[32m+[m[32m      - '/home/project/src/html:/var/www/html'[m
[32m+[m[32m    depends_on:[m
[32m+[m[32m      - php[m
[32m+[m
[32m+[m[32m  prometheus:[m
[32m+[m[32m    image: prom/prometheus:latest[m
[32m+[m[32m    volumes:[m
[32m+[m[32m      - '/home/project/prometheus_stack/prometheus:/etc/prometheus'[m
[32m+[m[32m    ports:[m
[32m+[m[32m      - 9090:9090[m
[32m+[m[32m    restart: unless-stopped[m
[32m+[m[32m    environment:[m
[32m+[m[32m      TZ: "Europe/Moscow"[m
[32m+[m
[32m+[m
[32m+[m[32m  node-exporter:[m
[32m+[m[32m    image: prom/node-exporter[m
[32m+[m[32m    ports:[m
[32m+[m[32m      - 9100:9100[m
[32m+[m[32m    restart: unless-stopped[m
[32m+[m[32m    environment:[m
[32m+[m[32m      TZ: "Europe/Moscow"[m
[32m+[m
[32m+[m[32m  nginx-exporter:[m
[32m+[m[32m    image: nginx/nginx-prometheus-exporter:latest[m
[32m+[m[32m    ports:[m
[32m+[m[32m      - 8080:8080[m
[32m+[m
[32m+[m
[32m+[m[32m  grafana:[m
[32m+[m[32m    image: grafana/grafana[m
[32m+[m[32m    volumes:[m
[32m+[m[32m      - '/home/project/prometheus_stack/grafana/datasources:/etc/grafana/provisioning/datasources'[m
[32m+[m[32m      - '/home/project/prometheus_stack/grafana/dashboards:/etc/grafana/provisioning/dashboards'[m
[32m+[m[32m    depends_on:[m
[32m+[m[32m      - prometheus[m
[32m+[m[32m    ports:[m
[32m+[m[32m      - 3000:3000[m
[32m+[m[32m    restart: unless-stopped[m
[32m+[m[32m    environment:[m
[32m+[m[32m      TZ: "Europe/Moscow"[m
[32m+[m[32m      GF_DEFAULT_INSTANCE_NAME: "my-grafana"[m
[32m+[m[32m      GF_SECURITY_ADMIN_USER: "grafana"[m
[32m+[m[32m      GF_SECURITY_ADMIN_PASSWORD: "grafana"[m
[32m+[m
[32m+[m
[32m+[m[32m  alertmanager:[m
[32m+[m[32m    image: prom/alertmanager:latest[m
[32m+[m[32m    ports:[m
[32m+[m[32m      - 9093:9093[m
[32m+[m[32m    volumes:[m
[32m+[m[32m      - '/home/project/prometheus_stack/alertmanager:/etc/alertmanager'[m
[32m+[m[32m    environment:[m
[32m+[m[32m      TZ: "Europe/Moscow"[m
[32m+[m[32m    restart: unless-stopped[m
[1mdiff --git a/project/prometheus_stack/alertmanager/alertmanager.yml b/project/prometheus_stack/alertmanager/alertmanager.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..6072031[m
[1m--- /dev/null[m
[1m+++ b/project/prometheus_stack/alertmanager/alertmanager.yml[m
[36m@@ -0,0 +1,18 @@[m
[32m+[m[32mroute:[m
[32m+[m[32m group_by: ['alertname', 'instance', 'severity'][m
[32m+[m[32m group_wait: 10s[m
[32m+[m[32m group_interval: 10s[m
[32m+[m[32m repeat_interval: 1h[m
[32m+[m[32m receiver: 'telepush' #Название ресивера, который будет обрабатывать алерты.[m
[32m+[m
[32m+[m[32mreceivers:[m
[32m+[m[32m  - name: 'telepush'[m
[32m+[m[32m    webhook_configs:[m
[32m+[m[32m      - url: 'https://telepush.dev/api/inlets/alertmanager/41dd81' #URL с токеном после последнего слеша[m
[32m+[m
[32m+[m[32minhibit_rules:[m
[32m+[m[32m  - source_match:[m
[32m+[m[32m      severity: 'critical'[m
[32m+[m[32m    target_match:[m
[32m+[m[32m      severity: 'warning'[m
[32m+[m[32m    equal: ['alertname', 'dev', 'instance'][m
[1mdiff --git a/project/prometheus_stack/grafana/dashboards/dashboards.yml b/project/prometheus_stack/grafana/dashboards/dashboards.yml[m
[1mnew file mode 100644[m
[1mindex 0000000..b643ba4[m
[1m--- /dev/null[m
[1m+++ b/project/prometheus_stack/grafana/dashboards/dashboards.yml[m
[36m@@ -0,0 +1,14 @@[m
[32m+[m[32mapiVersion: 1[m
[32m+[m
[32m+[m[32mproviders:[m
[32m+[m[32m  - name: 'dashboards'[m
[32m+[m[32m    orgId: 1[m
[32m+[m[32m    folder: ''[m
[32m+[m[32m    folderUid: ''[m
[32m+[m[32m    type: file[m
[32m+[m[32m    disableDeletion: false[m
[32m+[m[32m    updateIntervalSeconds: 10[m
[32m+[m[32m    allowUiUpdates: false[m
[32m+[m[32m    options:[m
[32m+[m[32m      path: /etc/grafana/provisioning/dashboards[m
[32m+[m[32m      foldersFromFilesStructure: true[m[41m [m
[1mdiff --git a/project/prometheus_stack/grafana/dashboards/node-exporter-full_rev30.json b/project/prometheus_stack/grafana/dashboards/node-exporter-full_rev30.json[m
[1mnew file mode 100644[m
[1mindex 0000000..8b9b501[m
[1m--- /dev/null[m
[1m+++ b/project/prometheus_stack/grafana/dashboards/node-exporter-full_rev30.json[m
[36m@@ -0,0 +1,23200 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "__inputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m      "name": "DS_PROMETHEUS",[m
[32m+[m[32m      "label": "prometheus",[m
[32m+[m[32m      "description": "",[m
[32m+[m[32m      "type": "datasource",[m
[32m+[m[32m      "pluginId": "prometheus",[m
[32m+[m[32m      "pluginName": "Prometheus"[m
[32m+[m[32m    }[m
[32m+[m[32m  ],[m
[32m+[m[32m  "__elements": {},[m
[32m+[m[32m  "__requires": [[m
[32m+[m[32m    {[m
[32m+[m[32m      "type": "panel",[m
[32m+[m[32m      "id": "gauge",[m
[32m+[m[32m      "name": "Gauge",[m
[32m+[m[32m      "version": ""[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "type": "grafana",[m
[32m+[m[32m      "id": "grafana",[m
[32m+[m[32m      "name": "Grafana",[m
[32m+[m[32m      "version": "9.2.3"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "type": "datasource",[m
[32m+[m[32m      "id": "prometheus",[m
[32m+[m[32m      "name": "Prometheus",[m
[32m+[m[32m      "version": "1.0.0"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "type": "panel",[m
[32m+[m[32m      "id": "stat",[m
[32m+[m[32m      "name": "Stat",[m
[32m+[m[32m      "version": ""[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "type": "panel",[m
[32m+[m[32m      "id": "timeseries",[m
[32m+[m[32m      "name": "Time series",[m
[32m+[m[32m      "version": ""[m
[32m+[m[32m    }[m
[32m+[m[32m  ],[m
[32m+[m[32m  "annotations": {[m
[32m+[m[32m    "list": [[m
[32m+[m[32m      {[m
[32m+[m[32m        "$$hashKey": "object:1058",[m
[32m+[m[32m        "builtIn": 1,[m
[32m+[m[32m        "datasource": {[m
[32m+[m[32m          "type": "datasource",[m
[32m+[m[32m          "uid": "grafana"[m
[32m+[m[32m        },[m
[32m+[m[32m        "enable": true,[m
[32m+[m[32m        "hide": true,[m
[32m+[m[32m        "iconColor": "rgba(0, 211, 255, 1)",[m
[32m+[m[32m        "name": "Annotations & Alerts",[m
[32m+[m[32m        "target": {[m
[32m+[m[32m          "limit": 100,[m
[32m+[m[32m          "matchAny": false,[m
[32m+[m[32m          "tags": [],[m
[32m+[m[32m          "type": "dashboard"[m
[32m+[m[32m        },[m
[32m+[m[32m        "type": "dashboard"[m
[32m+[m[32m      },[m
[32m+[m[32m      {[m
[32m+[m[32m        "datasource": {[m
[32m+[m[32m          "type": "prometheus",[m
[32m+[m[32m          "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m        },[m
[32m+[m[32m        "enable": true,[m
[32m+[m[32m        "expr": "changes(node_boot_time_seconds{instance=\"$node\"}[$__rate_interval])",[m
[32m+[m[32m        "iconColor": "red",[m
[32m+[m[32m        "name": "Reboot"[m
[32m+[m[32m      }[m
[32m+[m[32m    ][m
[32m+[m[32m  },[m
[32m+[m[32m  "editable": true,[m
[32m+[m[32m  "fiscalYearStartMonth": 0,[m
[32m+[m[32m  "gnetId": 1860,[m
[32m+[m[32m  "graphTooltip": 0,[m
[32m+[m[32m  "id": null,[m
[32m+[m[32m  "links": [[m
[32m+[m[32m    {[m
[32m+[m[32m      "icon": "external link",[m
[32m+[m[32m      "tags": [],[m
[32m+[m[32m      "targetBlank": true,[m
[32m+[m[32m      "title": "GitHub",[m
[32m+[m[32m      "type": "link",[m
[32m+[m[32m      "url": "https://github.com/rfmoz/grafana-dashboards"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "icon": "external link",[m
[32m+[m[32m      "tags": [],[m
[32m+[m[32m      "targetBlank": true,[m
[32m+[m[32m      "title": "Grafana",[m
[32m+[m[32m      "type": "link",[m
[32m+[m[32m      "url": "https://grafana.com/grafana/dashboards/1860"[m
[32m+[m[32m    }[m
[32m+[m[32m  ],[m
[32m+[m[32m  "liveNow": false,[m
[32m+[m[32m  "panels": [[m
[32m+[m[32m    {[m
[32m+[m[32m      "collapsed": false,[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 1,[m
[32m+[m[32m        "w": 24,[m
[32m+[m[32m        "x": 0,[m
[32m+[m[32m        "y": 0[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 261,[m
[32m+[m[32m      "panels": [],[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "refId": "A"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "Quick CPU / Mem / Disk",[m
[32m+[m[32m      "type": "row"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Busy state of all CPU cores together",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "max": 100,[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 85[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 95[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percent"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 4,[m
[32m+[m[32m        "w": 3,[m
[32m+[m[32m        "x": 0,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 20,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "showThresholdLabels": false,[m
[32m+[m[32m        "showThresholdMarkers": true[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "(sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode!=\"idle\"}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))) * 100",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "CPU Busy",[m
[32m+[m[32m      "type": "gauge"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Busy state of all CPU cores together (5 min average)",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "max": 100,[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 85[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 95[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percent"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 4,[m
[32m+[m[32m        "w": 3,[m
[32m+[m[32m        "x": 3,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 155,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "showThresholdLabels": false,[m
[32m+[m[32m        "showThresholdMarkers": true[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "avg(node_load5{instance=\"$node\",job=\"$job\"}) /  count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)) * 100",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "Sys Load (5m avg)",[m
[32m+[m[32m      "type": "gauge"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Busy state of all CPU cores together (15 min average)",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "max": 100,[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 85[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 95[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percent"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 4,[m
[32m+[m[32m        "w": 3,[m
[32m+[m[32m        "x": 6,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 19,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "showThresholdLabels": false,[m
[32m+[m[32m        "showThresholdMarkers": true[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "avg(node_load15{instance=\"$node\",job=\"$job\"}) /  count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu)) * 100",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "Sys Load (15m avg)",[m
[32m+[m[32m      "type": "gauge"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Non available RAM memory",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "decimals": 0,[m
[32m+[m[32m          "mappings": [],[m
[32m+[m[32m          "max": 100,[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 90[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percent"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 4,[m
[32m+[m[32m        "w": 3,[m
[32m+[m[32m        "x": 9,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "hideTimeOverride": false,[m
[32m+[m[32m      "id": 16,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "showThresholdLabels": false,[m
[32m+[m[32m        "showThresholdMarkers": true[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "((node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_MemFree_bytes{instance=\"$node\",job=\"$job\"}) / (node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"} )) * 100",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "hide": true,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "100 - ((node_memory_MemAvailable_bytes{instance=\"$node\",job=\"$job\"} * 100) / node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"})",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "B",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "RAM Used",[m
[32m+[m[32m      "type": "gauge"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Used Swap",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "max": 100,[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 10[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 25[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percent"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 4,[m
[32m+[m[32m        "w": 3,[m
[32m+[m[32m        "x": 12,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 21,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "showThresholdLabels": false,[m
[32m+[m[32m        "showThresholdMarkers": true[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "((node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} - node_memory_SwapFree_bytes{instance=\"$node\",job=\"$job\"}) / (node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"} )) * 100",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "SWAP Used",[m
[32m+[m[32m      "type": "gauge"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Used Root FS",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "max": 100,[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 90[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percent"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 4,[m
[32m+[m[32m        "w": 3,[m
[32m+[m[32m        "x": 15,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 154,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "showThresholdLabels": false,[m
[32m+[m[32m        "showThresholdMarkers": true[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"} * 100) / node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"})",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "Root FS Used",[m
[32m+[m[32m      "type": "gauge"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Total number of CPU cores",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "green",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "red",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "short"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 2,[m
[32m+[m[32m        "w": 2,[m
[32m+[m[32m        "x": 18,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 14,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "maxDataPoints": 100,[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "colorMode": "none",[m
[32m+[m[32m        "graphMode": "none",[m
[32m+[m[32m        "justifyMode": "auto",[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "textMode": "auto"[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "count(count(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}) by (cpu))",[m
[32m+[m[32m          "interval": "",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "",[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "CPU Cores",[m
[32m+[m[32m      "type": "stat"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "System uptime",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "decimals": 1,[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "green",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "red",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "s"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 2,[m
[32m+[m[32m        "w": 4,[m
[32m+[m[32m        "x": 20,[m
[32m+[m[32m        "y": 1[m
[32m+[m[32m      },[m
[32m+[m[32m      "hideTimeOverride": true,[m
[32m+[m[32m      "id": 15,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "maxDataPoints": 100,[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "colorMode": "none",[m
[32m+[m[32m        "graphMode": "none",[m
[32m+[m[32m        "justifyMode": "auto",[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "textMode": "auto"[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "node_time_seconds{instance=\"$node\",job=\"$job\"} - node_boot_time_seconds{instance=\"$node\",job=\"$job\"}",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "Uptime",[m
[32m+[m[32m      "type": "stat"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Total RootFS",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "decimals": 0,[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(50, 172, 45, 0.97)",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(237, 129, 40, 0.89)",[m
[32m+[m[32m                "value": 70[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "rgba(245, 54, 54, 0.9)",[m
[32m+[m[32m                "value": 90[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "bytes"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 2,[m
[32m+[m[32m        "w": 2,[m
[32m+[m[32m        "x": 18,[m
[32m+[m[32m        "y": 3[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 23,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "maxDataPoints": 100,[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "colorMode": "none",[m
[32m+[m[32m        "graphMode": "none",[m
[32m+[m[32m        "justifyMode": "auto",[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "textMode": "auto"[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "node_filesystem_size_bytes{instance=\"$node\",job=\"$job\",mountpoint=\"/\",fstype!=\"rootfs\"}",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "RootFS Total",[m
[32m+[m[32m      "type": "stat"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Total RAM",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "decimals": 0,[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "green",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "red",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "bytes"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 2,[m
[32m+[m[32m        "w": 2,[m
[32m+[m[32m        "x": 20,[m
[32m+[m[32m        "y": 3[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 75,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "maxDataPoints": 100,[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "colorMode": "none",[m
[32m+[m[32m        "graphMode": "none",[m
[32m+[m[32m        "justifyMode": "auto",[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "textMode": "auto"[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "node_memory_MemTotal_bytes{instance=\"$node\",job=\"$job\"}",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "RAM Total",[m
[32m+[m[32m      "type": "stat"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Total SWAP",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "thresholds"[m
[32m+[m[32m          },[m
[32m+[m[32m          "decimals": 0,[m
[32m+[m[32m          "mappings": [[m
[32m+[m[32m            {[m
[32m+[m[32m              "options": {[m
[32m+[m[32m                "match": "null",[m
[32m+[m[32m                "result": {[m
[32m+[m[32m                  "text": "N/A"[m
[32m+[m[32m                }[m
[32m+[m[32m              },[m
[32m+[m[32m              "type": "special"[m
[32m+[m[32m            }[m
[32m+[m[32m          ],[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "green",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "red",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "bytes"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 2,[m
[32m+[m[32m        "w": 2,[m
[32m+[m[32m        "x": 22,[m
[32m+[m[32m        "y": 3[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 18,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "maxDataPoints": 100,[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "colorMode": "none",[m
[32m+[m[32m        "graphMode": "none",[m
[32m+[m[32m        "justifyMode": "auto",[m
[32m+[m[32m        "orientation": "horizontal",[m
[32m+[m[32m        "reduceOptions": {[m
[32m+[m[32m          "calcs": [[m
[32m+[m[32m            "lastNotNull"[m
[32m+[m[32m          ],[m
[32m+[m[32m          "fields": "",[m
[32m+[m[32m          "values": false[m
[32m+[m[32m        },[m
[32m+[m[32m        "textMode": "auto"[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.3",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "expr": "node_memory_SwapTotal_bytes{instance=\"$node\",job=\"$job\"}",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "SWAP Total",[m
[32m+[m[32m      "type": "stat"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "collapsed": false,[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 1,[m
[32m+[m[32m        "w": 24,[m
[32m+[m[32m        "x": 0,[m
[32m+[m[32m        "y": 5[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 263,[m
[32m+[m[32m      "panels": [],[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "refId": "A"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "Basic CPU / Mem / Net / Disk",[m
[32m+[m[32m      "type": "row"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Basic CPU info",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "palette-classic"[m
[32m+[m[32m          },[m
[32m+[m[32m          "custom": {[m
[32m+[m[32m            "axisCenteredZero": false,[m
[32m+[m[32m            "axisColorMode": "text",[m
[32m+[m[32m            "axisLabel": "",[m
[32m+[m[32m            "axisPlacement": "auto",[m
[32m+[m[32m            "barAlignment": 0,[m
[32m+[m[32m            "drawStyle": "line",[m
[32m+[m[32m            "fillOpacity": 40,[m
[32m+[m[32m            "gradientMode": "none",[m
[32m+[m[32m            "hideFrom": {[m
[32m+[m[32m              "legend": false,[m
[32m+[m[32m              "tooltip": false,[m
[32m+[m[32m              "viz": false[m
[32m+[m[32m            },[m
[32m+[m[32m            "lineInterpolation": "smooth",[m
[32m+[m[32m            "lineWidth": 1,[m
[32m+[m[32m            "pointSize": 5,[m
[32m+[m[32m            "scaleDistribution": {[m
[32m+[m[32m              "type": "linear"[m
[32m+[m[32m            },[m
[32m+[m[32m            "showPoints": "never",[m
[32m+[m[32m            "spanNulls": false,[m
[32m+[m[32m            "stacking": {[m
[32m+[m[32m              "group": "A",[m
[32m+[m[32m              "mode": "percent"[m
[32m+[m[32m            },[m
[32m+[m[32m            "thresholdsStyle": {[m
[32m+[m[32m              "mode": "off"[m
[32m+[m[32m            }[m
[32m+[m[32m          },[m
[32m+[m[32m          "links": [],[m
[32m+[m[32m          "mappings": [],[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "green",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "red",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "percentunit"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Busy Iowait"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#890F02",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Idle"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#052B51",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Busy Iowait"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#890F02",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Idle"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#7EB26D",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Busy System"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#EAB839",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Busy User"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#0A437C",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Busy Other"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#6D1F62",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          }[m
[32m+[m[32m        ][m
[32m+[m[32m      },[m
[32m+[m[32m      "gridPos": {[m
[32m+[m[32m        "h": 7,[m
[32m+[m[32m        "w": 12,[m
[32m+[m[32m        "x": 0,[m
[32m+[m[32m        "y": 6[m
[32m+[m[32m      },[m
[32m+[m[32m      "id": 77,[m
[32m+[m[32m      "links": [],[m
[32m+[m[32m      "options": {[m
[32m+[m[32m        "legend": {[m
[32m+[m[32m          "calcs": [],[m
[32m+[m[32m          "displayMode": "list",[m
[32m+[m[32m          "placement": "bottom",[m
[32m+[m[32m          "showLegend": true,[m
[32m+[m[32m          "width": 250[m
[32m+[m[32m        },[m
[32m+[m[32m        "tooltip": {[m
[32m+[m[32m          "mode": "multi",[m
[32m+[m[32m          "sort": "desc"[m
[32m+[m[32m        }[m
[32m+[m[32m      },[m
[32m+[m[32m      "pluginVersion": "9.2.0",[m
[32m+[m[32m      "targets": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"system\"}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "Busy System",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "A",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"user\"}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "hide": false,[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "Busy User",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "B",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"iowait\"}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "Busy Iowait",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "C",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=~\".*irq\"}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "Busy IRQs",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "D",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode!='idle',mode!='user',mode!='system',mode!='iowait',mode!='irq',mode!='softirq'}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "Busy Other",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "E",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "datasource": {[m
[32m+[m[32m            "type": "prometheus",[m
[32m+[m[32m            "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m          },[m
[32m+[m[32m          "editorMode": "code",[m
[32m+[m[32m          "expr": "sum by(instance) (irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\", mode=\"idle\"}[$__rate_interval])) / on(instance) group_left sum by (instance)((irate(node_cpu_seconds_total{instance=\"$node\",job=\"$job\"}[$__rate_interval])))",[m
[32m+[m[32m          "format": "time_series",[m
[32m+[m[32m          "intervalFactor": 1,[m
[32m+[m[32m          "legendFormat": "Idle",[m
[32m+[m[32m          "range": true,[m
[32m+[m[32m          "refId": "F",[m
[32m+[m[32m          "step": 240[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "title": "CPU Basic",[m
[32m+[m[32m      "type": "timeseries"[m
[32m+[m[32m    },[m
[32m+[m[32m    {[m
[32m+[m[32m      "datasource": {[m
[32m+[m[32m        "type": "prometheus",[m
[32m+[m[32m        "uid": "${DS_PROMETHEUS}"[m
[32m+[m[32m      },[m
[32m+[m[32m      "description": "Basic memory usage",[m
[32m+[m[32m      "fieldConfig": {[m
[32m+[m[32m        "defaults": {[m
[32m+[m[32m          "color": {[m
[32m+[m[32m            "mode": "palette-classic"[m
[32m+[m[32m          },[m
[32m+[m[32m          "custom": {[m
[32m+[m[32m            "axisCenteredZero": false,[m
[32m+[m[32m            "axisColorMode": "text",[m
[32m+[m[32m            "axisLabel": "",[m
[32m+[m[32m            "axisPlacement": "auto",[m
[32m+[m[32m            "barAlignment": 0,[m
[32m+[m[32m            "drawStyle": "line",[m
[32m+[m[32m            "fillOpacity": 40,[m
[32m+[m[32m            "gradientMode": "none",[m
[32m+[m[32m            "hideFrom": {[m
[32m+[m[32m              "legend": false,[m
[32m+[m[32m              "tooltip": false,[m
[32m+[m[32m              "viz": false[m
[32m+[m[32m            },[m
[32m+[m[32m            "lineInterpolation": "linear",[m
[32m+[m[32m            "lineWidth": 1,[m
[32m+[m[32m            "pointSize": 5,[m
[32m+[m[32m            "scaleDistribution": {[m
[32m+[m[32m              "type": "linear"[m
[32m+[m[32m            },[m
[32m+[m[32m            "showPoints": "never",[m
[32m+[m[32m            "spanNulls": false,[m
[32m+[m[32m            "stacking": {[m
[32m+[m[32m              "group": "A",[m
[32m+[m[32m              "mode": "normal"[m
[32m+[m[32m            },[m
[32m+[m[32m            "thresholdsStyle": {[m
[32m+[m[32m              "mode": "off"[m
[32m+[m[32m            }[m
[32m+[m[32m          },[m
[32m+[m[32m          "links": [],[m
[32m+[m[32m          "mappings": [],[m
[32m+[m[32m          "min": 0,[m
[32m+[m[32m          "thresholds": {[m
[32m+[m[32m            "mode": "absolute",[m
[32m+[m[32m            "steps": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "green",[m
[32m+[m[32m                "value": null[m
[32m+[m[32m              },[m
[32m+[m[32m              {[m
[32m+[m[32m                "color": "red",[m
[32m+[m[32m                "value": 80[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          "unit": "bytes"[m
[32m+[m[32m        },[m
[32m+[m[32m        "overrides": [[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Apps"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#629E51",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          },[m
[32m+[m[32m          {[m
[32m+[m[32m            "matcher": {[m
[32m+[m[32m              "id": "byName",[m
[32m+[m[32m              "options": "Buffers"[m
[32m+[m[32m            },[m
[32m+[m[32m            "properties": [[m
[32m+[m[32m              {[m
[32m+[m[32m                "id": "color",[m
[32m+[m[32m                "value": {[m
[32m+[m[32m                  "fixedColor": "#614D93",[m
[32m+[m[32m                  "mode": "fixed"[m
[32m+[m[32m                }[m
[32m+[m[32m              }[m
[32m+[m[32m            ][m
[32m+[m[32m          }