local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L0_1 = L1_1[1]
else
  L1_1 = this_sigattrlog
  L1_1 = L1_1[2]
  L1_1 = L1_1.matched
  if L1_1 then
    L1_1 = this_sigattrlog
    L0_1 = L1_1[2]
  else
    L1_1 = mp
    L1_1 = L1_1.CLEAN
    return L1_1
  end
end
L1_1 = L0_1.utf8p1
if L1_1 == nil then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = L0_1.utf8p1
L2_1 = mp
L2_1 = L2_1.IsKnownFriendlyFile
L3_1 = L1_1
L4_1 = true
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = bm
L2_1 = L2_1.add_related_file
L3_1 = L1_1
L2_1(L3_1)
L2_1 = TrackFileAndTechnique
L3_1 = L1_1
L4_1 = "T1574.001:printnotify_dll_hijack"
L2_1(L3_1, L4_1)
L2_1 = TrackPidAndTechniqueBM
L3_1 = "BM"
L4_1 = "T1543.003"
L5_1 = "printnotify_svc_hijack"
L2_1(L3_1, L4_1, L5_1)
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
