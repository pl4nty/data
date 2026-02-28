local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.bitor
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L3_1 = mp
L3_1 = L3_1.FILEPATH_QUERY_LOWERCASE
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1 = L1_1(L2_1, L3_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1)
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
L2_1 = "/usr/"
L3_1 = "/var/lib/"
L4_1 = "/bin/"
L5_1 = "/var/log/"
L6_1 = "/var/opt/"
L7_1 = "/opt/"
L8_1 = "/etc/"
L9_1 = "/snap/"
L10_1 = "/proc/"
L11_1 = "/sbin/"
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
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L8_1 = L0_1
  L7_1 = L0_1.sub
  L9_1 = 1
  L10_1 = #L6_1
  L7_1 = L7_1(L8_1, L9_1, L10_1)
  if L7_1 == L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L2_1 = {}
L3_1 = "/ansible"
L4_1 = "/snap/"
L5_1 = "/splunkd/"
L6_1 = "/oracle/"
L7_1 = "-salt-"
L8_1 = "/tmp/go-build"
L9_1 = "/var/intel"
L10_1 = "/var/cache"
L11_1 = "/var/arcticwolfnetworks"
L12_1 = "/jenkins"
L13_1 = "/filebeat"
L14_1 = ".kubectl"
L15_1 = "clamav-"
L16_1 = ".tivoli"
L17_1 = "containerd-shim"
L18_1 = "docker-"
L19_1 = "influx_"
L20_1 = "influxd"
L21_1 = "terraform-"
L22_1 = "zscaler-"
L23_1 = "/tmp/apt-key-gpg"
L24_1 = "common-setup-and-utils-script.sh"
L25_1 = "mdatp-edr-mitre-setup.sh"
L26_1 = "mdatp-epp-mitre-setup.sh"
L27_1 = "amazon-ssm-agent"
L2_1[1] = L3_1
L2_1[2] = L4_1
L2_1[3] = L5_1
L2_1[4] = L6_1
L2_1[5] = L7_1
L2_1[6] = L8_1
L2_1[7] = L9_1
L2_1[8] = L10_1
L2_1[9] = L11_1
L2_1[10] = L12_1
L2_1[11] = L13_1
L2_1[12] = L14_1
L2_1[13] = L15_1
L2_1[14] = L16_1
L2_1[15] = L17_1
L2_1[16] = L18_1
L2_1[17] = L19_1
L2_1[18] = L20_1
L2_1[19] = L21_1
L2_1[20] = L22_1
L2_1[21] = L23_1
L2_1[22] = L24_1
L2_1[23] = L25_1
L2_1[24] = L26_1
L2_1[25] = L27_1
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = string
  L8_1 = L8_1.find
  L9_1 = L0_1
  L10_1 = L7_1
  L11_1 = 1
  L12_1 = true
  L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
  if L8_1 then
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    return L8_1
  end
end
L3_1 = {}
L4_1 = "/app/controller"
L5_1 = "/app/payload"
L3_1[1] = L4_1
L3_1[2] = L5_1
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L10_1 = L0_1
  L9_1 = L0_1.sub
  L11_1 = #L8_1
  L11_1 = -1 * L11_1
  L9_1 = L9_1(L10_1, L11_1)
  if L9_1 == L8_1 then
    L9_1 = mp
    L9_1 = L9_1.INFECTED
    return L9_1
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
