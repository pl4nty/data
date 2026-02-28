local L0_1, L1_1, L2_1, L3_1
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1505.003"
L3_1 = "Persistence_Webshell"
L0_1(L1_1, L2_1, L3_1)
L0_1 = this_sigattrlog
L0_1 = L0_1[3]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[4]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_27
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1562.001"
L3_1 = "DefenseEvasion_Impair"
L0_1(L1_1, L2_1, L3_1)
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1489"
L3_1 = "Impact_ServiceStop"
L0_1(L1_1, L2_1, L3_1)
goto lbl_53
::lbl_27::
L0_1 = this_sigattrlog
L0_1 = L0_1[5]
L0_1 = L0_1.matched
if not L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[6]
  L0_1 = L0_1.matched
  if not L0_1 then
    goto lbl_43
  end
end
L0_1 = TrackPidAndTechniqueBM
L1_1 = "BM"
L2_1 = "T1003.008"
L3_1 = "CredentialAccess"
L0_1(L1_1, L2_1, L3_1)
goto lbl_53
::lbl_43::
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = TrackPidAndTechniqueBM
  L1_1 = "BM"
  L2_1 = "T1136.001"
  L3_1 = "Persistence_LocalAccount"
  L0_1(L1_1, L2_1, L3_1)
end
::lbl_53::
L0_1 = addRelatedProcess
L0_1()
L0_1 = reportRelatedBmHits
L0_1()
L0_1 = mp
L0_1 = L0_1.INFECTED
return L0_1
