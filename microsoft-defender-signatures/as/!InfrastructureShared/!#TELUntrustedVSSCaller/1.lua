local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1
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
L2_1 = true
L3_1 = false
L4_1 = nil
L5_1 = nil
L6_1 = nil
L7_1 = true
L8_1 = string
L8_1 = L8_1.format
L9_1 = "pid:%u,ProcessStart:%u"
L10_1 = L0_1
L11_1 = L1_1
L8_1 = L8_1(L9_1, L10_1, L11_1)
L9_1 = pcall
L10_1 = MpCommon
L10_1 = L10_1.IsFriendlyProcess
L11_1 = L8_1
L10_1, L11_1, L12_1, L13_1, L14_1 = L10_1(L11_1)
L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1, L14_1)
L2_1 = L10_1
L7_1 = L9_1
if L7_1 == true and L2_1 == false then
  L9_1 = mp
  L9_1 = L9_1.GetProcessCommandLine
  L10_1 = L8_1
  L9_1 = L9_1(L10_1)
  L10_1 = mp
  L10_1 = L10_1.set_mpattribute
  L11_1 = string
  L11_1 = L11_1.format
  L12_1 = "MpInternal_researchdata=VSSUntrustedCaller=%s"
  L13_1 = L9_1
  L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1, L13_1)
  L10_1(L11_1, L12_1, L13_1, L14_1)
  L10_1 = TrackPidAndTechnique
  L11_1 = "VSSAMSI"
  L12_1 = "T1490"
  L13_1 = "inhibit_system_recovery"
  L10_1(L11_1, L12_1, L13_1)
  L10_1 = mp
  L10_1 = L10_1.INFECTED
  return L10_1
end
L9_1 = 0
while L9_1 <= 5 do
  L10_1 = pcall
  L11_1 = mp
  L11_1 = L11_1.GetParentProcInfo
  L12_1 = L0_1
  L10_1, L11_1 = L10_1(L11_1, L12_1)
  L4_1 = L11_1
  L7_1 = L10_1
  if L7_1 ~= true or L4_1 == nil then
    break
  end
  L5_1 = L4_1.ppid
  if L5_1 == nil then
    break
  end
  L6_1 = L4_1.image_path
  if L6_1 == nil then
    break
  end
  L10_1 = string
  L10_1 = L10_1.lower
  L11_1 = L6_1
  L10_1 = L10_1(L11_1)
  L6_1 = L10_1
  L10_1 = pcall
  L11_1 = mp
  L11_1 = L11_1.IsKnownFriendlyFile
  L12_1 = L6_1
  L13_1 = true
  L14_1 = false
  L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1, L13_1, L14_1)
  L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1, L14_1)
  L3_1 = L11_1
  L7_1 = L10_1
  if L7_1 == true and L3_1 == false then
    L10_1 = mp
    L10_1 = L10_1.set_mpattribute
    L11_1 = string
    L11_1 = L11_1.format
    L12_1 = "MpInternal_researchdata=VSSUntrustedParent=%s"
    L13_1 = L6_1
    L11_1, L12_1, L13_1, L14_1 = L11_1(L12_1, L13_1)
    L10_1(L11_1, L12_1, L13_1, L14_1)
    L10_1 = TrackPidAndTechnique
    L11_1 = "VSSAMSI"
    L12_1 = "T1490"
    L13_1 = "inhibit_system_recovery"
    L10_1(L11_1, L12_1, L13_1)
    L10_1 = mp
    L10_1 = L10_1.INFECTED
    return L10_1
  end
  L9_1 = L9_1 + 1
end
L10_1 = mp
L10_1 = L10_1.CLEAN
return L10_1
