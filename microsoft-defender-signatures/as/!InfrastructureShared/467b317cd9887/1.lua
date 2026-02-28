local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L1_1 = MpCommon
L1_1 = L1_1.QueryPersistContext
L2_1 = L0_1
L3_1 = "NewPECreatedNoCert"
L1_1 = L1_1(L2_1, L3_1)
if not L1_1 then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.IsKnownFriendlyFile
L3_1 = L0_1
L4_1 = true
L5_1 = false
L2_1 = L2_1(L3_1, L4_1, L5_1)
if L2_1 == true then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = sysio
L2_1 = L2_1.GetFileLastWriteTime
L3_1 = L0_1
L2_1 = L2_1(L3_1)
L3_1 = sysio
L3_1 = L3_1.GetLastResult
L3_1 = L3_1()
L3_1 = L3_1.Success
if L3_1 and L2_1 ~= 0 then
  L3_1 = L2_1 / 10000000
  L2_1 = L3_1 - 11644473600
  L3_1 = MpCommon
  L3_1 = L3_1.GetCurrentTimeT
  L3_1 = L3_1()
  if not (L2_1 > L3_1) then
    L4_1 = L3_1 - L2_1
    if not (600 < L4_1) then
      goto lbl_70
    end
  end
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  do return L4_1 end
  ::lbl_70::
  L4_1 = triggerMemoryScanOnProcessTree
  L5_1 = true
  L6_1 = true
  L7_1 = "SMS_M"
  L8_1 = 100
  L9_1 = "Behavior:Win32/DllInject.SB"
  L4_1(L5_1, L6_1, L7_1, L8_1, L9_1)
  L4_1 = mp
  L4_1 = L4_1.INFECTED
  return L4_1
end
L3_1 = mp
L3_1 = L3_1.CLEAN
return L3_1
