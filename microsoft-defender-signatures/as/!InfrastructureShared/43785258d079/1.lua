-- Threat: !InfrastructureShared
-- Name: 43785258d079
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
