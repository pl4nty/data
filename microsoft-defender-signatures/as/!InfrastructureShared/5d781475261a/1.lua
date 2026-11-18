-- Threat: !InfrastructureShared
-- Name: 5d781475261a
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
