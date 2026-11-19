-- Threat: !InfrastructureShared
-- Name: efb3f341f2fd
-- Type: 21

local l_0_0 = string.lower(bm.get_imagepath())
if string.sub(l_0_0, -12) == "\\svchost.exe" then
  return mp.CLEAN
end
if string.sub(l_0_0, -13) == "\\explorer.exe" then
  return mp.CLEAN
end
return mp.INFECTED
