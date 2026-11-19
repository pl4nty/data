-- Threat: !InfrastructureShared
-- Name: 1607816aa2e67
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
