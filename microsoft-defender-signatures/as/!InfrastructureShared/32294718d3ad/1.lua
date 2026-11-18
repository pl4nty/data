-- Threat: !InfrastructureShared
-- Name: 32294718d3ad
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and string.find(string.lower(mp.getfilename()), ".php") and 1400 < l_0_0 and l_0_0 < 2200 then
  return mp.INFECTED
end
return mp.CLEAN
