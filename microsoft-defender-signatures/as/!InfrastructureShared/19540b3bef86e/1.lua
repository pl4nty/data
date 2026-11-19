-- Threat: !InfrastructureShared
-- Name: 19540b3bef86e
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
