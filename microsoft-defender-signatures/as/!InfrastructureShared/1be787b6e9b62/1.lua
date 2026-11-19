-- Threat: !InfrastructureShared
-- Name: 1be787b6e9b62
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
