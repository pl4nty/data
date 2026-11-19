-- Threat: !InfrastructureShared
-- Name: 66788fe65488
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
