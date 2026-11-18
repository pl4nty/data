-- Threat: !InfrastructureShared
-- Name: !#Lua:Container.A
-- Type: 13

local l_0_0 = mp.getfilesize()
if l_0_0 <= 300 or 600000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if l_0_1 ~= nil and (l_0_1:match("%->.+/") or l_0_1:match("%->.+\\") or l_0_1:match("%->.+%->")) then
  return mp.INFECTED
end
return mp.CLEAN
