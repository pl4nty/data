-- Threat: !InfrastructureShared
-- Name: 5678eb1ea852
-- Type: 21

if mp.getfilesize() < 98304 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
