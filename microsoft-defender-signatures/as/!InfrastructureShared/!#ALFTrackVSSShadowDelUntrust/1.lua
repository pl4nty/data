local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1
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
L4_1 = true
L5_1 = true
L6_1 = string
L6_1 = L6_1.format
L7_1 = "pid:%d,ProcessStart:%u"
L8_1 = L0_1
L9_1 = L1_1
L6_1 = L6_1(L7_1, L8_1, L9_1)
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.IsFriendlyProcess
L9_1 = L6_1
L8_1, L9_1, L10_1 = L8_1(L9_1)
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
L5_1 = L8_1
L4_1 = L7_1
if L4_1 == true and L5_1 == false then
  L7_1 = mp
  L7_1 = L7_1.GetProcessCommandLine
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L2_1 = L7_1
end
if L2_1 ~= nil then
  L7_1 = mp
  L7_1 = L7_1.set_mpattribute
  L8_1 = string
  L8_1 = L8_1.format
  L9_1 = "MpInternal_researchdata=VSSUntrustedCaller=%s"
  L10_1 = L2_1
  L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
  L7_1(L8_1, L9_1, L10_1)
  L7_1 = mp
  L7_1 = L7_1.GetParentProcInfo
  L8_1 = L6_1
  L7_1 = L7_1(L8_1)
  L3_1 = L7_1
  if L3_1 ~= nil then
    L7_1 = L3_1.image_path
    if L7_1 ~= nil then
      L7_1 = mp
      L7_1 = L7_1.set_mpattribute
      L8_1 = string
      L8_1 = L8_1.format
      L9_1 = "MpInternal_researchdata=VSSCallerParent=%s"
      L10_1 = L3_1.image_path
      L8_1, L9_1, L10_1 = L8_1(L9_1, L10_1)
      L7_1(L8_1, L9_1, L10_1)
    end
  end
  L7_1 = mp
  L7_1 = L7_1.INFECTED
  return L7_1
end
L7_1 = mp
L7_1 = L7_1.CLEAN
return L7_1
