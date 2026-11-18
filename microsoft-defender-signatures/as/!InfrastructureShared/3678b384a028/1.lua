-- Threat: !InfrastructureShared
-- Name: 3678b384a028
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
