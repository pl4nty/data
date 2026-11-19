-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:GamRT
-- Type: 9

if not peattributes.isdriver then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if l_0_1:len() ~= 20 then
    return mp.CLEAN
  end
  if l_0_1:sub(-4) ~= ".sys" then
    return mp.CLEAN
  end
  if l_0_1:find("^%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%.sys$") then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if l_0_2:find("\\windows\\system32\\drivers$") and string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "msiexec.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
