local L0_1, L1_1
L0_1 = mp
L0_1 = L0_1.enum_mpattributesubstring
L1_1 = "scpt:SCPTPhishHTMLFakeChaSB_gr_s"
L0_1 = L0_1(L1_1)
L0_1 = #L0_1
if L0_1 == 4 then
  L0_1 = mp
  L0_1 = L0_1.enum_mpattributesubstring
  L1_1 = "scpt:SCPTPhishHTMLFakeChaSB_gr_v"
  L0_1 = L0_1(L1_1)
  L0_1 = #L0_1
  if 1 <= L0_1 then
    L0_1 = mp
    L0_1 = L0_1.enum_mpattributesubstring
    L1_1 = "scpt:SCPTPhishHTMLFakeChaSB_gr_ctrl"
    L0_1 = L0_1(L1_1)
    L0_1 = #L0_1
    if 1 <= L0_1 then
      L0_1 = mp
      L0_1 = L0_1.enum_mpattributesubstring
      L1_1 = "scpt:SCPTPhishHTMLFakeChaSB_gr_enter"
      L0_1 = L0_1(L1_1)
      L0_1 = #L0_1
      if 1 <= L0_1 then
        L0_1 = mp
        L0_1 = L0_1.INFECTED
        return L0_1
      end
    end
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
