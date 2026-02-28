local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = string
L0_1 = L0_1.find
L1_1 = Remediation
L1_1 = L1_1.Threat
L1_1 = L1_1.Name
L2_1 = "BrowserModifier:Win32/MeninchSP"
L3_1 = 1
L4_1 = true
L0_1 = L0_1(L1_1, L2_1, L3_1, L4_1)
if L0_1 then
  L0_1 = Infrastructure_CleanToolbarByName
  L1_1 = "Iminent Toolbar"
  L0_1(L1_1)
  L0_1 = Infrastructure_CleanBHOByNameList
  L1_1 = {}
  L2_1 = "IMinent WebBooster"
  L3_1 = "iminent Helper Object"
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L0_1(L1_1)
  L0_1 = Infrastructure_CleanUninstallByDisplayNameList
  L1_1 = {}
  L2_1 = "Iminent"
  L3_1 = "Iminent Toolbar on IE and Chrome"
  L1_1[1] = L2_1
  L1_1[2] = L3_1
  L0_1(L1_1)
  L0_1 = Infrastructure_CleanSearchByDisplayName
  L1_1 = "SearchTheWeb"
  L0_1(L1_1)
end
