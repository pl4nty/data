-- Threat: !InfrastructureShared
-- Name: 6ab32679813f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetExecutablesFromCommandLine(l_0_0)
local l_0_2 = string.find(l_0_1[2], ",", 1, true)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.sub(l_0_1[2], 1, l_0_2 - 1)
mp.ReportLowfi(l_0_3, 2300354182)
return mp.INFECTED
