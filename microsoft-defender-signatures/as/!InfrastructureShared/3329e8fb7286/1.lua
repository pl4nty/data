-- Threat: !InfrastructureShared
-- Name: 3329e8fb7286
-- Type: 21

local l_0_0 = mp.getfilename()
if string.find(l_0_0, "AppxManifest.xml") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
