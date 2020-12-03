resource "google_compute_firewall" "firewall_proxy" {
  name = "firewall-k8s-node"

  # Название сети, в которой действует правило
  network = "default"

  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = var.ports
  }

  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с перечисленными тэгами
  target_tags = ["k8s-node"]
}

resource "google_compute_project_metadata" "default" {
  metadata = {
    ssh-keys = "${var.user}:${file(var.public_key_path)}"
  }
}

resource "google_compute_instance" "node" {
  count        = var.vm_count
  name         = "node-${count.index}"
  machine_type = "g1-small"
  zone         = var.zone
  tags         = ["k8s-node"]


  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }

  connection {
    type        = "ssh"
    user        = var.user
    agent       = false
    private_key = file(var.private_key_path)
  }
  
}
