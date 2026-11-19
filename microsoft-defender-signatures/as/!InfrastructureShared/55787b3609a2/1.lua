-- Threat: !InfrastructureShared
-- Name: 55787b3609a2
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
