-- Threat: !InfrastructureShared
-- Name: !#ContextualVSSPersistContextSet
-- Type: 13
-- MpAttributes: MpVssAmsiScan & VSSAMSI_Shadow_Delete

local l_0_0 = mp.get_mpattributevalue("VSSAMSI_CallerPID")
local l_0_1 = mp.get_mpattributevalue("VSSAMSI_ProcessStartTime")
if l_0_0 == nil or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2
local l_0_3 = string.format("pid:%d,ProcessStart:%u", l_0_0, l_0_1)
l_0_2 = mp.GetProcessCommandLine(l_0_3)
if l_0_2 ~= nil then
  local l_0_4 = {}
  table.insert(l_0_4, l_0_3)
  if MpCommon.GetPersistContextCountNoPath("vssamsipid") > 0 then
    MpCommon.OverwritePersistContextNoPath("vssamsipid", l_0_4, 120)
  else
    MpCommon.SetPersistContextNoPath("vssamsipid", l_0_4, 120)
  end
  return mp.INFECTED
end
return mp.CLEAN
