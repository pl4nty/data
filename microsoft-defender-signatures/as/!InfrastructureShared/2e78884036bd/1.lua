-- Threat: !InfrastructureShared
-- Name: 2e78884036bd
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
