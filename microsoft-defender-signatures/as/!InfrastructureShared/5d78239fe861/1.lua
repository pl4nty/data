-- Threat: !InfrastructureShared
-- Name: 5d78239fe861
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "rar%.exe") then
  return mp.CLEAN
end
return mp.INFECTED
