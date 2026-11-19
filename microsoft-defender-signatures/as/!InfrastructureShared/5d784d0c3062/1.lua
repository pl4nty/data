-- Threat: !InfrastructureShared
-- Name: 5d784d0c3062
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
