-- Threat: !InfrastructureShared
-- Name: 78787b5a4d19
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
