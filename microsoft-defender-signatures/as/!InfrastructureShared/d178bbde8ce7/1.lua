-- Threat: !InfrastructureShared
-- Name: d178bbde8ce7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
