-- Threat: !InfrastructureShared
-- Name: 15d78f0e9b15d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
