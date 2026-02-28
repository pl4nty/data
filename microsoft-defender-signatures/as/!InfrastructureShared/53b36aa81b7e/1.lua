local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = this_sigattrlog
L0_1 = L0_1[2]
L0_1 = L0_1.utf8p2
L1_1 = string
L1_1 = L1_1.find
L2_1 = L0_1
L3_1 = "activate"
L4_1 = 1
L5_1 = true
L1_1 = L1_1(L2_1, L3_1, L4_1, L5_1)
if L1_1 then
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1548.004"
  L4_1 = "PrivilegeEscalation-CredentialPopupWithinApp"
  L1_1(L2_1, L3_1, L4_1)
else
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1548.004"
  L4_1 = "PrivilegeEscalation-CredentialPopup"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.INFECTED
return L1_1
