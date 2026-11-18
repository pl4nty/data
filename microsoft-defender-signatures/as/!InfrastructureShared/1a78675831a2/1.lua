-- Threat: !InfrastructureShared
-- Name: 1a78675831a2
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
