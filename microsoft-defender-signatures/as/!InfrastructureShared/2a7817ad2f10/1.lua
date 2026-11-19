-- Threat: !InfrastructureShared
-- Name: 2a7817ad2f10
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
