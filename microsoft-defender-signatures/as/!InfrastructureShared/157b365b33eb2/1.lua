-- Threat: !InfrastructureShared
-- Name: 157b365b33eb2
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "\\svchost.exe" then
  return mp.CLEAN
end
return mp.INFECTED
