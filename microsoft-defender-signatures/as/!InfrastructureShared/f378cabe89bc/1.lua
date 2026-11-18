-- Threat: !InfrastructureShared
-- Name: f378cabe89bc
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
