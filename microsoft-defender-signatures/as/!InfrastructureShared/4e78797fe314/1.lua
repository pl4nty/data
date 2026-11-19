-- Threat: !InfrastructureShared
-- Name: 4e78797fe314
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
