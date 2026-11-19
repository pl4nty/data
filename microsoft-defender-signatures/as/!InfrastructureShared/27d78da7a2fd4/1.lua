-- Threat: !InfrastructureShared
-- Name: 27d78da7a2fd4
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
