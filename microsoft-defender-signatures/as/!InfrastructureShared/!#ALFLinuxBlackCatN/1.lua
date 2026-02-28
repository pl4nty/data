local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 4) then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = {}
L2_1 = "/ansible"
L3_1 = "/snap/"
L4_1 = "/splunkd/"
L5_1 = "/oracle/"
L6_1 = "-salt-"
L7_1 = "/tmp/go-build"
L8_1 = "/var/intel"
L9_1 = "/var/cache"
L10_1 = "/var/arcticwolfnetworks"
L11_1 = "/jenkins"
L12_1 = "/filebeat"
L13_1 = ".kubectl"
L14_1 = "clamav-"
L15_1 = ".tivoli"
L16_1 = "containerd-shim"
L17_1 = "docker-"
L18_1 = "influx_"
L19_1 = "influxd"
L20_1 = "terraform-"
L21_1 = "zscaler-"
L22_1 = "/tmp/apt-key-gpg"
L23_1 = "common-setup-and-utils-script.sh"
L24_1 = "mdatp-edr-mitre-setup.sh"
L25_1 = "mdatp-epp-mitre-setup.sh"
L26_1 = "amazon-ssm-agent"
L1_1[1] = L2_1
L1_1[2] = L3_1
L1_1[3] = L4_1
L1_1[4] = L5_1
L1_1[5] = L6_1
L1_1[6] = L7_1
L1_1[7] = L8_1
L1_1[8] = L9_1
L1_1[9] = L10_1
L1_1[10] = L11_1
L1_1[11] = L12_1
L1_1[12] = L13_1
L1_1[13] = L14_1
L1_1[14] = L15_1
L1_1[15] = L16_1
L1_1[16] = L17_1
L1_1[17] = L18_1
L1_1[18] = L19_1
L1_1[19] = L20_1
L1_1[20] = L21_1
L1_1[21] = L22_1
L1_1[22] = L23_1
L1_1[23] = L24_1
L1_1[24] = L25_1
L1_1[25] = L26_1
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = string
  L7_1 = L7_1.find
  L8_1 = L0_1
  L9_1 = L6_1
  L10_1 = 1
  L11_1 = true
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L2_1 = {}
L3_1 = "/scripts/smb_common.py"
L4_1 = "/scripts/smb_copy_and_exec.py"
L5_1 = "/scripts/smb_exec.py"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L9_1 = L0_1
  L8_1 = L0_1.sub
  L10_1 = #L7_1
  L10_1 = -1 * L10_1
  L8_1 = L8_1(L9_1, L10_1)
  if L8_1 == L7_1 then
    L8_1 = mp
    L8_1 = L8_1.INFECTED
    return L8_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
