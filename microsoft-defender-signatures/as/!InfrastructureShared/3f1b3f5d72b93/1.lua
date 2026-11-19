-- Threat: !InfrastructureShared
-- Name: 3f1b3f5d72b93
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1
end
if l_0_0 and mp.IsKnownFriendlyFile(l_0_0, false, true) == false then
  bm.add_related_file(l_0_0)
  return mp.INFECTED
end
return mp.CLEAN
