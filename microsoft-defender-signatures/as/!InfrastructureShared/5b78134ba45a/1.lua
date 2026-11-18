-- Threat: !InfrastructureShared
-- Name: 5b78134ba45a
-- Type: 21

if mp.getfilesize() < 450000 and pesecs[3].VirtualSize > 524288 then
  return mp.INFECTED
end
return mp.CLEAN
