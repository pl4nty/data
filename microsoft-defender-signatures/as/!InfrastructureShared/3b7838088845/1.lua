-- Threat: !InfrastructureShared
-- Name: 3b7838088845
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
