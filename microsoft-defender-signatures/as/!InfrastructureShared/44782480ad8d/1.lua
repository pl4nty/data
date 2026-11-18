-- Threat: !InfrastructureShared
-- Name: 44782480ad8d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
