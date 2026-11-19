-- Threat: !InfrastructureShared
-- Name: 537856b36a08
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
