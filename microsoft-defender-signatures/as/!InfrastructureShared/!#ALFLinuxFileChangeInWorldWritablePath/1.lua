local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1
L0_1 = mp
L0_1 = L0_1.get_contextdata
L1_1 = mp
L1_1 = L1_1.CONTEXT_DATA_SCANREASON
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L0_1 ~= L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.getfilesize
L1_1 = L1_1()
if L1_1 == nil or 10485760 < L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.getfilename
L3_1 = mp
L3_1 = L3_1.bitor
L4_1 = mp
L4_1 = L4_1.FILEPATH_QUERY_FULL
L5_1 = mp
L5_1 = L5_1.FILEPATH_QUERY_LOWERCASE
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 4) then
    goto lbl_41
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_41::
L3_1 = {}
L4_1 = "/var/tmp/mkinitramfs"
L5_1 = "/ansible"
L6_1 = "/snap/"
L7_1 = "/splunkd/"
L8_1 = "/oracle/"
L9_1 = "-salt-"
L10_1 = "/tmp/go-build"
L11_1 = "/var/intel"
L12_1 = "/var/cache"
L13_1 = "/var/arcticwolfnetworks"
L14_1 = "/jenkins"
L15_1 = "/filebeat"
L16_1 = ".kubectl"
L17_1 = "clamav-"
L18_1 = ".tivoli"
L19_1 = "containerd-shim"
L20_1 = "docker-"
L21_1 = "influx_"
L22_1 = "influxd"
L23_1 = "terraform-"
L24_1 = "zscaler-"
L25_1 = "/tmp/apt-key-gpg"
L26_1 = "/var/tmp/dracut"
L27_1 = "common-setup-and-utils-script.sh"
L28_1 = "mdatp-edr-mitre-setup.sh"
L29_1 = "mdatp-epp-mitre-setup.sh"
L30_1 = "amazon-ssm-agent"
L3_1[1] = L4_1
L3_1[2] = L5_1
L3_1[3] = L6_1
L3_1[4] = L7_1
L3_1[5] = L8_1
L3_1[6] = L9_1
L3_1[7] = L10_1
L3_1[8] = L11_1
L3_1[9] = L12_1
L3_1[10] = L13_1
L3_1[11] = L14_1
L3_1[12] = L15_1
L3_1[13] = L16_1
L3_1[14] = L17_1
L3_1[15] = L18_1
L3_1[16] = L19_1
L3_1[17] = L20_1
L3_1[18] = L21_1
L3_1[19] = L22_1
L3_1[20] = L23_1
L3_1[21] = L24_1
L3_1[22] = L25_1
L3_1[23] = L26_1
L3_1[24] = L27_1
L3_1[25] = L28_1
L3_1[26] = L29_1
L3_1[27] = L30_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = string
  L9_1 = L9_1.find
  L10_1 = L2_1
  L11_1 = L8_1
  L12_1 = 1
  L13_1 = true
  L9_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
  if L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L4_1 = {}
L5_1 = "/var/tmp/"
L6_1 = "/tmp/"
L7_1 = "/dev/shm/"
L8_1 = "/root/"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L11_1 = L2_1
  L10_1 = L2_1.sub
  L12_1 = 1
  L13_1 = #L9_1
  L10_1 = L10_1(L11_1, L12_1, L13_1)
  if L10_1 == L9_1 then
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
