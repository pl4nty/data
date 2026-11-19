-- Threat: !InfrastructureShared
-- Name: 1090b392cdadbc
-- Type: 21

local l_0_0
if this_sigattrlog[81].matched then
  l_0_0 = this_sigattrlog[81].utf8p1
elseif this_sigattrlog[82].matched then
  l_0_0 = this_sigattrlog[82].utf8p1
elseif this_sigattrlog[83].matched then
  l_0_0 = this_sigattrlog[83].utf8p1
elseif this_sigattrlog[84].matched then
  l_0_0 = this_sigattrlog[84].utf8p1
end
if l_0_0 then
  bm.add_related_file(l_0_0)
end
return mp.INFECTED
