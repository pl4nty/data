-- Threat: !InfrastructureShared
-- Name: 53291f8e49e8
-- Type: 21

local l_0_0 = string.lower(mp.getfilename())
if string.find(l_0_0, "word/_rels", 1, true) ~= nil and mp.getfilesize() < 400 then
  return mp.INFECTED
end
return mp.CLEAN
