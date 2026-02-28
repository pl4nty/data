local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
L0_1 = sysio
L0_1 = L0_1.RegOpenKey
L1_1 = "HKLM\\SOFTWARE\\Policies\\Google\\Chrome"
L0_1 = L0_1(L1_1)
if L0_1 then
  L1_1 = sysio
  L1_1 = L1_1.GetRegValueAsString
  L2_1 = L0_1
  L3_1 = "DefaultNotificationsSetting"
  L1_1 = L1_1(L2_1, L3_1)
  if L1_1 ~= nil then
    L2_1 = sysio
    L2_1 = L2_1.DeleteRegValue
    L3_1 = L0_1
    L4_1 = "DefaultNotificationsSetting"
    L2_1(L3_1, L4_1)
  end
end
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = "HKLM\\SOFTWARE\\Policies\\Google\\Chrome\\NotificationsAllowedForUrls"
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if L0_1 then
  L1_1 = sysio
  L1_1 = L1_1.RegEnumValues
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 then
    L2_1 = pairs
    L3_1 = L1_1
    L2_1, L3_1, L4_1 = L2_1(L3_1)
    for L5_1, L6_1 in L2_1, L3_1, L4_1 do
      L7_1 = sysio
      L7_1 = L7_1.GetRegValueAsString
      L8_1 = L0_1
      L9_1 = L6_1
      L7_1 = L7_1(L8_1, L9_1)
      if L7_1 then
        L8_1 = string
        L8_1 = L8_1.find
        L9_1 = L7_1
        L10_1 = "https://.+%.info"
        L8_1 = L8_1(L9_1, L10_1)
        if L8_1 then
          L8_1 = sysio
          L8_1 = L8_1.DeleteRegValue
          L9_1 = L0_1
          L10_1 = L6_1
          L8_1(L9_1, L10_1)
        end
      end
    end
  end
end
