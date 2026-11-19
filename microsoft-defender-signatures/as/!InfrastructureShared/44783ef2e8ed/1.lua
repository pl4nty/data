-- Threat: !InfrastructureShared
-- Name: 44783ef2e8ed
-- Type: 21

if peattributes.isexe == true and peattributes.x86_image == true then
  return mp.INFECTED
end
return mp.CLEAN
