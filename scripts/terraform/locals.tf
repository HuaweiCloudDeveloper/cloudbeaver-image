locals {
  // you need to specify a unique name under a tenant according to the business, which will be used as part of the resource name
  app_id = format("%s-%s", "app", formatdate("hhmm", timestamp()))

  name_suffix = "mkp"

  // Tags of HUAWEI CLOUD resources. You can add tags to resources to classify resources.
  // for more details, please refer to https://support.huaweicloud.com/usermanual-tms/zh-cn_topic_0056266263.html
  tags = { Purpose = "MkpApplication" }



  # Configuration of the ECS memory size and number of cores
  # instance_flavor_cpu    = 4
  # instance_flavor_memory = 16
  #  通用计算增强型
  instance_performance_type = "kunpeng_computing"
  # 系统盘: 通用SSD
  ecs_volume_type = "GPSSD"

  # 规格：通用入门型
  #ecs_flavor = "kc1.xlarge.4"

  // Billing model for cloud resources, You need to modify it according to your actual situation.
  // In the development and testing phase, pay-per-use billing is recommended.
  // You can also set these three parameters as variables, allowing users to select at deployment time.
  charging_mode = var.charging_mode
  period_unit   = var.period_unit
  period        = var.period

  // The billing model for bandwidth, You need to modify it according to your actual situation.
  publicip_type         = "5_bgp"     # 全动态
  bandwidth_share_type  = "PER"       # 独享带宽
  bandwidth_charge_mode = "bandwidth" # 按带宽计费
  bandwidth_size        = 10          # 带宽大小

  # Image information in different regions, you need to enter your own image ID or add another region.
  # For Marketplace Image Id,you can log in to Seller Console, view the marketplace image id on Product Specifications section of My Products detail page.
  # 镜像版本：
  #CloudBeaver25.0.4-HCE2.0
  instance_image_id_maps_v1 = {
#     北京4
    cn-north-4     = "bff1616f-ec43-42b8-9afa-680c7c71157a"
#     广州
    cn-south-1     = "67c13ad8-a643-4d46-b2be-a2053975516e"
#     上海一
    cn-east-3      = "cdc0fa5d-e104-4e7f-a2dc-2ed62e381335"
#     乌兰察布一
    cn-north-9     = "48f5d15f-98eb-49ad-aaeb-809ece19bbbc"
#     贵阳一
    cn-southwest-2 = "4b27216b-e314-49b7-b49f-d2c078536023"

  }
  #CloudBeaver25.0.4-Ubuntu24.04
  instance_image_id_maps_v2 = {
#     北京4
    cn-north-4     = "db893046-9a3e-44f3-8db5-0514b034eb0c"
#     广州
    cn-south-1     = "c1da0f91-33dd-4554-954c-b6aa7df752ad"
#     上海一
    cn-east-3      = "a953422f-a641-4a79-a72d-5d805e880df9"
#     乌兰察布一
    cn-north-9     = "5bf2d9e5-9e83-45b4-99e4-375075ad135f"
#     贵阳一
    cn-southwest-2 = "8477efdf-c44c-4b3c-9421-28c040dac172"

  }  
  # # 其他版本增加（注意修改var参数和镜像的版本的判断部分）
  #  instance_image_id_maps = {
  #   #     北京4
  #   cn-north-4 = ""
  #  }  

  # Specifies the DNS server address list of a subnet. For details about the private DNS address, see https://support.huaweicloud.com/dns_faq/dns_faq_002.html#?
  subnet_dns_list_maps = {
    cn-north-4     = ["100.125.1.250", "100.125.129.250"]
    cn-south-1     = ["100.125.1.250", "100.125.136.29"]
    cn-east-3      = ["100.125.1.250", "100.125.64.250"]
    cn-north-9     = ["100.125.1.250", "100.125.107.250"]
    cn-southwest-2 = ["100.125.1.250", "100.125.129.250"]
  }


}