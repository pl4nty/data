-- Threat: !InfrastructureShared
-- Name: 1d787e8b21eb
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
