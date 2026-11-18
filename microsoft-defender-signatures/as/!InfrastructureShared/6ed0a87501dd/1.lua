-- Threat: !InfrastructureShared
-- Name: 6ed0a87501dd
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 16896 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(l_0_0 - 16896, 16896)
local l_0_2 = l_0_1:find("qxgxwddm)(if(findfile \"bakdwg.fas\")(load \"bakdwg.fas\")))", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
return mp.INFECTED
