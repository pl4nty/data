-- Threat: !InfrastructureShared
-- Name: 5d78742a8d06
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
