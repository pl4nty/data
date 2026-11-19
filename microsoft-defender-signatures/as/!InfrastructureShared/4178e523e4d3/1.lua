-- Threat: !InfrastructureShared
-- Name: 4178e523e4d3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
