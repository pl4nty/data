-- Threat: !InfrastructureShared
-- Name: 22fb339740e56
-- Type: 21

local l_0_0
if this_sigattrlog[7].matched then
  l_0_0 = this_sigattrlog[7].utf8p1
elseif this_sigattrlog[8].matched then
  l_0_0 = this_sigattrlog[8].utf8p1
elseif this_sigattrlog[9].matched then
  l_0_0 = this_sigattrlog[9].utf8p1
else
  return mp.CLEAN
end
if mp.ENGINEBUILD < 17100 then
  l_0_0 = string.lower(l_0_0)
  if l_0_0:find(":\\program files\\windows defender\\", 1, true) ~= nil or l_0_0:find(":\\program files\\microsoft security client\\", 1, true) ~= nil or l_0_0:find(":\\programdata\\microsoft\\windows defender\\platform", 1, true) ~= nil then
    return mp.CLEAN
  end
end
return mp.INFECTED
