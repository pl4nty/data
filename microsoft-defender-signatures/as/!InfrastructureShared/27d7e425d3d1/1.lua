local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.GetScannedPPID
L0_1 = L0_1()
if L0_1 == "" or L0_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetProcessCommandLine
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = L1_1
  L2_1 = L2_1(L3_1)
  L1_1 = L2_1
end
L2_1 = string
L2_1 = L2_1.gsub
L3_1 = L1_1
L4_1 = "[\"'`^()+#&]"
L5_1 = ""
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = contains
L4_1 = L2_1
L5_1 = {}
L6_1 = "join '');start-process ($"
L7_1 = "net.webclient"
L8_1 = "webhooks"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = contains
L4_1 = L2_1
L5_1 = {}
L6_1 = "mshta.exe"
L7_1 = "powershell.exe"
L8_1 = "cmd.exe"
L5_1[1] = L6_1
L5_1[2] = L7_1
L5_1[3] = L8_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = isIEXfound
L4_1 = L2_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
