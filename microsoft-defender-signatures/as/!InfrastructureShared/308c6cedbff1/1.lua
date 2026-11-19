-- Threat: !InfrastructureShared
-- Name: 308c6cedbff1
-- Type: 21

if mp.getfilesize() <= 12288 then
  return mp.INFECTED
end
return mp.CLEAN
