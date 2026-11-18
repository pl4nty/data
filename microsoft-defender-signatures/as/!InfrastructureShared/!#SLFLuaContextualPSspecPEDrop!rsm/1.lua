-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaContextualPSspecPEDrop!rsm
-- Type: 13

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
  if l_0_1:find("roaming.exe", 1, true) ~= nil then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
    if l_0_2 == "powershell.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
