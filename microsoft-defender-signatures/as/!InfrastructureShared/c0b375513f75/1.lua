local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = IsTechniqueObservedGlobal
L2_1 = "T1098"
L3_1 = false
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L0_1 = "T1098"
else
  L1_1 = IsTechniqueObservedGlobal
  L2_1 = "T1078"
  L3_1 = false
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 then
    L0_1 = "T1078"
  else
    L1_1 = IsTechniqueObservedGlobal
    L2_1 = "T1136"
    L3_1 = false
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L0_1 = "T1136"
    else
      L1_1 = IsTechniqueObservedGlobal
      L2_1 = "CredentialAccess_SshBruteForceIncoming"
      L3_1 = true
      L1_1 = L1_1(L2_1, L3_1)
      if L1_1 then
        L0_1 = "CredentialAccess_SshBruteForceInLateral"
        L1_1 = mp
        L1_1 = L1_1.set_mpattribute
        L2_1 = "Lua:CredentialAccess_SshBruteForceInLateral"
        L1_1(L2_1)
      end
    end
  end
end
if L0_1 then
  L1_1 = bm
  L1_1 = L1_1.add_related_string
  L2_1 = "mitre_technique"
  L3_1 = L0_1
  L4_1 = bm
  L4_1 = L4_1.RelatedStringBMReport
  L1_1(L2_1, L3_1, L4_1)
  L1_1 = mp
  L1_1 = L1_1.INFECTED
  return L1_1
else
  L1_1 = TrackPidAndTechniqueBM
  L2_1 = "BM"
  L3_1 = "T1021.004"
  L4_1 = "LateralMovement"
  L1_1(L2_1, L3_1, L4_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
