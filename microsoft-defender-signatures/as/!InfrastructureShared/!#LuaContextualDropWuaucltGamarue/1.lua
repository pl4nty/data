-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropWuaucltGamarue
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if (l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1 == "thumbs.db" or l_0_1 == "desktop.ini" or l_0_1 == "autorun.inf" then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "wuauclt.exe" or l_0_2 == "wupdmgr.exe" then
      mp.set_mpattribute("Lua:ContextualDropWuaucltGamarue")
    end
  end
end
return mp.CLEAN
