-- Threat: !InfrastructureShared
-- Name: 7f78922d1b2c
-- Type: 21

if mp.getfilesize() > 5242880 and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
