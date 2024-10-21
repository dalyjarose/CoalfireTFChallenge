*NOTE: change the subscriber_id to a different subscription before applying this code.
A company is looking to create a proof-of-concept environment in Azure. They want a simple VNet as outlined
below. The company would also like to use terraform to manage their infrastructure via code.
• 1 VNet – 10.0.0.0/16
• 4 subnets
• Sub1 – 10.0.0.0/24
• Sub2 – 10.0.1.0/24
• Sub3 – 10.0.2.0/24
• Sub4 – 10.0.3.0/24
• 2 Virtual Machine in an availability set running RedHat in subnet sub1
• 256 GB storage

• Standard_DS1_v2
• NSG allows SSH from internal VNet
• 1 Virtual Machine running RedHat in subnet sub3
• 32GB storage
• Script the installation of apache on this instance
• Standard_DS1_v2
• NSG allows traffic from internal VNet and ALB
• 1 Azure load balancer that listens on port 80 and forwards traffic to the instance in sub3
• Storage account that only allows traffic from the VNet

