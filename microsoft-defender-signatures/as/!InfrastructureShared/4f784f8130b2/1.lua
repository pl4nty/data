-- Threat: !InfrastructureShared
-- Name: 4f784f8130b2
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "miniunz%.exe") or string.find(l_0_0, "miniunz %(2015_") or string.find(l_0_0, "%.svn%-base") then
  return mp.CLEAN
end
return mp.INFECTED
