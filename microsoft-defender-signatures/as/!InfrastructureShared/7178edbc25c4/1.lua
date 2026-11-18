-- Threat: !InfrastructureShared
-- Name: 7178edbc25c4
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
