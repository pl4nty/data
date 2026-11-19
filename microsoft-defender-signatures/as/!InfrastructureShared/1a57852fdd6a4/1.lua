-- Threat: !InfrastructureShared
-- Name: 1a57852fdd6a4
-- Type: 21

if mp.getfilesize() < 1048000 then
  return mp.INFECTED
end
return mp.CLEAN
