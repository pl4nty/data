local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = 16
L1_1 = this_sigattrlog
L1_1 = L1_1[1]
L2_1 = L1_1.matched
if L2_1 then
  L2_1 = L1_1.utf8p2
  if L2_1 then
    goto lbl_13
  end
end
L2_1 = mp
L2_1 = L2_1.CLEAN
do return L2_1 end
::lbl_13::
L2_1 = this_sigattrlog
L2_1 = L2_1[2]
L3_1 = L2_1.matched
if L3_1 then
  L3_1 = L2_1.ppid
  if L3_1 then
    goto lbl_24
  end
end
L3_1 = mp
L3_1 = L3_1.CLEAN
do return L3_1 end
::lbl_24::
L3_1 = GetSuspiciousRegions
L3_1 = L3_1()
if not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.format
L5_1 = "ScanBeaconing.A:%s"
L6_1 = L2_1.ppid
L4_1 = L4_1(L5_1, L6_1)
L5_1 = pcall
L6_1 = MpCommon
L6_1 = L6_1.AtomicCounterValue
L7_1 = L4_1
L5_1, L6_1 = L5_1(L6_1, L7_1)
if not L5_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
if not L6_1 then
  L7_1 = pcall
  L8_1 = MpCommon
  L8_1 = L8_1.AtomicCounterSet
  L9_1 = L4_1
  L10_1 = 0
  L11_1 = 3600
  L7_1 = L7_1(L8_1, L9_1, L10_1, L11_1)
  if not L7_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
  L6_1 = 0
end
if L6_1 == L0_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = ipairs
L8_1 = L3_1
L7_1, L8_1, L9_1 = L7_1(L8_1)
for L10_1, L11_1 in L7_1, L8_1, L9_1 do
  L12_1 = TriggerTargetedMemoryScan
  L13_1 = L11_1 + L6_1
  L12_1(L13_1)
end
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.AtomicCounterAdd
L9_1 = L4_1
L10_1 = 1
L7_1 = L7_1(L8_1, L9_1, L10_1)
if not L7_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = bm
L7_1 = L7_1.trigger_sig
L8_1 = "ScanSuspiciousRegions"
L9_1 = L1_1.utf8p2
L10_1 = L2_1.ppid
L7_1(L8_1, L9_1, L10_1)
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
