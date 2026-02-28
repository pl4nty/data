local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1
L0_1 = mp
L0_1 = L0_1.get_mpattributevalue
L1_1 = "VSSAMSI_CallerPID"
L0_1 = L0_1(L1_1)
L1_1 = mp
L1_1 = L1_1.get_mpattributevalue
L2_1 = "VSSAMSI_ProcessStartTime"
L1_1 = L1_1(L2_1)
if L0_1 == nil or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = nil
L3_1 = string
L3_1 = L3_1.format
L4_1 = "pid:%d,ProcessStart:%u"
L5_1 = L0_1
L6_1 = L1_1
L3_1 = L3_1(L4_1, L5_1, L6_1)
L4_1 = mp
L4_1 = L4_1.GetProcessCommandLine
L5_1 = L3_1
L4_1 = L4_1(L5_1)
L2_1 = L4_1
if L2_1 ~= nil then
  L4_1 = {}
  L5_1 = table
  L5_1 = L5_1.insert
  L6_1 = L4_1
  L7_1 = L3_1
  L5_1(L6_1, L7_1)
  L5_1 = MpCommon
  L5_1 = L5_1.GetPersistContextCountNoPath
  L6_1 = "vssamsipid"
  L5_1 = L5_1(L6_1)
  if 0 < L5_1 then
    L5_1 = MpCommon
    L5_1 = L5_1.OverwritePersistContextNoPath
    L6_1 = "vssamsipid"
    L7_1 = L4_1
    L8_1 = 120
    L5_1(L6_1, L7_1, L8_1)
  else
    L5_1 = MpCommon
    L5_1 = L5_1.SetPersistContextNoPath
    L6_1 = "vssamsipid"
    L7_1 = L4_1
    L8_1 = 120
    L5_1(L6_1, L7_1, L8_1)
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L4_1 = mp
L4_1 = L4_1.CLEAN
return L4_1
