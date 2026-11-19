-- Threat: !InfrastructureShared
-- Name: 5d78f8c6c23c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
