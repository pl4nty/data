-- Threat: !InfrastructureShared
-- Name: 73783e68b109
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
