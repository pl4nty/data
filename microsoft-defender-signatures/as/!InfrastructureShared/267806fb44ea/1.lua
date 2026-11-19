-- Threat: !InfrastructureShared
-- Name: 267806fb44ea
-- Type: 21

if peattributes.isexe and peattributes.x86_image then
  return mp.INFECTED
end
return mp.CLEAN
