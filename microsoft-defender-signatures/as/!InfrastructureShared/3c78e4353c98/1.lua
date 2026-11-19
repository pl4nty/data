-- Threat: !InfrastructureShared
-- Name: 3c78e4353c98
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
