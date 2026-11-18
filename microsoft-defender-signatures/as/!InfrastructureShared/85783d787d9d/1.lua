-- Threat: !InfrastructureShared
-- Name: 85783d787d9d
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
