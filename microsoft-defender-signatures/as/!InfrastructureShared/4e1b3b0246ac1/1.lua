local L0_1, L1_1, L2_1, L3_1
L0_1 = bm
L0_1 = L0_1.get_current_process_startup_info
L0_1 = L0_1()
if L0_1 ~= nil then
  L1_1 = L0_1.ppid
  if L1_1 ~= nil then
    L1_1 = isParentPackageManager
    L2_1 = L0_1.ppid
    L3_1 = true
    L1_1 = L1_1(L2_1, L3_1)
    if L1_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = IsDetectionThresholdMetLinuxWrapper
    L2_1 = L0_1.ppid
    L1_1 = L1_1(L2_1)
    if not L1_1 then
      L1_1 = IsDiscoveryCollectionThresholdMetLinux
      L2_1 = L0_1.ppid
      L1_1 = L1_1(L2_1)
      if not L1_1 then
        goto lbl_35
      end
    end
    L1_1 = addRelatedProcess
    L1_1()
    L1_1 = reportRelatedBmHits
    L1_1()
    L1_1 = mp
    L1_1 = L1_1.INFECTED
    return L1_1
  end
end
::lbl_35::
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
