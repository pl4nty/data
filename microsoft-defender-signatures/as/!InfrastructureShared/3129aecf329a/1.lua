-- Threat: !InfrastructureShared
-- Name: 3129aecf329a
-- Type: 21

local l_0_0 = mp.getfilesize()
if 700 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
mp.readprotection(true)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = string.lower(l_0_1)
local l_0_3 = string.gsub(l_0_2, "['\"%s]+$", "")
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if not string.match(l_0_3, "ahqaeab0ackalgbdag8abgb0aguabgb0aa==$") then
  return mp.CLEAN
end
local l_0_4 = l_0_3:match("^powershell")
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
return mp.INFECTED
