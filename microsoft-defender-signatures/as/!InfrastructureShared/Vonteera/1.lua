local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L1_1 = "{934B156A-3D17-3981-B78A-5C138F423AD6}"
L2_1 = "{437B9306-2FDE-4054-A3C9-6B49507C12D0}"
L0_1[1] = L1_1
L0_1[2] = L2_1
L1_1 = Infrastructure_IE_DisableExtensions
L2_1 = L0_1
L1_1(L2_1)
L1_1 = sysio
L1_1 = L1_1.RegOpenKey
L2_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
L1_1 = L1_1(L2_1)
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.GetRegValueAsString
  L3_1 = L1_1
  L4_1 = "Start Page"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L3_1 = sysio
    L3_1 = L3_1.DeleteRegValue
    L4_1 = L1_1
    L5_1 = "Start Page"
    L3_1(L4_1, L5_1)
  end
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\SearchScopes"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.GetRegValueAsString
  L3_1 = L1_1
  L4_1 = "DefaultScope"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L3_1 = sysio
    L3_1 = L3_1.RegOpenKey
    L4_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\SearchScopes\\"
    L5_1 = L2_1
    L4_1 = L4_1 .. L5_1
    L3_1 = L3_1(L4_1)
    if L3_1 ~= nil then
      L4_1 = sysio
      L4_1 = L4_1.DeleteRegKey
      L5_1 = L3_1
      L6_1 = nil
      L4_1(L5_1, L6_1)
    end
    L4_1 = sysio
    L4_1 = L4_1.DeleteRegValue
    L5_1 = L1_1
    L6_1 = "DefaultScope"
    L4_1(L5_1, L6_1)
  end
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Infodelivery\\Restrictions"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.GetRegValueAsString
  L3_1 = L1_1
  L4_1 = "NoChangeDefaultSearchProvider"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L3_1 = sysio
    L3_1 = L3_1.DeleteRegValue
    L4_1 = L1_1
    L5_1 = "NoChangeDefaultSearchProvider"
    L3_1(L4_1, L5_1)
  end
  L3_1 = sysio
  L3_1 = L3_1.GetRegValueAsString
  L4_1 = L1_1
  L5_1 = "UsePolicySearchProvidersOnly"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L4_1 = sysio
    L4_1 = L4_1.DeleteRegValue
    L5_1 = L1_1
    L6_1 = "UsePolicySearchProvidersOnly"
    L4_1(L5_1, L6_1)
  end
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Google\\Chrome"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.GetRegValueAsString
  L3_1 = L1_1
  L4_1 = "DefaultSearchProviderEnabled"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L3_1 = sysio
    L3_1 = L3_1.DeleteRegValue
    L4_1 = L1_1
    L5_1 = "DefaultSearchProviderEnabled"
    L3_1(L4_1, L5_1)
  end
  L3_1 = sysio
  L3_1 = L3_1.GetRegValueAsString
  L4_1 = L1_1
  L5_1 = "DefaultSearchProviderKeyword"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L4_1 = sysio
    L4_1 = L4_1.DeleteRegValue
    L5_1 = L1_1
    L6_1 = "DefaultSearchProviderKeyword"
    L4_1(L5_1, L6_1)
  end
  L4_1 = sysio
  L4_1 = L4_1.GetRegValueAsString
  L5_1 = L1_1
  L6_1 = "DefaultSearchProviderName"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil then
    L5_1 = sysio
    L5_1 = L5_1.DeleteRegValue
    L6_1 = L1_1
    L7_1 = "DefaultSearchProviderName"
    L5_1(L6_1, L7_1)
  end
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsString
  L6_1 = L1_1
  L7_1 = "DefaultSearchProviderSearchURL"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= nil then
    L6_1 = sysio
    L6_1 = L6_1.DeleteRegValue
    L7_1 = L1_1
    L8_1 = "DefaultSearchProviderSearchURL"
    L6_1(L7_1, L8_1)
  end
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Google\\Chrome\\Recommended"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.GetRegValueAsString
  L3_1 = L1_1
  L4_1 = "HomepageIsNewTabPage"
  L2_1 = L2_1(L3_1, L4_1)
  if L2_1 ~= nil then
    L3_1 = sysio
    L3_1 = L3_1.DeleteRegValue
    L4_1 = L1_1
    L5_1 = "HomepageIsNewTabPage"
    L3_1(L4_1, L5_1)
  end
  L3_1 = sysio
  L3_1 = L3_1.GetRegValueAsString
  L4_1 = L1_1
  L5_1 = "RestoreOnStartup"
  L3_1 = L3_1(L4_1, L5_1)
  if L3_1 ~= nil then
    L4_1 = sysio
    L4_1 = L4_1.DeleteRegValue
    L5_1 = L1_1
    L6_1 = "RestoreOnStartup"
    L4_1(L5_1, L6_1)
  end
  L4_1 = sysio
  L4_1 = L4_1.GetRegValueAsString
  L5_1 = L1_1
  L6_1 = "ShowHomeButton"
  L4_1 = L4_1(L5_1, L6_1)
  if L4_1 ~= nil then
    L5_1 = sysio
    L5_1 = L5_1.DeleteRegValue
    L6_1 = L1_1
    L7_1 = "ShowHomeButton"
    L5_1(L6_1, L7_1)
  end
  L5_1 = sysio
  L5_1 = L5_1.GetRegValueAsString
  L6_1 = L1_1
  L7_1 = "HomepageLocation"
  L5_1 = L5_1(L6_1, L7_1)
  if L5_1 ~= nil then
    L6_1 = sysio
    L6_1 = L6_1.DeleteRegValue
    L7_1 = L1_1
    L8_1 = "HomepageLocation"
    L6_1(L7_1, L8_1)
  end
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Google\\Chrome\\ExtensionInstallForcelist"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Google\\Chrome\\RestoreOnStartupURLs"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Chromium\\ExtensionInstallForcelist"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\181E2AE5727DE60F52EF26D90BC6919481601793"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\2FA3FB2570A7A859026C59A1C723E7EF9F9AF13D"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\4B953F30F1DE4DFEF894B136DAA155CEAFC243A0"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\65AFAA515036C38C9EC28248C453FB0F6B1E7094"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\8138B44330354E413DC52AF1DBFCA8BA1C0F6C0A"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\82F19360B15655A94E875A5B5F7844E2932FC2A6"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\883224FAB9D5BC431563A00AF10A79AA78087584"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\89B89723B7106A1926036B1469D2497B85841849"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\AB7E760DA2485EA9EF5A6EEE7647748D4BA6B947"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\B1E5407220D2E41A2045A5B183AE83F54E3C9643"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\BD22822F42C0B3F61AA0F30360EFB2A15068893B"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\C1437F2BC6F11F4806EAD857982457BF7828CE15"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
L2_1 = sysio
L2_1 = L2_1.RegOpenKey
L3_1 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\SystemCertificates\\Disallowed\\Certificates\\D37F61D57CB0481F3D77EDAC7DE72196C4314E2C"
L2_1 = L2_1(L3_1)
L1_1 = L2_1
if L1_1 ~= nil then
  L2_1 = sysio
  L2_1 = L2_1.DeleteRegKey
  L3_1 = L1_1
  L4_1 = nil
  L2_1(L3_1, L4_1)
end
