-- Threat: !InfrastructureShared
-- Name: c87862e7e7aa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
