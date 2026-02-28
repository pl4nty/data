local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L1_1 = this_sigattrlog
L1_1 = L1_1[5]
L1_1 = L1_1.matched
if L1_1 then
  L1_1 = this_sigattrlog
  L1_1 = L1_1[5]
  L0_1 = L1_1.utf8p1
end
if L0_1 then
  L1_1 = MpCommon
  L1_1 = L1_1.GetMountedFileBackingFilePath
  L2_1 = L0_1
  L1_1 = L1_1(L2_1)
  if L1_1 == nil then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
  L2_1 = string
  L2_1 = L2_1.lower
  L3_1 = string
  L3_1 = L3_1.sub
  L4_1 = L1_1
  L5_1 = -4
  L3_1, L4_1, L5_1, L6_1, L7_1, L8_1 = L3_1(L4_1, L5_1)
  L2_1 = L2_1(L3_1, L4_1, L5_1, L6_1, L7_1, L8_1)
  if L2_1 ~= ".iso" or L2_1 ~= ".img" then
    L3_1 = mp
    L3_1 = L3_1.CLEAN
    return L3_1
  end
  L3_1 = triggerMemoryScanOnProcessTree
  L4_1 = true
  L5_1 = true
  L6_1 = "SMS_M"
  L7_1 = 1000
  L8_1 = "Behavior:Win32/Qakbot.SC"
  L3_1(L4_1, L5_1, L6_1, L7_1, L8_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L0_1
  L3_1(L4_1)
  L3_1 = bm
  L3_1 = L3_1.add_related_file
  L4_1 = L1_1
  L3_1(L4_1)
  L3_1 = mp
  L3_1 = L3_1.INFECTED
  return L3_1
end
L1_1 = mp
L1_1 = L1_1.CLEAN
return L1_1
