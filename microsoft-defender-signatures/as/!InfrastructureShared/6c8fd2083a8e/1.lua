-- Threat: !InfrastructureShared
-- Name: 6c8fd2083a8e
-- Type: 21

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
if string.find(l_0_1, "http://www.j.mp/") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
