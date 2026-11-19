-- Threat: !InfrastructureShared
-- Name: 12e61381aee89
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
