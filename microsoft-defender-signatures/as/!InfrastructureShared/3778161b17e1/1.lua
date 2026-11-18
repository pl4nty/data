-- Threat: !InfrastructureShared
-- Name: 3778161b17e1
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
