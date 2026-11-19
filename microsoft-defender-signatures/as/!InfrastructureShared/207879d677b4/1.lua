-- Threat: !InfrastructureShared
-- Name: 207879d677b4
-- Type: 21

if peattributes.x86_image and peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
