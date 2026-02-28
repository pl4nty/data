local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = pairs
L1_1 = Remediation
L1_1 = L1_1.Threat
L1_1 = L1_1.Resources
L0_1, L1_1, L2_1 = L0_1(L1_1)
for L3_1, L4_1 in L0_1, L1_1, L2_1 do
  L5_1 = L4_1.Schema
  if L5_1 == "folder" then
    L5_1 = Infrastructure_CleanRegistryUninstallLocation
    L6_1 = L4_1.Path
    L5_1(L6_1)
  end
end
L0_1 = Remediation
L0_1 = L0_1.SetRebootRequired
L0_1()
