local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
if L0_1 == nil then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = this_sigattrlog
L0_1 = L0_1[1]
L0_1 = L0_1.utf8p1
L1_1 = mp
L1_1 = L1_1.IsKnownFriendlyFile
L2_1 = L0_1
L3_1 = true
L4_1 = false
L1_1 = L1_1(L2_1, L3_1, L4_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = bm
L1_1 = L1_1.add_related_file
L2_1 = L0_1
L1_1(L2_1)
L1_1 = TrackFileAndTechnique
L2_1 = L0_1
L3_1 = "T1574.001:printnotify_dll_hijack_generic"
L4_1 = 1000
L1_1(L2_1, L3_1, L4_1)
L1_1 = TrackPidAndTechniqueBM
L2_1 = "BM"
L3_1 = "T1543.003"
L4_1 = "printnotify_svc_hijack_generic"
L1_1(L2_1, L3_1, L4_1)
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
