-- Threat: !InfrastructureShared
-- Name: 2d78a09b8103
-- Type: 21

if peattributes.x86_image and peattributes.no_exports and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
