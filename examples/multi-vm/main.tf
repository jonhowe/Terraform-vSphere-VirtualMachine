# Author: Jon Howe
# Blog: https://www.virtjunkie.com/vmware-provisioning-using-hashicorp-terraform-part-2/
# GitHub: https://github.com/jonhowe/Terraform-vSphere-VirtualMachine/blob/master/examples/multi-vm/main.tf

module "DC1" {
  is_windows_image = "1"
  source         = "github.com/jonhowe/Terraform-vSphere-VirtualMachine/"
  vsphere_server = "vcenter.home.lab"
  vsphere_user = "administrator@vsphere.local"
  vsphere_password = "VMware1!"
  adminpassword = "terraform"
  datacenter = "VirtJunkie-DC"
  datastore = "vsanDatastore"
  cluster = "VirtJunkie"
  portgroup = "100-LabNetwork"
  domain_name = "home.lab"
  default_gw = "172.16.1.1"
  template_name = "WS16-CORE"
  vm_name = "DC1"
  vm_ip = "172.16.1.150"
  vm_cidr = 24
  vcpu_count = 1
  memory = 1024
}
module "MGMT" {
  is_windows_image = "1"
  source         = "github.com/jonhowe/Terraform-vSphere-VirtualMachine/"
  vsphere_server = "vcenter.home.lab"
  vsphere_user = "administrator@vsphere.local"
  vsphere_password = "VMware1!"
  adminpassword = "terraform"
  datacenter = "VirtJunkie-DC"
  datastore = "vsanDatastore"
  cluster = "VirtJunkie"
  portgroup = "100-LabNetwork"
  domain_name = "home.lab"
  default_gw = "172.16.1.1"
  template_name = "WS16-GUI"
  vm_name = "Mgmt"
  vm_ip = "172.16.1.151"
  vm_cidr = 24
  vcpu_count = 2
  memory = 4096
}

module "IAAS" {
  is_windows_image = "1"
  source         = "github.com/jonhowe/Terraform-vSphere-VirtualMachine/"
  vsphere_server = "vcenter.home.lab"
  vsphere_user = "administrator@vsphere.local"
  vsphere_password = "VMware1!"
  adminpassword = "terraform"
  datacenter = "VirtJunkie-DC"
  datastore = "vsanDatastore"
  cluster = "VirtJunkie"
  portgroup = "100-LabNetwork"
  domain_name = "home.lab"
  default_gw = "172.16.1.1"
  template_name = "WS16-GUI"
  vm_name = "IAAS"
  vm_ip = "172.16.1.159"
  vm_cidr = 24
  vcpu_count = 2
  memory = 4096
}
