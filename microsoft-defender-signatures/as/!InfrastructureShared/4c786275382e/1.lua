-- Threat: !InfrastructureShared
-- Name: 4c786275382e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
