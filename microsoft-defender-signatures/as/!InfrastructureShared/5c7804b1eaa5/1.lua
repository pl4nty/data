-- Threat: !InfrastructureShared
-- Name: 5c7804b1eaa5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
