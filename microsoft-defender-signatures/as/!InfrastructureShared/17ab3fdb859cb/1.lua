-- Threat: !InfrastructureShared
-- Name: 17ab3fdb859cb
-- Type: 21

local l_0_0, l_0_1, l_0_2
if this_sigattrlog[1].matched then
  l_0_2 = this_sigattrlog[1].utf8p2
  l_0_0 = this_sigattrlog[1].ppid
end
if this_sigattrlog[2].matched then
  l_0_1 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_1 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_1 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched then
  l_0_1 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched then
  l_0_1 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched then
  l_0_1 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched then
  l_0_1 = this_sigattrlog[8].utf8p2
elseif this_sigattrlog[9].matched then
  l_0_1 = this_sigattrlog[9].utf8p2
end
if not (l_0_0 and l_0_1) or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.match(l_0_2, "/([^/]+)$")
if not l_0_3 then
  return mp.CLEAN
end
if string.find(l_0_1, l_0_3, 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
