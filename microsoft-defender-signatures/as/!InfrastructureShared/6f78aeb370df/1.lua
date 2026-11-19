-- Threat: !InfrastructureShared
-- Name: 6f78aeb370df
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
