//Configure the Google Cloud Provider
provider "google" {
 credentials = file("NTI-320-Atom-Smasher-228dc54f6c41.json")
 project     = "banded-hexagon-163902"
 region      = "us-central1"
}
// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
 byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
 name         = "apache-vm-${random_id.instance_id.hex}"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

metadata = {
   ssh-keys = "elibrown_scc:${file("~/.ssh/id_rsa.pub")}"
 }
// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get -y install apache2;  sudo apt-get update; sudo apt-get install -yq build-essential; sudo systemctl start apache2 sudo stsyemctl enable apache2"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}
