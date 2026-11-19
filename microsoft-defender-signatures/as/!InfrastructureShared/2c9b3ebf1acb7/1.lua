-- Threat: !InfrastructureShared
-- Name: 2c9b3ebf1acb7
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
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if this_sigattrlog[5].matched then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = sysio.CommandLineScan(l_0_0, 0)
if l_0_1 then
  return mp.INFECTED
end
return mp.CLEAN
