-- Threat: !InfrastructureShared
-- Name: 287818d1b52d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
