-- Threat: !InfrastructureShared
-- Name: 3d78f4251aec
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
