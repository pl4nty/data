-- Threat: !InfrastructureShared
-- Name: !#Lua:WGAMsiexec.A
-- Type: 9

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_1:find("\\windows genuine advantage\\{", 1, true) ~= nil then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
    if l_0_2 == "msiexec.exe" then
      mp.set_mpattribute("Lua:WGAMsiexec.A")
    end
  end
end
return mp.CLEAN
