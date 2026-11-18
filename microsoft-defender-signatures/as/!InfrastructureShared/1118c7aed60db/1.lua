-- Threat: !InfrastructureShared
-- Name: 1118c7aed60db
-- Type: 21

local l_0_0 = 124338955
if hstrlog[1].matched then
  l_0_0 = 117354057
end
local l_0_1 = mp.getfilesize()
if l_0_1 == nil or l_0_1 < l_0_0 + 512 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_2 = mp.readfile(l_0_0, 512)
if l_0_2 == nil or #l_0_2 ~= 512 then
  return mp.CLEAN
end
local l_0_3 = {
  "main.sweepFiles",
  "main.encBundle",
  "main.sendBundle",
  "main.ghFallback",
  "main.forkScand"
}
for l_0_4, l_0_5 in ipairs(l_0_3) do
  if not string.find(l_0_2, l_0_5 .. "\000", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
