-- Threat: !InfrastructureShared
-- Name: 32b3becef1f2
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and (string.match(l_0_0, "/bin/%a*sh") or string.find(l_0_0, "perl", 1, true) or string.find(l_0_0, "python", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN
