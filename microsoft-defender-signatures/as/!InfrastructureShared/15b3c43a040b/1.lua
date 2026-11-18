-- Threat: !InfrastructureShared
-- Name: 15b3c43a040b
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if l_0_0 and string.find(l_0_0, "cryptneturlcache", 1, true) then
  return mp.CLEAN
end
return mp.INFECTED
