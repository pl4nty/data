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
L3_1 = nil
L4_1 = string
L4_1 = L4_1.format
L5_1 = "pid:%d,ProcessStart:%u"
L6_1 = L0_1
L7_1 = L1_1
L4_1 = L4_1(L5_1, L6_1, L7_1)
L5_1 = mp
L5_1 = L5_1.GetProcessCommandLine
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L2_1 = L5_1
if L2_1 ~= nil then
  L5_1 = mp
  L5_1 = L5_1.set_mpattribute
  L6_1 = string
  L6_1 = L6_1.format
  L7_1 = "MpInternal_researchdata=VSSUntrustedCaller=%s"
  L8_1 = L2_1
  L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
  L5_1(L6_1, L7_1, L8_1)
  L5_1 = mp
  L5_1 = L5_1.GetParentProcInfo
  L6_1 = L4_1
  L5_1 = L5_1(L6_1)
  L3_1 = L5_1
  if L3_1 ~= nil then
    L5_1 = L3_1.image_path
    if L5_1 ~= nil then
      L5_1 = mp
      L5_1 = L5_1.set_mpattribute
      L6_1 = string
      L6_1 = L6_1.format
      L7_1 = "MpInternal_researchdata=VSSCallerParent=%s"
      L8_1 = L3_1.image_path
      L6_1, L7_1, L8_1 = L6_1(L7_1, L8_1)
      L5_1(L6_1, L7_1, L8_1)
    end
  end
  L5_1 = mp
  L5_1 = L5_1.INFECTED
  return L5_1
end
L5_1 = mp
L5_1 = L5_1.CLEAN
return L5_1
