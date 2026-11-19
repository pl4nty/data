-- Threat: !InfrastructureShared
-- Name: 6b78fc35b05e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
