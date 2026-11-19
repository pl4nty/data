-- Threat: !InfrastructureShared
-- Name: 357834634934
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
