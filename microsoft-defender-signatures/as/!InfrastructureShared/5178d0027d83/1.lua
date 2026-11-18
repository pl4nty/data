-- Threat: !InfrastructureShared
-- Name: 5178d0027d83
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
