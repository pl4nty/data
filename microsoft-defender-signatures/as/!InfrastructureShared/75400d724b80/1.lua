-- Threat: !InfrastructureShared
-- Name: 75400d724b80
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
