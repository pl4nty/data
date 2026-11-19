-- Threat: !InfrastructureShared
-- Name: e278d08c7906
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
