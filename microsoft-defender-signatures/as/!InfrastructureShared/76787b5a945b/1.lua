-- Threat: !InfrastructureShared
-- Name: 76787b5a945b
-- Type: 21

if peattributes.isexe and peattributes.hasappendeddata and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
