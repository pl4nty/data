-- Threat: !InfrastructureShared
-- Name: !#ALF:Lua:ContextualGamOb2
-- Type: 9

if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN or l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if l_0_1:sub(-4) ~= ".exe" then
    return mp.CLEAN
  end
  if l_0_1:find("^ob%w+%.exe", 1, false) then
    local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
    if (l_0_2:sub(-10) == "\\all users" or l_0_2:sub(-12) == "\\programdata" or l_0_2:sub(-17) == "\\application data" or l_0_2:sub(-16) == "\\appdata\\roaming") and (string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "rundll32.exe" or string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "msiexec.exe") then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
