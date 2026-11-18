-- Threat: !InfrastructureShared
-- Name: 1a787330e9b1
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
