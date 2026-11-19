-- Threat: !InfrastructureShared
-- Name: 5d78ed91f1be
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
