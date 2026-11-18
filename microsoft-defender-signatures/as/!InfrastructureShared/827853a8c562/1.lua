-- Threat: !InfrastructureShared
-- Name: 827853a8c562
-- Type: 21

if peattributes.isexe == true and peattributes.amd64_image then
  return mp.INFECTED
end
return mp.CLEAN
