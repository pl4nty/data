-- Threat: !InfrastructureShared
-- Name: !#TELPER:Lua:Crossrider_Installer
-- Type: 10
-- MpAttributes: HSTR:Crossrider_Installer

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:match("^%d+%-internal%-installer.exe") then
    return mp.INFECTED
  end
end
return mp.CLEAN
