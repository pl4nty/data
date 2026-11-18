-- Threat: !InfrastructureShared
-- Name: 5a783210a851
-- Type: 21

if mp.getfilesize() < 450000 and pesecs[3].VirtualSize > 524288 then
  return mp.INFECTED
end
return mp.CLEAN
