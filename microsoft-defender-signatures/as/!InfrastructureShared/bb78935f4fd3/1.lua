-- Threat: !InfrastructureShared
-- Name: bb78935f4fd3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
