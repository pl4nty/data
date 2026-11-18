-- Threat: !InfrastructureShared
-- Name: 3629341fa860
-- Type: 21

local l_0_0 = mp.getfilesize()
if 24576 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = tostring(mp.readfile(0, l_0_0))
l_0_1 = string.lower(l_0_1)
if string.find(l_0_1, "c%z:%z\\%zc%zo%zs%zu%zv%z\\%zw%ze%zg%ze%zr%zb%z\\%z.+%.%ze%zx%ze") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
