local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = 0
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "AGGR:PowerShell/DisableIntrusionPreventionSystem"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "AGGR:PowerShell/DisableIOAVProtection"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "AGGR:PowerShell/DisableRealTimeMonitoring"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "AGGR:PowerShell/DisableScriptScanning"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "AGGR:PowerShell/DisableControlledFolderAccess"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "AGGR:PowerShell/SubmitSamplesConsent"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PowerShell/SetNetProtectAudit"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
L1_1 = mp
L1_1 = L1_1.get_mpattribute
L2_1 = "SCPT:PowerShell/DisableMAPSReport"
L1_1 = L1_1(L2_1)
if L1_1 then
  L0_1 = L0_1 + 1
end
if 2 <= L0_1 and L0_1 < 10 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Disable_"
  L3_1 = L0_1
  L4_1 = "_WDFunctions"
  L2_1 = L2_1 .. L3_1 .. L4_1
  L1_1(L2_1)
end
if 3 < L0_1 and L0_1 < 10 then
  L1_1 = mp
  L1_1 = L1_1.set_mpattribute
  L2_1 = "Disable_Multiple_WDFunctions"
  L1_1(L2_1)
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
