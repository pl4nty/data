-- Threat: !InfrastructureShared
-- Name: 3278f119784b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
