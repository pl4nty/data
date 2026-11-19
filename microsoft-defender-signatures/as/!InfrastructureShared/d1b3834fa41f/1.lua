-- Threat: !InfrastructureShared
-- Name: d1b3834fa41f
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_0 = this_sigattrlog[4].utf8p2
end
if l_0_0 ~= nil and (string.match(l_0_0, "-[is] [^\\]+\\ ") or string.match(l_0_0, "-[is] [^\\]+\\$")) then
  return mp.INFECTED
end
return mp.CLEAN
