-- Threat: !InfrastructureShared
-- Name: 5d78f89c8fca
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
