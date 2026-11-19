-- Threat: !InfrastructureShared
-- Name: ee7824b7ec62
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
