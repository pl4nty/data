local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Name
if L0_1 == "BrowserModifier:Win32/Neobar" then
  L0_1 = sysio
  L0_1 = L0_1.RegExpandUserKey
  L1_1 = "HKCU\\Software\\Policies\\Microsoft\\Internet Explorer\\Infodelivery\\Restrictions"
  L0_1 = L0_1(L1_1)
  if L0_1 then
    L1_1 = pairs
    L2_1 = L0_1
    L1_1, L2_1, L3_1 = L1_1(L2_1)
    for L4_1, L5_1 in L1_1, L2_1, L3_1 do
      L6_1 = sysio
      L6_1 = L6_1.RegOpenKey
      L7_1 = L5_1
      L6_1 = L6_1(L7_1)
      if L6_1 ~= nil then
        L7_1 = sysio
        L7_1 = L7_1.DeleteRegValue
        L8_1 = L6_1
        L9_1 = "UsePolicySearchProvidersOnly"
        L7_1(L8_1, L9_1)
      end
    end
  end
  L1_1 = Infrastructure_CleanSearchByDisplayName
  L2_1 = "Gigabase"
  L1_1(L2_1)
end
