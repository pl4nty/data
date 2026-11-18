-- Threat: !InfrastructureShared
-- Name: 58786315ea21
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
