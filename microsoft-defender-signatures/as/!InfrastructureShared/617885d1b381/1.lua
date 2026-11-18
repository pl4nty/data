-- Threat: !InfrastructureShared
-- Name: 617885d1b381
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
