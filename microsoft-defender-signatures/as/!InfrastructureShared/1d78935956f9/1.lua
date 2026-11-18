-- Threat: !InfrastructureShared
-- Name: 1d78935956f9
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
