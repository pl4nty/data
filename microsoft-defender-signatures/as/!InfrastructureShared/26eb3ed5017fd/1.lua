local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    goto lbl_12
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_12::
L1_1 = isParentPackageManager
L2_1 = L0_1.ppid
L3_1 = true
L1_1 = L1_1(L2_1, L3_1)
if L1_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = mp
L1_1 = L1_1.GetParentProcInfo
L1_1 = L1_1()
if L1_1 ~= nil then
  L2_1 = L1_1.ppid
  if L2_1 ~= nil then
    L2_1 = isParentPackageManager
    L3_1 = L1_1.ppid
    L4_1 = true
    L2_1 = L2_1(L3_1, L4_1)
    if L2_1 then
      L2_1 = mp
      L2_1 = L2_1.CLEAN
      return L2_1
    end
    L2_1 = TrackPidAndTechnique
    L3_1 = L1_1.ppid
    L4_1 = "T1562.004"
    L5_1 = "DefenseEvasion_ImpairDefenses_DisableSystemFirewall_ufw_config"
    L2_1(L3_1, L4_1, L5_1)
  end
end
L2_1 = AddResearchData
L3_1 = "BM"
L4_1 = true
L2_1(L3_1, L4_1)
L2_1 = addRelatedProcess
L2_1()
L2_1 = reportRelatedBmHits
L2_1()
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
