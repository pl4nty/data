-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropTmpExe.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if (string.sub(l_0_1, -5) == "\\temp" or string.sub(l_0_1, -9) == "\\temp\\low") and l_0_2:len() < 13 and l_0_2:find("^[0-9A-F][0-9A-F]?[0-9A-F]?[0-9A-F]?%.tmp%.exe$") == 1 then
    mp.set_mpattribute("Lua:ContextualDropTmpExe.A")
    mp.set_mpattribute("SLF:Lua:ContextualDropTmpExe.A!fdr")
  end
end
return mp.CLEAN
