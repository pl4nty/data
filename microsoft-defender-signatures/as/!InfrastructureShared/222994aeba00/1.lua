local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "SCPT:ClnWordsCat1"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "SCPT:ClnWordsCat2"
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "SCPT:ClnWordsCat3"
L2_1 = L2_1(L3_1)
L3_1 = #L0_1
if not (1 <= L3_1) then
  L3_1 = #L1_1
  if not (5 <= L3_1) then
    L3_1 = #L2_1
    if not (3 <= L3_1) then
      goto lbl_25
    end
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_25::
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "SCPT:RansomNote"
L3_1 = L3_1(L4_1)
L4_1 = #L3_1
if L4_1 < 1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = mp
L4_1 = L4_1.GetBruteMatchData
L4_1 = L4_1()
L5_1 = L4_1.match_offset
L6_1 = mp
L6_1 = L6_1.getfilesize
L6_1 = L6_1()
L7_1 = L4_1.is_footer
if L7_1 then
  L7_1 = mp
  L7_1 = L7_1.FOOTERPAGE_SZ
  L7_1 = L6_1 - L7_1
  L5_1 = L7_1 + L5_1
end
L7_1 = Infrastructure_CryptoSearcher
L8_1 = L5_1
L7_1 = L7_1(L8_1)
if L7_1 == true then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = "MpInternal_researchdata=threat=ransom"
  L7_1(L8_1)
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
