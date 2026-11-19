-- Threat: !InfrastructureShared
-- Name: da783d7a3f0d
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
