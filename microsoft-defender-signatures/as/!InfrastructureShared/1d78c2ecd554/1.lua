-- Threat: !InfrastructureShared
-- Name: 1d78c2ecd554
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
