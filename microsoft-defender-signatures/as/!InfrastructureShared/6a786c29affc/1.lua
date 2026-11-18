-- Threat: !InfrastructureShared
-- Name: 6a786c29affc
-- Type: 21

if mp.getfilesize() >= 482000 then
  return mp.INFECTED
end
return mp.CLEAN
