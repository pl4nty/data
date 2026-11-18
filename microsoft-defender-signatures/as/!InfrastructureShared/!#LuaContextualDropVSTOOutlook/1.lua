-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropVSTOOutlook
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:VSTOExt

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if l_0_1 == "outlook.exe" then
    mp.set_mpattribute("Lua:ContextualDropVSTOOutlook")
  end
end
return mp.CLEAN
