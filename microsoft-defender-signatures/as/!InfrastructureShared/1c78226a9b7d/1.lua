-- Threat: !InfrastructureShared
-- Name: 1c78226a9b7d
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
