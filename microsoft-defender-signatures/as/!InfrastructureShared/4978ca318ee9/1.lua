-- Threat: !InfrastructureShared
-- Name: 4978ca318ee9
-- Type: 21

if mp.getfilesize() < 98304 and peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
