local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 18000000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_20
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_20::
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L2_1 = L0_1.ppid
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = L1_1.image_path
  if L2_1 ~= nil then
    goto lbl_32
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_32::
L2_1 = string
L2_1 = L2_1.lower
L3_1 = L1_1.image_path
L2_1 = L2_1(L3_1)
L4_1 = L2_1
L3_1 = L2_1.match
L5_1 = "([^\\]+)$"
L3_1 = L3_1(L4_1, L5_1)
if L3_1 ~= "wmiprvse.exe" then
  L3_1 = IsProcNameInParentProcessTree
  L4_1 = L0_1.ppid
  L5_1 = "wmiprvse.exe"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 then
    L3_1 = mp
    L3_1 = L3_1.INFECTED
    return L3_1
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
