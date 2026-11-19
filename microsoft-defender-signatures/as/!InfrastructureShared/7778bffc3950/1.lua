-- Threat: !InfrastructureShared
-- Name: 7778bffc3950
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
