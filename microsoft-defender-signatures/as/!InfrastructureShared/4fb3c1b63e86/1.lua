local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L2_1 = L2_1.matched
if L2_1 then
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L0_1 = L2_1.utf8p1
  L2_1 = this_sigattrlog
  L2_1 = L2_1[2]
  L1_1 = L2_1.ppid
else
  L2_1 = this_sigattrlog
  L2_1 = L2_1[3]
  L2_1 = L2_1.matched
  if L2_1 then
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L0_1 = L2_1.utf8p1
    L2_1 = this_sigattrlog
    L2_1 = L2_1[3]
    L1_1 = L2_1.ppid
  end
end
if L0_1 ~= nil and L1_1 ~= nil then
  L2_1 = isTainted
  L3_1 = L0_1
  L4_1 = "remote_file_created_taint"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 then
    L2_1 = bm
    L2_1 = L2_1.get_process_relationships
    L3_1 = L1_1
    L2_1, L3_1 = L2_1(L3_1)
    L4_1 = ipairs
    L5_1 = L2_1
    L4_1, L5_1, L6_1 = L4_1(L5_1)
    for L7_1, L8_1 in L4_1, L5_1, L6_1 do
      L9_1 = bm
      L9_1 = L9_1.add_related_process
      L10_1 = L8_1.ppid
      L9_1(L10_1)
      L9_1 = TrackPidAndTechniqueBM
      L10_1 = L8_1.ppid
      L11_1 = "T1547.006"
      L12_1 = "Persistence"
      L9_1(L10_1, L11_1, L12_1)
    end
    L4_1 = mp
    L4_1 = L4_1.INFECTED
    return L4_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
