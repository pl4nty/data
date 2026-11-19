-- Threat: !InfrastructureShared
-- Name: 4129f6db8fd1
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "AppxManifest.xml") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
