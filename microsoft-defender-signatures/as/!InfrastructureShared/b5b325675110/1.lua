local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = string
L0_1 = L0_1.lower
L1_1 = bm
L1_1 = L1_1.get_imagepath
L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1 = L1_1()
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1)
L1_1 = GetRollingQueueKeyValue
L2_1 = "ExchgVersion"
L3_1 = L0_1
L1_1 = L1_1(L2_1, L3_1)
if L1_1 == nil then
  L2_1 = "ExchgVersion"
  L3_1 = 86400
  L4_1 = sysio
  L4_1 = L4_1.RegOpenKey
  L5_1 = "HKLM\\Software\\Microsoft\\ExchangeServer\\V15\\Setup"
  L4_1 = L4_1(L5_1)
  if not L4_1 then
    L5_1 = sysio
    L5_1 = L5_1.RegOpenKey
    L6_1 = "HKLM\\Software\\Microsoft\\ExchangeServer\\V14\\Setup"
    L5_1 = L5_1(L6_1)
    L4_1 = L5_1
  end
  if not L4_1 then
    L5_1 = bm
    L5_1 = L5_1.add_related_string
    L6_1 = "ExchgSetupErr"
    L7_1 = "true"
    L8_1 = bm
    L8_1 = L8_1.RelatedStringBMReport
    L5_1(L6_1, L7_1, L8_1)
    L5_1 = mp
    L5_1 = L5_1.INFECTED
    return L5_1
  end
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsString
  L6_1 = L4_1
  L7_1 = "OwaVersion"
  L5_1 = L5_1(L6_1, L7_1)
  if not L5_1 then
    L5_1 = "nil"
  end
  if L5_1 then
    L6_1 = AppendToRollingQueue
    L7_1 = L2_1
    L8_1 = L0_1
    L9_1 = L5_1
    L10_1 = L3_1
    L6_1(L7_1, L8_1, L9_1, L10_1)
    L6_1 = bm
    L6_1 = L6_1.add_related_string
    L7_1 = "ExchgVersion"
    L8_1 = L5_1
    L9_1 = bm
    L9_1 = L9_1.RelatedStringBMReport
    L6_1(L7_1, L8_1, L9_1)
  end
else
  L2_1 = bm
  L2_1 = L2_1.add_related_string
  L3_1 = "ExchgVersion"
  L4_1 = L1_1
  L5_1 = bm
  L5_1 = L5_1.RelatedStringBMReport
  L2_1(L3_1, L4_1, L5_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
