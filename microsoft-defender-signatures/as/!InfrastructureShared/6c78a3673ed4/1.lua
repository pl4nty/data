-- Threat: !InfrastructureShared
-- Name: 6c78a3673ed4
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
