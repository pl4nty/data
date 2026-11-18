-- Threat: !InfrastructureShared
-- Name: 7778e4c7dcf4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
