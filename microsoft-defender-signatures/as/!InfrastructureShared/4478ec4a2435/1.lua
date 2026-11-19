-- Threat: !InfrastructureShared
-- Name: 4478ec4a2435
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
