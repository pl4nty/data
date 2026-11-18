-- Threat: !InfrastructureShared
-- Name: 2b7831a7d40b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
