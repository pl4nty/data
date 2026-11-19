-- Threat: !InfrastructureShared
-- Name: 2a7809501a83
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
