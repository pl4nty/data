-- Threat: !InfrastructureShared
-- Name: e77839c78318
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
