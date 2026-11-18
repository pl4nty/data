-- Threat: !InfrastructureShared
-- Name: bb78d7e34591
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
