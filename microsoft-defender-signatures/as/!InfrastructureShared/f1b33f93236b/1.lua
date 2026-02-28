local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L2_1 = this_sigattrlog
L2_1 = L2_1[1]
L2_1 = L2_1.matched
if L2_1 then
  L0_1 = "genb_linux_ransom_meta"
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L2_1 = L2_1.matched
  if L2_1 then
    L0_1 = "gene_linux_ransom_meta"
  else
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L2_1 = L2_1.matched
    if L2_1 then
      L0_1 = "genh_linux_ransom_meta"
    else
      L2_1 = this_sigattrlog
      L2_1 = L2_1[4]
      L2_1 = L2_1.matched
      if L2_1 then
        L0_1 = "genj_linux_ransom_meta"
      end
    end
  end
end
if L0_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = GetRollingQueueAsHashTable
L3_1 = L0_1
L2_1 = L2_1(L3_1)
if L2_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L1_1 = L2_1.appended_ext
if L1_1 == nil then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = isKnownRansomExtension
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 then
  L3_1 = addRelatedProcess
  L3_1()
  L3_1 = TrackPidAndTechniqueBM
  L4_1 = "BM"
  L5_1 = "T1486"
  L6_1 = "Impact_FileEncryption"
  L3_1(L4_1, L5_1, L6_1)
  L3_1 = bm
  L3_1 = L3_1.get_process_relationships
  L3_1, L4_1 = L3_1()
  L5_1 = ipairs
  L6_1 = L4_1
  L5_1, L6_1, L7_1 = L5_1(L6_1)
  for L8_1, L9_1 in L5_1, L6_1, L7_1 do
    L10_1 = bm
    L10_1 = L10_1.trigger_sig
    L11_1 = "BmTraverseTreeBlock"
    L12_1 = "Detected"
    L13_1 = L9_1.ppid
    L10_1(L11_1, L12_1, L13_1)
  end
  L5_1 = TerminateParentProcessForLinux
  L5_1()
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
