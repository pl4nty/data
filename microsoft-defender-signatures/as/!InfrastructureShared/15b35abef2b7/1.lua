-- Threat: !InfrastructureShared
-- Name: 15b35abef2b7
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and (string.match(l_0_0, "/bin/%a*sh") or string.find(l_0_0, "perl", 1, true) or string.find(l_0_0, "python", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
