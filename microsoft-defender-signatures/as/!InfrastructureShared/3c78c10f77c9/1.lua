-- Threat: !InfrastructureShared
-- Name: 3c78c10f77c9
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
