-- Threat: !InfrastructureShared
-- Name: 122783dfa28f7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
