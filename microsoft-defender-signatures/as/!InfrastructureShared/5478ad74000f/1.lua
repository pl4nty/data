-- Threat: !InfrastructureShared
-- Name: 5478ad74000f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
