local L0_1, L1_1
L0_1 = IsTacticObservedGlobal
L1_1 = "FirstLogonUser"
L0_1 = L0_1(L1_1)
if L0_1 then
  L0_1 = reportSessionInformation
  L0_1()
  L0_1 = addOverallNetworkVolume
  L0_1()
  L0_1 = mp
  L0_1 = L0_1.INFECTED
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
