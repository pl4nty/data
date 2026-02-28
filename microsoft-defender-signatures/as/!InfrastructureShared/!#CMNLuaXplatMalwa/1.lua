local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1
L0_1 = mp
L0_1 = L0_1.get_mpattribute
L1_1 = "RPF:TopLevelFile"
L0_1 = L0_1(L1_1)
if not L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = mp
L0_1 = L0_1.getfilename
L1_1 = mp
L1_1 = L1_1.FILEPATH_QUERY_PATH
L0_1 = L0_1(L1_1)
if L0_1 ~= nil then
  L1_1 = #L0_1
  if not (L1_1 < 2) then
    goto lbl_23
  end
end
L1_1 = mp
L1_1 = L1_1.CLEAN
do return L1_1 end
::lbl_23::
L1_1 = 3600
L2_1 = "XplatMalwareScanTrigger"
L3_1 = MpCommon
L3_1 = L3_1.AtomicCounterValue
L4_1 = L2_1
L5_1 = "AC"
L4_1 = L4_1 .. L5_1
L3_1 = L3_1(L4_1)
if L3_1 == nil then
  L3_1 = MpCommon
  L3_1 = L3_1.AtomicCounterSet
  L4_1 = L2_1
  L5_1 = "AC"
  L4_1 = L4_1 .. L5_1
  L5_1 = 1
  L6_1 = L1_1
  L3_1(L4_1, L5_1, L6_1)
else
  L3_1 = MpCommon
  L3_1 = L3_1.AtomicCounterAdd
  L4_1 = L2_1
  L5_1 = "AC"
  L4_1 = L4_1 .. L5_1
  L5_1 = 1
  L3_1(L4_1, L5_1)
end
L3_1 = pcall
L4_1 = MpCommon
L4_1 = L4_1.RollingQueueQueryKey
L5_1 = L2_1
L6_1 = L0_1
L3_1, L4_1 = L3_1(L4_1, L5_1, L6_1)
if L3_1 and L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.getfilename
L6_1 = mp
L6_1 = L6_1.FILEPATH_QUERY_FNAME
L5_1 = L5_1(L6_1)
if L5_1 ~= nil then
  L6_1 = #L5_1
  if not (L6_1 < 1) then
    goto lbl_75
  end
end
L6_1 = mp
L6_1 = L6_1.CLEAN
do return L6_1 end
::lbl_75::
L6_1 = 100
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.RollingQueueCount
L9_1 = L2_1
L7_1, L8_1 = L7_1(L8_1, L9_1)
L4_1 = L8_1
L3_1 = L7_1
if not L3_1 or L4_1 < 1 then
  L7_1 = pcall
  L8_1 = MpCommon
  L8_1 = L8_1.RollingQueueCreate
  L9_1 = L2_1
  L10_1 = L6_1
  L11_1 = L1_1
  L12_1 = 1
  L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
  L4_1 = L8_1
  L3_1 = L7_1
  if not L3_1 then
    L7_1 = mp
    L7_1 = L7_1.CLEAN
    return L7_1
  end
end
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.RollingQueueAppend
L9_1 = L2_1
L10_1 = L0_1
L11_1 = ""
L12_1 = L1_1
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1, L11_1, L12_1)
L4_1 = L8_1
L3_1 = L7_1
if not L3_1 then
  L7_1 = mp
  L7_1 = L7_1.CLEAN
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
