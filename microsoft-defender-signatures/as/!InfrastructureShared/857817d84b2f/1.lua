-- Threat: !InfrastructureShared
-- Name: 857817d84b2f
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
