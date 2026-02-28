local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.image_path
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1.image_path
L1_1 = L1_1(L2_1)
L3_1 = L1_1
L2_1 = L1_1.match
L4_1 = "([^\\]+)$"
L2_1 = L2_1(L3_1, L4_1)
if L2_1 ~= "explorer.exe" then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetScannedPPID
L2_1 = L2_1()
if L2_1 == "" or L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.GetProcessCommandLine
L4_1 = L2_1
L3_1 = L3_1(L4_1)
L4_1 = MpCommon
L4_1 = L4_1.GetImagePathFromPid
L5_1 = L2_1
L4_1 = L4_1(L5_1)
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L3_1
L5_1 = L5_1(L6_1)
L3_1 = L5_1
if not L4_1 and not L3_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L4_1
L7_1 = {}
L8_1 = "powershell.exe"
L9_1 = "cmd.exe"
L7_1[1] = L8_1
L7_1[2] = L9_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.gsub
L6_1 = L3_1
L7_1 = "[\"'()+]"
L8_1 = ""
L5_1 = L5_1(L6_1, L7_1, L8_1)
L3_1 = L5_1
L5_1 = containsall
L6_1 = L3_1
L7_1 = {}
L8_1 = "powershell"
L9_1 = "curl"
L7_1[1] = L8_1
L7_1[2] = L9_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = contains
L6_1 = L3_1
L7_1 = {}
L8_1 = "powershell -"
L9_1 = "iex"
L10_1 = "iwr"
L7_1[1] = L8_1
L7_1[2] = L9_1
L7_1[3] = L10_1
L5_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
