-- Threat: !InfrastructureShared
-- Name: 2478640f8b7b
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
