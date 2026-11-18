-- Threat: !InfrastructureShared
-- Name: 5f7834559896
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
