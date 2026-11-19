-- Threat: !InfrastructureShared
-- Name: 1d78b1cf5693
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
