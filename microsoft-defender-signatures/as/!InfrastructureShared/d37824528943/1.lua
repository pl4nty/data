-- Threat: !InfrastructureShared
-- Name: d37824528943
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_exports and peattributes.hasappendeddata then
  return mp.INFECTED
end
return mp.CLEAN
