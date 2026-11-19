-- Threat: !InfrastructureShared
-- Name: 10a617a5a0bf8
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
