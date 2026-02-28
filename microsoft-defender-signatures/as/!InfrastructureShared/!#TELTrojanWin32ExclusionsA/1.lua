local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = {}
L0_1["AGGR:PowerShell/ExclusionEnviromentalVariableAppdata"] = 2
L0_1["AGGR:PowerShell/ExclusionExe"] = 2
L0_1["AGGR:PowerShell/ExclusionDll"] = 2
L0_1["AGGR:PowerShell/ExclusionBat"] = 2
L0_1["AGGR:PowerShell/ExclusionEnviromentalVariableTemp"] = 2
L0_1["AGGR:PowerShell/ExclusionEnviromentalVariableUserprofile"] = 2
L0_1["AGGR:PowerShell/ExclusionAppDataRoaming"] = 2
L1_1 = 0
L2_1 = pairs
L3_1 = L0_1
L2_1, L3_1, L4_1 = L2_1(L3_1)
for L5_1, L6_1 in L2_1, L3_1, L4_1 do
  L7_1 = mp
  L7_1 = L7_1.get_mpattribute
  L8_1 = L5_1
  L7_1 = L7_1(L8_1)
  if L7_1 then
    L1_1 = L1_1 + L6_1
  end
end
if 10 <= L1_1 then
  L2_1 = mp
  L2_1 = L2_1.INFECTED
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.CLEAN
return L2_1
