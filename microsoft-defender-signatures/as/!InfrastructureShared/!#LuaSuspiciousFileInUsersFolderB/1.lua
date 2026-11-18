-- Threat: !InfrastructureShared
-- Name: !#Lua:SuspiciousFileInUsersFolder.B
-- Type: 8
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

if not peattributes.isexe and not peattributes.isdll then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_0 == nil or #l_0_0 < 9 or l_0_0:find("\\users\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_1 = string.match(l_0_0, "\\users\\(.+)$")
if l_0_1 == nil or #l_0_1 < 1 or string.find(l_0_1, "\\", 1, true) ~= nil then
  return mp.CLEAN
end
if string.sub(l_0_0, 0, 4) == "\\\\?\\" then
  l_0_0 = string.sub(l_0_0, 5)
end
local l_0_2 = string.match(l_0_0, "(.+)\\users\\.+$")
if l_0_2 == nil or #l_0_2 < 1 or string.find(l_0_2, "\\", 1, true) ~= nil then
  return mp.CLEAN
end
if peattributes.isdll then
  mp.set_mpattribute("Lua:SuspiciousFileInUsersFolder.B!dll")
elseif peattributes.isexe then
  mp.set_mpattribute("Lua:SuspiciousFileInUsersFolder.B!exe")
end
return mp.INFECTED
