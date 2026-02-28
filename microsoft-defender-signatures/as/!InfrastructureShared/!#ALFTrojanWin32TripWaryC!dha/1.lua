local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = pcall
L1_1 = mp
L1_1 = L1_1.getfilename
L2_1 = mp
L2_1 = L2_1.FILEPATH_QUERY_FULL
L0_1, L1_1 = L0_1(L1_1, L2_1)
if L0_1 then
  L2_1 = "AppData\\Local"
  L4_1 = L1_1
  L3_1 = L1_1.find
  L5_1 = L2_1
  L6_1 = 1
  L7_1 = true
  L3_1 = L3_1(L4_1, L5_1, L6_1, L7_1)
  if L3_1 == nil then
    L4_1 = mp
    L4_1 = L4_1.CLEAN
    return L4_1
  end
  L4_1 = string
  L4_1 = L4_1.sub
  L5_1 = L1_1
  L6_1 = #L2_1
  L6_1 = L3_1 + L6_1
  L4_1 = L4_1(L5_1, L6_1)
  L6_1 = L4_1
  L5_1 = L4_1.gsub
  L7_1 = "\\"
  L8_1 = ""
  L5_1, L6_1 = L5_1(L6_1, L7_1, L8_1)
  if L6_1 < 4 and 6 < L6_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L7_1 = MpCommon
  L7_1 = L7_1.StringRegExpSearch
  L8_1 = "([a-zA-Z0-9]{10,20}\\\\[a-zA-Z0-9]{10,20}\\\\[a-zA-Z0-9]{10,20}.[a-z]{3}$)"
  L9_1 = L4_1
  L7_1, L8_1 = L7_1(L8_1, L9_1)
  if L7_1 == false then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
  L9_1 = string
  L9_1 = L9_1.sub
  L10_1 = L4_1
  L11_1 = 0
  L12_1 = #L4_1
  L13_1 = #L8_1
  L12_1 = L12_1 - L13_1
  L9_1 = L9_1(L10_1, L11_1, L12_1)
  L10_1 = {}
  L10_1["\\Microsoft\\Windows\\PowerShell\\"] = true
  L10_1["\\Microsoft\\Office\\PowerPoint\\"] = true
  L10_1["\\Microsoft\\Internet Explorer\\"] = true
  L10_1["\\Microsoft\\Office\\Publisher\\"] = true
  L10_1["\\Microsoft\\Windows\\Explorer\\"] = true
  L10_1["\\Microsoft\\Office\\Outlook\\"] = true
  L10_1["\\Microsoft\\Windows\\Shell\\"] = true
  L10_1["\\Microsoft\\Office\\Access\\"] = true
  L10_1["\\Microsoft\\Office\\Visio\\"] = true
  L10_1["\\Microsoft\\Office\\Excel\\"] = true
  L10_1["\\Microsoft\\Media Player\\"] = true
  L10_1["\\Microsoft\\Office\\Word\\"] = true
  L10_1["\\Microsoft\\VisualStudio\\"] = true
  L10_1["\\Microsoft\\CLR_v2.0_32\\"] = true
  L10_1["\\Microsoft\\CLR_v4.0_32\\"] = true
  L10_1["\\Microsoft\\Powerpoint\\"] = true
  L10_1["\\Microsoft\\Installer\\"] = true
  L10_1["\\Microsoft\\CLR_v2.0\\"] = true
  L10_1["\\Microsoft\\CLR_v4.0\\"] = true
  L10_1["\\Microsoft\\OneDrive\\"] = true
  L10_1["\\Microsoft\\Network\\"] = true
  L10_1["\\Microsoft\\Outlook\\"] = true
  L10_1["\\Microsoft\\MSBuild\\"] = true
  L10_1["\\Microsoft\\Office\\"] = true
  L10_1["\\Microsoft\\DotNet\\"] = true
  L10_1["\\Microsoft\\Access\\"] = true
  L10_1["\\Microsoft\\AddIns\\"] = true
  L10_1["\\Microsoft\\Crypto\\"] = true
  L10_1["\\Microsoft\\Vault\\"] = true
  L10_1["\\Microsoft\\Excel\\"] = true
  L10_1["\\Mozilla\\Firefox\\"] = true
  L10_1["\\Microsoft\\Word\\"] = true
  L10_1["\\Microsoft\\"] = true
  L10_1["\\Adobe\\"] = true
  L11_1 = L10_1[L9_1]
  if L11_1 then
    L11_1 = mp
    L11_1 = L11_1.INFECTED
    return L11_1
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
