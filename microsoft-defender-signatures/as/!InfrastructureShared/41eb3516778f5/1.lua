local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.get_process_relationships
L1_1, L2_1 = L1_1()
L3_1 = ipairs
L4_1 = L2_1
L3_1, L4_1, L5_1 = L3_1(L4_1)
for L6_1, L7_1 in L3_1, L4_1, L5_1 do
  L8_1 = bm
  L8_1 = L8_1.trigger_sig
  L9_1 = "BmTraverseTreeBlock"
  L10_1 = "Detected"
  L11_1 = L7_1.ppid
  L8_1(L9_1, L10_1, L11_1)
end
L3_1 = TrackPidAndTechniqueBM
L4_1 = "BM"
L5_1 = "T1485"
L6_1 = "Impact_DataDestruction_10dd"
L3_1(L4_1, L5_1, L6_1)
L3_1 = bm
L3_1 = L3_1.get_imagepath
L3_1 = L3_1()
if L3_1 ~= "" and L3_1 ~= nil then
  L4_1 = check_common_process_linux
  L5_1 = L3_1
  L4_1 = L4_1(L5_1)
  if L4_1 == false then
    L4_1 = bm
    L4_1 = L4_1.add_threat_file
    L5_1 = L3_1
    L4_1(L5_1)
  end
end
L4_1 = mp
L4_1 = L4_1.INFECTED
return L4_1
