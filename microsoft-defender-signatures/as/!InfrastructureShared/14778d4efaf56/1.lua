-- Threat: !InfrastructureShared
-- Name: 14778d4efaf56
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
