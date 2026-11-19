-- Threat: !InfrastructureShared
-- Name: 88780c34d989
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
