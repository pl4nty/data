-- Threat: !InfrastructureShared
-- Name: 8578d2a21554
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
