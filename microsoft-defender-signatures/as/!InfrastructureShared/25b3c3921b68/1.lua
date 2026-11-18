-- Threat: !InfrastructureShared
-- Name: 25b3c3921b68
-- Type: 21

local l_0_0 = string.lower(string.sub(bm.get_imagepath(), -18))
if l_0_0 == "browser_broker.exe" or l_0_0 == "\\runtimebroker.exe" then
  return mp.CLEAN
end
return mp.INFECTED
