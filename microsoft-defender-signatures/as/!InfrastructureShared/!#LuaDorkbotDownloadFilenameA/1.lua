-- Threat: !InfrastructureShared
-- Name: !#Lua:DorkbotDownloadFilename.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  local l_0_2 = mp.getfilesize()
  if l_0_2 < 50000 or 500000 < l_0_2 then
    return mp.CLEAN
  end
  if l_0_1:find("^api%d%[%d%]%.gif$") == 1 or l_0_1:find("^api%d%.gif$") == 1 or l_0_1:find("^napi%d%[%d%]%.gif$") == 1 or l_0_1:find("^napi%d%.gif$") == 1 then
    mp.set_mpattribute("Lua:DorkbotDownloadFilename.A")
  end
end
return mp.CLEAN
