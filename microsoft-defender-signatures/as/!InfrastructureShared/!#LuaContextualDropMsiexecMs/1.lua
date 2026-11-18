-- Threat: !InfrastructureShared
-- Name: !#Lua:ContextualDropMsiexecMs
-- Type: 9

if mp.getfilesize() > 2097152 then
  return mp.CLEAN
end
if not peattributes.isexe then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
  if l_0_1:sub(-4) ~= ".exe" then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  if l_0_2:sub(-10) == "\\all users" or l_0_2:sub(-12) == "\\programdata" or l_0_2:sub(-17) == "\\application data" or l_0_2:sub(-16) == "\\appdata\\roaming" then
    if #l_0_1 < 9 or 16 < #l_0_1 then
      return mp.CLEAN
    end
    if (l_0_1:match("^ms%l%l%l+%.exe$") ~= nil or l_0_1:match("^dx%l%l%l+%.exe$") ~= nil) and string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)) == "msiexec.exe" then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
