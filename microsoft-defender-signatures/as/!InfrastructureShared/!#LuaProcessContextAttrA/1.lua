-- Threat: !InfrastructureShared
-- Name: !#Lua:ProcessContextAttr.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (AGGR:PossibleExecutableFileExt.A | AGGR:ContextFileInclusion.A | AGGR:SpecialFileExt.B)

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == nil or l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_ID)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1 < 12 then
  mp.set_mpattribute("Lua:ProcessContextAttr.A!HasSystemProcId")
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_2)
if l_0_3 ~= nil then
  if l_0_3.IntegrityLevel ~= nil and l_0_3.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    mp.set_mpattribute("Lua:ProcessContextAttr.A!IntegrityLevelSystem")
  end
  if l_0_3.IsElevated ~= nil and l_0_3.IsElevated == true then
    mp.set_mpattribute("Lua:ProcessContextAttr.A!IsElevated")
  end
  if l_0_3.ElevationType ~= nil and type(l_0_3.ElevationType) == "number" then
    mp.set_mpattribute("Lua:ProcessContextAttr.A!ElevationType" .. tostring(l_0_3.ElevationType))
  end
end
return mp.CLEAN
