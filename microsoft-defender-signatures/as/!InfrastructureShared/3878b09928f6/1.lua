-- Threat: !InfrastructureShared
-- Name: 3878b09928f6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
