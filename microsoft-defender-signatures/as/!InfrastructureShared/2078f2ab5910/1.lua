-- Threat: !InfrastructureShared
-- Name: 2078f2ab5910
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
