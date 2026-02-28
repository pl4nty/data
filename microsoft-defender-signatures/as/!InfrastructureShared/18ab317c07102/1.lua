local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
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
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    goto lbl_23
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_23::
L2_1 = isParentPackageManager
L3_1 = L1_1.ppid
L4_1 = true
L2_1 = L2_1(L3_1, L4_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1027.002"
L5_1 = "DefenseEvasion_ObfuscatedFilesInformation_SoftwarePacking"
L2_1(L3_1, L4_1, L5_1)
L2_1 = addRelatedProcess
L2_1()
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = bm
L2_1 = L2_1.get_process_relationships
L2_1, L3_1 = L2_1()
L4_1 = ipairs
L5_1 = L3_1
L4_1, L5_1, L6_1 = L4_1(L5_1)
for L7_1, L8_1 in L4_1, L5_1, L6_1 do
  L9_1 = bm
  L9_1 = L9_1.trigger_sig
  L10_1 = "BmTraverseTreeBlock"
  L11_1 = "Detected"
  L12_1 = L8_1.ppid
  L9_1(L10_1, L11_1, L12_1)
end
L4_1 = bm
L4_1 = L4_1.get_imagepath
L4_1 = L4_1()
if L4_1 ~= "" and L4_1 ~= nil then
  L5_1 = check_common_process_linux
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  if L5_1 == false then
    L5_1 = bm
    L5_1 = L5_1.add_threat_file
    L6_1 = L4_1
    L5_1(L6_1)
  end
end
L5_1 = mp
L5_1 = L5_1.INFECTED
return L5_1
