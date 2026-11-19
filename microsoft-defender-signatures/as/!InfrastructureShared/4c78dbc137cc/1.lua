-- Threat: !InfrastructureShared
-- Name: 4c78dbc137cc
-- Type: 21

if peattributes.isexe and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
