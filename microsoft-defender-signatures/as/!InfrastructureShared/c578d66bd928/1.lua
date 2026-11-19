-- Threat: !InfrastructureShared
-- Name: c578d66bd928
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
