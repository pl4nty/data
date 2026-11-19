-- Threat: !InfrastructureShared
-- Name: 4e29f8c14e9c
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "websettings.xml.rels") ~= nil and mp.getfilesize() < 400 then
  return mp.INFECTED
end
return mp.CLEAN
