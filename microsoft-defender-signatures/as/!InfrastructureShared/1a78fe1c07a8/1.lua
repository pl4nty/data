-- Threat: !InfrastructureShared
-- Name: 1a78fe1c07a8
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
