local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
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
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L1_1 = L2_1
L2_1 = StringEndsWith
L3_1 = L1_1
L4_1 = "-nologo -inputformat text -noexit -executionpolicy unrestricted -command -"
L2_1 = L2_1(L3_1, L4_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetParentProcInfo
L2_1 = L2_1()
if L2_1 ~= nil then
  L3_1 = L2_1.image_path
  if L3_1 ~= nil then
    goto lbl_40
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_40::
L3_1 = string
L3_1 = L3_1.lower
L4_1 = L2_1.image_path
L3_1 = L3_1(L4_1)
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L5_1 = L3_1
L4_1 = L3_1.match
L6_1 = "^(.*)\\[^\\]+$"
L4_1 = L4_1(L5_1, L6_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = "\\\\appdata\\\\local\\\\temp\\\\[a-z0-9]{10,}$"
L6_1 = false
L7_1 = MpCommon
L7_1 = L7_1.StringRegExpSearch
L8_1 = L5_1
L9_1 = L4_1
L7_1, L8_1 = L7_1(L8_1, L9_1)
_ = L8_1
L6_1 = L7_1
if L6_1 == false then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.INFECTED
return L7_1
