-- Threat: !InfrastructureShared
-- Name: 20787a946fd9
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
