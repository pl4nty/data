local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = mp
L0_1 = L0_1.GetParentProcInfo
L0_1 = L0_1()
L1_1 = isnull
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if not L1_1 then
  L1_1 = isnull
  L2_1 = L0_1.ppid
  L1_1 = L1_1(L2_1)
  if not L1_1 then
    goto lbl_17
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_17::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
L2_1 = isnull
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = isnull
  L3_1 = L1_1.image_path
  L2_1 = L2_1(L3_1)
  if not L2_1 then
    goto lbl_34
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_34::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L3_1 = StringEndsWith
L4_1 = L2_1
L5_1 = "\\svchost.exe"
L3_1 = L3_1(L4_1, L5_1)
if not L3_1 then
  L3_1 = StringEndsWith
  L4_1 = L2_1
  L5_1 = "\\wscript.exe"
  L3_1 = L3_1(L4_1, L5_1)
  if not L3_1 then
    goto lbl_53
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_53::
L3_1 = mp
L3_1 = L3_1.INFECTED
return L3_1
