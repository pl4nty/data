local L0_1, L1_1
L0_1 = Remediation
L0_1 = L0_1.Threat
L0_1 = L0_1.Active
if L0_1 then
  L0_1 = Infrastructure_RemoveDefenderDAVASPolicyKey
  L0_1()
  L0_1 = Infrastructure_RemoveDefenderDAVASPrefKey
  L0_1()
end
