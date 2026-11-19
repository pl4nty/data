-- Threat: !InfrastructureShared
-- Name: 15478436e7d4b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
