local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1
L0_1 = mp
L0_1 = L0_1.getfilesize
L0_1 = L0_1()
if L0_1 ~= nil and 5120 <= L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.enum_mpattributesubstring
L2_1 = "SCPT:ClnWordsCat1"
L1_1 = L1_1(L2_1)
L2_1 = mp
L2_1 = L2_1.enum_mpattributesubstring
L3_1 = "SCPT:ClnWordsCat2"
L2_1 = L2_1(L3_1)
L3_1 = mp
L3_1 = L3_1.enum_mpattributesubstring
L4_1 = "SCPT:ClnWordsCat3"
L3_1 = L3_1(L4_1)
L4_1 = #L1_1
if not (1 <= L4_1) then
  L4_1 = #L1_1
  L5_1 = #L2_1
  L4_1 = L4_1 + L5_1
  if not (5 <= L4_1) then
    L4_1 = #L3_1
    if not (3 <= L4_1) then
      goto lbl_37
    end
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_37::
L4_1 = mp
L4_1 = L4_1.enum_mpattributesubstring
L5_1 = "SCPT:RansomNoteCat1"
L4_1 = L4_1(L5_1)
L5_1 = mp
L5_1 = L5_1.enum_mpattributesubstring
L6_1 = "SCPT:RansomNoteCat2"
L5_1 = L5_1(L6_1)
L6_1 = mp
L6_1 = L6_1.enum_mpattributesubstring
L7_1 = "SCPT:RansomNoteCat3"
L6_1 = L6_1(L7_1)
L7_1 = mp
L7_1 = L7_1.enum_mpattributesubstring
L8_1 = "SCPT:RansomNoteCat4"
L7_1 = L7_1(L8_1)
L8_1 = mp
L8_1 = L8_1.enum_mpattributesubstring
L9_1 = "SCPT:RansomNoteCat5"
L8_1 = L8_1(L9_1)
L9_1 = mp
L9_1 = L9_1.enum_mpattributesubstring
L10_1 = "SCPT:RansomNoteCat6"
L9_1 = L9_1(L10_1)
L10_1 = #L7_1
if 4 <= L10_1 then
  L10_1 = #L4_1
  L11_1 = #L5_1
  L10_1 = L10_1 + L11_1
  if 2 <= L10_1 then
    L10_1 = #L6_1
    L11_1 = #L8_1
    L10_1 = L10_1 + L11_1
    L11_1 = #L9_1
    L10_1 = L10_1 + L11_1
    if 3 < L10_1 then
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "MpDisableCaching"
      L10_1(L11_1)
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L10_1 = mp
L10_1 = L10_1.get_mpattribute
L11_1 = "SCPT:RansomRuyk"
L10_1 = L10_1(L11_1)
if L10_1 then
  L10_1 = #L7_1
  if 1 <= L10_1 then
    L10_1 = #L6_1
    if 1 <= L10_1 then
      L10_1 = mp
      L10_1 = L10_1.set_mpattribute
      L11_1 = "MpDisableCaching"
      L10_1(L11_1)
      L10_1 = mp
      L10_1 = L10_1.INFECTED
      return L10_1
    end
  end
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
