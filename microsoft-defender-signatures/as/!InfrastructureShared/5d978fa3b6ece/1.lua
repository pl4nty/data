-- Threat: !InfrastructureShared
-- Name: 5d978fa3b6ece
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
