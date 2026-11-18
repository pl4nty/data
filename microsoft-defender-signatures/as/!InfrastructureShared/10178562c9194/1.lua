-- Threat: !InfrastructureShared
-- Name: 10178562c9194
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
