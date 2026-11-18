-- Threat: !InfrastructureShared
-- Name: 2a789be711b7
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
