-- Threat: !InfrastructureShared
-- Name: 86787d573ea7
-- Type: 21

if peattributes.isexe and peattributes.x86_image and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN
