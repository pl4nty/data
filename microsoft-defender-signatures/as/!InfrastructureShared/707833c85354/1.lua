-- Threat: !InfrastructureShared
-- Name: 707833c85354
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
