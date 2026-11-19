-- Threat: !InfrastructureShared
-- Name: 16278aa614bb2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
