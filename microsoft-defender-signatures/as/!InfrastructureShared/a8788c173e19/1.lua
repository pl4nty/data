-- Threat: !InfrastructureShared
-- Name: a8788c173e19
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
