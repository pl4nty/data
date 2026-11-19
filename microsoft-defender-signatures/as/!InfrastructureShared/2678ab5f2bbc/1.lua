-- Threat: !InfrastructureShared
-- Name: 2678ab5f2bbc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
