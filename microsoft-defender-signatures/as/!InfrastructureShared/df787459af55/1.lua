-- Threat: !InfrastructureShared
-- Name: df787459af55
-- Type: 21
-- Flags: 1

if mp.getfilesize() < 50000 or mp.getfilesize() > 100000 then
  return mp.CLEAN
end
if peattributes.isdriver then
  return mp.INFECTED
end
return mp.CLEAN
