local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = IsTaintedProcessinParentTreeForLinux
L1_1 = "upx_file_created_taint"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = IsTaintedProcessinParentTreeForLinux
  L1_1 = "remote_file_created_taint"
  L0_1 = L0_1(L1_1)
  if not L0_1 then
    L0_1 = IsTaintedProcessinParentTreeForLinux
    L1_1 = "masqueraded_file_extension_taint"
    L0_1 = L0_1(L1_1)
    if not L0_1 then
      L0_1 = IsTaintedProcessinParentTreeForLinux
      L1_1 = "mounted_file_execution"
      L0_1 = L0_1(L1_1)
      if not L0_1 then
        goto lbl_43
      end
    end
  end
end
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = bm
L0_1 = L0_1.get_process_relationships
L0_1, L1_1 = L0_1()
L2_1 = ipairs
L3_1 = L1_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = bm
  L7_1 = L7_1.trigger_sig
  L8_1 = "BmTraverseTreeBlock"
  L9_1 = "Detected"
  L10_1 = L6_1.ppid
  L7_1(L8_1, L9_1, L10_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
do return L2_1 end
::lbl_43::
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
