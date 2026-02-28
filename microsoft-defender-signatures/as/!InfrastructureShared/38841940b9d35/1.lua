local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1
L1_1 = {}
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[1]
  L2_1 = L2_1.utf8p1
  if L2_1 ~= nil then
    L2_1 = string
    L2_1 = L2_1.lower
    L3_1 = this_sigattrlog
    L3_1 = L3_1[1]
    L3_1 = L3_1.utf8p1
    L2_1 = L2_1(L3_1)
    L0_1 = L2_1
  end
end
if not L0_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = tonumber
L3_1 = nri
L3_1 = L3_1.GetHttpResponseHeader
L4_1 = "Content-Length"
L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1)
if L2_1 and 15000 < L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = nri
L3_1 = L3_1.GetRawRequestBlob
L3_1 = L3_1()
if L3_1 == nil then
  L4_1 = nri
  L4_1 = L4_1.GetRawResponseBlob
  L4_1 = L4_1()
  L3_1 = L4_1
end
if L3_1 == nil then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = {}
L5_1 = "exec"
L6_1 = "exploit"
L7_1 = "binary"
L8_1 = "start"
L9_1 = "child_process"
L10_1 = "_chunks"
L11_1 = "execsync"
L4_1[1] = L5_1
L4_1[2] = L6_1
L4_1[3] = L7_1
L4_1[4] = L8_1
L4_1[5] = L9_1
L4_1[6] = L10_1
L4_1[7] = L11_1
L5_1 = contains
L6_1 = L3_1
L7_1 = L4_1
L5_1 = L5_1(L6_1, L7_1)
if L5_1 then
  L5_1 = {}
  L6_1 = "wget"
  L7_1 = "curl"
  L8_1 = "powershell"
  L9_1 = "bash"
  L10_1 = "certutil"
  L11_1 = "cmd"
  L12_1 = "mshta"
  L13_1 = "python"
  L14_1 = "bitsadmin"
  L15_1 = "/bin/sh"
  L16_1 = "nc "
  L17_1 = "touch"
  L18_1 = "/tmp/"
  L19_1 = "/etc/"
  L20_1 = "shell"
  L21_1 = "pwned"
  L5_1[1] = L6_1
  L5_1[2] = L7_1
  L5_1[3] = L8_1
  L5_1[4] = L9_1
  L5_1[5] = L10_1
  L5_1[6] = L11_1
  L5_1[7] = L12_1
  L5_1[8] = L13_1
  L5_1[9] = L14_1
  L5_1[10] = L15_1
  L5_1[11] = L16_1
  L5_1[12] = L17_1
  L5_1[13] = L18_1
  L5_1[14] = L19_1
  L5_1[15] = L20_1
  L5_1[16] = L21_1
  L6_1 = contains
  L7_1 = L3_1
  L8_1 = L5_1
  L6_1 = L6_1(L7_1, L8_1)
  if L6_1 then
    L6_1 = nri
    L6_1 = L6_1.GetURI
    L6_1 = L6_1()
    if L6_1 then
      L1_1.uri = L6_1
    end
    L1_1.dest_address = L0_1
    L7_1 = tohex
    L8_1 = L3_1
    L7_1 = L7_1(L8_1)
    L1_1.NRI_RBlob = L7_1
    L7_1 = nri
    L7_1 = L7_1.AddTelemetry
    L8_1 = mp
    L8_1 = L8_1.bitor
    L9_1 = mp
    L9_1 = L9_1.bitor
    L10_1 = nri
    L10_1 = L10_1.Telemetry_HOSTNAME
    L11_1 = nri
    L11_1 = L11_1.Telemetry_PATH
    L9_1 = L9_1(L10_1, L11_1)
    L10_1 = nri
    L10_1 = L10_1.Telemetry_QUERY
    L8_1 = L8_1(L9_1, L10_1)
    L9_1 = L1_1
    L7_1(L8_1, L9_1)
    L7_1 = reportHeaders
    L8_1 = {}
    L9_1 = "Host"
    L10_1 = "User-Agent"
    L8_1[1] = L9_1
    L8_1[2] = L10_1
    L7_1(L8_1)
    L7_1 = mp
    L7_1 = L7_1.INFECTED
    return L7_1
  end
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
