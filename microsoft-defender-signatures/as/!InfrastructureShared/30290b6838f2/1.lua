-- Threat: !InfrastructureShared
-- Name: 30290b6838f2
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 ~= nil and string.find(string.lower(mp.getfilename()), ".php") and 40000 < l_0_0 and l_0_0 < 48000 then
  return mp.INFECTED
end
return mp.CLEAN
