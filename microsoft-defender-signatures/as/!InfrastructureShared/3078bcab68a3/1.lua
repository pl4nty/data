-- Threat: !InfrastructureShared
-- Name: 3078bcab68a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
