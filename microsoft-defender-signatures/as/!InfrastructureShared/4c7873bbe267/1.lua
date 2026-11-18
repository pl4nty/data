-- Threat: !InfrastructureShared
-- Name: 4c7873bbe267
-- Type: 21

if peattributes.amd64_image and peattributes.isexe and peattributes.no_exports then
  return mp.INFECTED
end
return mp.CLEAN
