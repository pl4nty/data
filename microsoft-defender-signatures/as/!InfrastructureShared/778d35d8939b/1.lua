-- Threat: !InfrastructureShared
-- Name: 778d35d8939b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 16 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = l_0_0 - 16
local l_0_2 = mp.readfile(l_0_1, 16)
if l_0_2 and string.find(l_0_2, "Athena.deps.json", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
