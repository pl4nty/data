local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1
L0_1 = versioning
L0_1 = L0_1.GetOrgID
L0_1 = L0_1()
if L0_1 ~= nil and L0_1 ~= "" then
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "9d61afa0-cfa4-4746-95af-dc897a6f6774" then
    goto lbl_19
  end
  L2_1 = L0_1
  L1_1 = L0_1.lower
  L1_1 = L1_1(L2_1)
  if L1_1 == "73a99e52-c380-4b86-9d47-fe1cb231f222" then
    goto lbl_19
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_19::
L1_1 = mp
L1_1 = L1_1.get_contextdata
L2_1 = mp
L2_1 = L2_1.CONTEXT_DATA_SCANREASON
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.SCANREASON_ONMODIFIEDHANDLECLOSE
if L1_1 ~= L2_1 then
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
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1 = L3_1(L4_1, L5_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1)
if L2_1 ~= nil then
  L3_1 = #L2_1
  if not (L3_1 < 4) then
    goto lbl_49
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L3_1 = mp
L3_1 = L3_1.getfilesize
L3_1 = L3_1()
if 104857600 < L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = {}
L4_1 = "/usr/"
L5_1 = "/var/lib/"
L6_1 = "/bin/"
L7_1 = "/var/log/"
L8_1 = "/var/opt/"
L9_1 = "/opt/"
L10_1 = "/etc/"
L11_1 = "/snap/"
L12_1 = "/proc/"
L13_1 = "/sbin/"
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
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L10_1 = L2_1
  L9_1 = L2_1.sub
  L11_1 = 1
  L12_1 = #L8_1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  if L9_1 == L8_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
end
L4_1 = {}
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
L26_1 = "common-setup-and-utils-script.sh"
L27_1 = "mdatp-edr-mitre-setup.sh"
L28_1 = "mdatp-epp-mitre-setup.sh"
L29_1 = "amazon-ssm-agent"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L4_1[8] = L12_1
L4_1[9] = L13_1
L4_1[10] = L14_1
L4_1[11] = L15_1
L4_1[12] = L16_1
L4_1[13] = L17_1
L4_1[14] = L18_1
L4_1[15] = L19_1
L4_1[16] = L20_1
L4_1[17] = L21_1
L4_1[18] = L22_1
L4_1[19] = L23_1
L4_1[20] = L24_1
L4_1[21] = L25_1
L4_1[22] = L26_1
L4_1[23] = L27_1
L4_1[24] = L28_1
L4_1[25] = L29_1
L5_1 = ipairs
L6_1 = L4_1
L5_1, L6_1, L7_1 = L5_1(L6_1)
for L8_1, L9_1 in L5_1, L6_1, L7_1 do
  L10_1 = string
  L10_1 = L10_1.find
  L11_1 = L2_1
  L12_1 = L9_1
  L13_1 = 1
  L14_1 = true
  L10_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  if L10_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
