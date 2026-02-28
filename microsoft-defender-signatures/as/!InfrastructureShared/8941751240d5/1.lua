local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = tonumber
L1_1 = nri
L1_1 = L1_1.GetHttpResponseHeader
L2_1 = "Content-Length"
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1 = L1_1(L2_1)
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1)
if 15000 < L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = nri
L1_1 = L1_1.GetRawResponseBlob
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = {}
  L3_1 = "exec"
  L4_1 = "exploit"
  L5_1 = "binary"
  L6_1 = "start"
  L2_1[1] = L3_1
  L2_1[2] = L4_1
  L2_1[3] = L5_1
  L2_1[4] = L6_1
  L3_1 = contains
  L4_1 = L1_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = {}
    L4_1 = "wget"
    L5_1 = "curl"
    L6_1 = "powershell"
    L7_1 = "bash"
    L8_1 = "certutil"
    L9_1 = "cmd"
    L10_1 = "mshta"
    L11_1 = "python"
    L12_1 = "bitsadmin"
    L3_1[1] = L4_1
    L3_1[2] = L5_1
    L3_1[3] = L6_1
    L3_1[4] = L7_1
    L3_1[5] = L8_1
    L3_1[6] = L9_1
    L3_1[7] = L10_1
    L3_1[8] = L11_1
    L3_1[9] = L12_1
    L4_1 = contains
    L5_1 = L1_1
    L6_1 = L3_1
    L4_1 = L4_1(L5_1, L6_1)
    if L4_1 then
      L4_1 = reportHeaders
      L5_1 = {}
      L6_1 = "Host"
      L7_1 = "User-Agent"
      L5_1[1] = L6_1
      L5_1[2] = L7_1
      L4_1(L5_1)
      L4_1 = mp
      L4_1 = L4_1.INFECTED
      return L4_1
    end
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
