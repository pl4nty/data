local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.HSTR_WEIGHT
if L0_1 == 4 then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "ATTRIBUTE:SIGA:MISL:PossibleKillProcess:S1"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L0_1 = mp
    L0_1 = L0_1.GetCertificateInfo
    L1_1 = false
    L0_1 = L0_1(L1_1)
    L1_1 = pairs
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = L5_1.Signers
      if L6_1 ~= nil then
        L6_1 = mp
        L6_1 = L6_1.CLEAN
        return L6_1
      end
    end
    L1_1 = pe
    L1_1 = L1_1.get_versioninfo
    L1_1 = L1_1()
    if L1_1 == nil then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = {}
    L3_1 = "KMSELDI.exe"
    L2_1[1] = L3_1
    L3_1 = 1
    L4_1 = #L2_1
    L5_1 = 1
    for L6_1 = L3_1, L4_1, L5_1 do
      L7_1 = L1_1.OriginalFilename
      L8_1 = L2_1[L6_1]
      if L7_1 == L8_1 then
        L7_1 = mp
        L7_1 = L7_1.INFECTED
        return L7_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.LOWFI
return L0_1
