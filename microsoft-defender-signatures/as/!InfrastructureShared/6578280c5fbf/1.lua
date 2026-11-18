-- Threat: !InfrastructureShared
-- Name: 6578280c5fbf
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "wzunzip%.exe") or string.find(l_0_0, "wzcline40%-64%.exe") or string.find(l_0_0, "wzcline40%-32%.exe") then
  return mp.CLEAN
end
return mp.INFECTED
