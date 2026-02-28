local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "//SCPT:HTML/DoubleCryptoFraudKey"
L0_1 = L0_1(L1_1)
if L0_1 == false then
  L0_1 = mp
  L0_1 = L0_1.get_mpattribute
  L1_1 = "//SCPT:MSG/CryptoExtortion"
  L0_1 = L0_1(L1_1)
  if L0_1 == false then
    L0_1 = mp
    L0_1 = L0_1.get_mpattribute
    L1_1 = "ALF:AGGR:SITE/CryptoExtort"
    L0_1 = L0_1(L1_1)
    if L0_1 == false then
      L0_1 = mp
      L0_1 = L0_1.CLEAN
      return L0_1
    end
  end
end
L0_1 = mp
L0_1 = L0_1.GetBruteMatchData
L0_1 = L0_1()
L1_1 = L0_1.match_offset
L2_1 = mp
L2_1 = L2_1.getfilesize
L2_1 = L2_1()
L3_1 = L0_1.is_footer
if L3_1 then
  L3_1 = mp
  L3_1 = L3_1.FOOTERPAGE_SZ
  L3_1 = L2_1 - L3_1
  L1_1 = L3_1 + L1_1
end
L3_1 = Infrastructure_CryptoSearcher
L4_1 = L1_1
L3_1 = L3_1(L4_1)
if L3_1 == true then
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "//SCPT:HTML/DoubleCryptoFraudKey"
  L3_1 = L3_1(L4_1)
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "MpInternal_researchdata=threat=double"
    L3_1(L4_1)
  end
  L3_1 = mp
  L3_1 = L3_1.get_mpattribute
  L4_1 = "//SCPT:MSG/CryptoExtortion"
  L3_1 = L3_1(L4_1)
  if L3_1 == true then
    L3_1 = mp
    L3_1 = L3_1.set_mpattribute
    L4_1 = "MpInternal_researchdata=threat=extort"
    L3_1(L4_1)
  end
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
