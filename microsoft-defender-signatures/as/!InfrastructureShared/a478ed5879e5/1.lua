-- Threat: !InfrastructureShared
-- Name: a478ed5879e5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
