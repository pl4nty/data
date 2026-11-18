-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropDHLOutlook
-- Type: 13
-- Includes: GetEmailPaths

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:find("^dhl") == 1 and isOutlookProcess() then
    mp.set_mpattribute("Lua:ContextualDropDHLOutlook")
  end
end
return mp.CLEAN
