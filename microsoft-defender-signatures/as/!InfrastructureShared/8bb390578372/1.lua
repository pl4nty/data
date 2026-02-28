local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[2]
  L0_1 = L0_1.utf8p1
  if L0_1 ~= nil then
    goto lbl_14
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
do return L0_1 end
::lbl_14::
L0_1 = string
L0_1 = L0_1.lower
L1_1 = this_sigattrlog
L1_1 = L1_1[2]
L1_1 = L1_1.utf8p1
L0_1 = L0_1(L1_1)
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.ExpandEnvironmentVariables
L3_1 = "%SystemDrive%\\Program Files (x86)\\Common Files\\"
L2_1, L3_1, L4_1, L5_1 = L2_1(L3_1)
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
L2_1 = string
L2_1 = L2_1.lower
L3_1 = MpCommon
L3_1 = L3_1.ExpandEnvironmentVariables
L4_1 = "%SystemDrive%\\Program Files\\Common Files\\"
L3_1, L4_1, L5_1 = L3_1(L4_1)
L2_1 = L2_1(L3_1, L4_1, L5_1)
L3_1 = StringStartsWith
L4_1 = L0_1
L5_1 = L1_1
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = StringStartsWith
  L4_1 = L0_1
  L5_1 = L2_1
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    goto lbl_49
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_49::
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
