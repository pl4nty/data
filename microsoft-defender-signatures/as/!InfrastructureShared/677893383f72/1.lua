-- Threat: !InfrastructureShared
-- Name: 677893383f72
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
