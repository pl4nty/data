-- Threat: !InfrastructureShared
-- Name: 12778be0db950
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
