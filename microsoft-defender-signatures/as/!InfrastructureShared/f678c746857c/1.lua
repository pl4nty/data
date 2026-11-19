-- Threat: !InfrastructureShared
-- Name: f678c746857c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
