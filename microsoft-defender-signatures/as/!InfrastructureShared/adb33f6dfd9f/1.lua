-- Threat: !InfrastructureShared
-- Name: adb33f6dfd9f
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
end
if this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 ~= nil then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
