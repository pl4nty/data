local L0_1, L1_1, L2_1, L3_1, L4_1
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[1]
  L1_1 = L1_1.utf8p2
  if L1_1 ~= nil then
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = this_sigattrlog
    L2_1 = L2_1[1]
    L2_1 = L2_1.utf8p2
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
  end
end
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = MpCommon
L2_1 = L2_1.ExpandEnvironmentVariables
L3_1 = "%WINDIR%\\SYSTEM32\\tasks"
L2_1 = L2_1(L3_1)
L3_1 = L0_1
L2_1 = L2_1 .. L3_1
L1_1 = L1_1(L2_1)
L2_1 = sysio
L2_1 = L2_1.IsFileExists
L3_1 = L1_1
L2_1 = L2_1(L3_1)
if not L2_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = versioning
L2_1 = L2_1.GetCloudBlockLevel
L2_1 = L2_1()
if L2_1 == 4 then
  L2_1 = mp
  L2_1 = L2_1.TriggerScanResource
  L3_1 = "taskscheduler"
  L4_1 = L1_1
  L2_1(L3_1, L4_1)
end
L2_1 = mp
L2_1 = L2_1.INFECTED
return L2_1
