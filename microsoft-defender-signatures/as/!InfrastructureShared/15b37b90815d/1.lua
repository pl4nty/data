local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 then
  L1_1 = L0_1.ppid
  if L1_1 then
    L1_1 = TrackPidAndMultipleTechniquesBM
    L2_1 = L0_1.ppid
    L3_1 = {}
    L3_1.T1001 = "c2_tls_masquerade"
    L3_1.T1041 = "c2_tls_masquerade"
    L3_1.T1571 = "c2_tls_masquerade"
    L1_1(L2_1, L3_1)
  end
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
