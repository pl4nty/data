-- Threat: !InfrastructureShared
-- Name: d178e4e463dc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
