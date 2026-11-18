-- Threat: !InfrastructureShared
-- Name: 27785ed77484
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
