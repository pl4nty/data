-- Threat: !InfrastructureShared
-- Name: !#ALF:TrackVSSShadowDelUntrust
-- Type: 13
-- MpAttributes: MpVssAmsiScan & VSSAMSI_Shadow_Delete

local l_0_0 = mp.get_mpattributevalue("VSSAMSI_CallerPID")
local l_0_1 = mp.get_mpattributevalue("VSSAMSI_ProcessStartTime")
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2, l_0_3
local l_0_4 = true
local l_0_5 = true
local l_0_6 = string.format("pid:%d,ProcessStart:%u", l_0_0, l_0_1)
l_0_4, l_0_5 = pcall(MpCommon.IsFriendlyProcess(l_0_6))
if l_0_4 == true and l_0_5 == false then
  l_0_2 = mp.GetProcessCommandLine(l_0_6)
end
if l_0_2 ~= nil then
  mp.set_mpattribute(string.format("MpInternal_researchdata=VSSUntrustedCaller=%s", l_0_2))
  l_0_3 = mp.GetParentProcInfo(l_0_6)
  if l_0_3 ~= nil and l_0_3.image_path ~= nil then
    mp.set_mpattribute(string.format("MpInternal_researchdata=VSSCallerParent=%s", l_0_3.image_path))
  end
  return mp.INFECTED
end
return mp.CLEAN
