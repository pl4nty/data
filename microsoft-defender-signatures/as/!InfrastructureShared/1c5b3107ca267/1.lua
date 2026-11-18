-- Threat: !InfrastructureShared
-- Name: 1c5b3107ca267
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p1:lower()
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p1:lower()
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p1:lower()
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p1:lower()
end
if l_0_0 == nil or l_0_0 == "https://clients2.google.com/service/update2/crx" then
  return mp.CLEAN
end
return mp.INFECTED
