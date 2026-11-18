-- Threat: !InfrastructureShared
-- Name: b178ad8b3a6f
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
