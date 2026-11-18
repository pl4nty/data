-- Threat: !InfrastructureShared
-- Name: 1b78c1f53964
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
