-- Threat: !InfrastructureShared
-- Name: 5d78f6df1b25
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
