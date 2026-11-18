-- Threat: !InfrastructureShared
-- Name: 7e7854869e5f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
