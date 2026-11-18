-- Threat: !InfrastructureShared
-- Name: 617803add8d4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
