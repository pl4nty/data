-- Threat: !InfrastructureShared
-- Name: 5129c9c835fc
-- Type: 21

local l_0_0 = mp.getfilename()
local l_0_1 = string.lower(l_0_0)
if string.match(l_0_1, "%.cache") then
  return mp.CLEAN
end
return mp.INFECTED
