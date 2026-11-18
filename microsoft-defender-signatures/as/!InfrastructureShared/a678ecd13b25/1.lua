-- Threat: !InfrastructureShared
-- Name: a678ecd13b25
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
