-- Threat: !InfrastructureShared
-- Name: 15b36b11957f
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil then
  l_0_0 = string.lower(string.sub(l_0_0, -12))
  if l_0_0 == "wmiprvse.exe" or string.sub(l_0_0, -11) == "svchost.exe" or string.sub(l_0_0, -9) == "csrss.exe" or l_0_0 == "vmtoolsd.exe" then
    return mp.CLEAN
  end
end
return mp.INFECTED
