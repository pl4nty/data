local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1
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
L2_1 = MpCommon
L2_1 = L2_1.GetImagePathFromPid
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L1_1
L3_1 = L3_1(L4_1)
L1_1 = L3_1
if not L2_1 and not L1_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = contains
L4_1 = L2_1
L5_1 = {}
L6_1 = "powershell.exe"
L7_1 = "cmd.exe"
L5_1[1] = L6_1
L5_1[2] = L7_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = string
L3_1 = L3_1.gsub
L4_1 = L1_1
L5_1 = "[\"'()+]"
L6_1 = ""
L3_1 = L3_1(L4_1, L5_1, L6_1)
L1_1 = L3_1
L3_1 = StringEndsWith
L4_1 = L1_1
L5_1 = "|iex"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
