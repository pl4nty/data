-- Threat: !InfrastructureShared
-- Name: 84789b7d6eeb
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
