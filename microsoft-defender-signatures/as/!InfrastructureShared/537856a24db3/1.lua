-- Threat: !InfrastructureShared
-- Name: 537856a24db3
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
