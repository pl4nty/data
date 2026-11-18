-- Threat: !InfrastructureShared
-- Name: 337870296ff6
-- Type: 21

if peattributes.x86_image and peattributes.no_exports and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
