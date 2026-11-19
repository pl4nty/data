-- Threat: !InfrastructureShared
-- Name: 627805777ca5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
