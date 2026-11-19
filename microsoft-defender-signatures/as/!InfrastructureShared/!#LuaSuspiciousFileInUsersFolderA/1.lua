-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousFileInUsersFolder.A
-- Type: 8
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
if l_0_0 == nil or #l_0_0 < 9 or l_0_0:find("\\users\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = mp.ContextualExpandEnvironmentVariables("%userprofile%")
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if #l_0_1 < 9 then
  return mp.CLEAN
end
if string.sub(l_0_0, 0, 4) == "\\\\?\\" then
  l_0_0 = string.sub(l_0_0, 5)
end
if l_0_0 == l_0_1 then
  if peattributes.isdll then
    mp.set_mpattribute("Lua:SuspiciousFileInUsersFolder.A!dll")
  elseif peattributes.isexe then
    mp.set_mpattribute("Lua:SuspiciousFileInUsersFolder.A!exe")
  end
  return mp.INFECTED
end
return mp.CLEAN
