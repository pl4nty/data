-- Threat: !InfrastructureShared
-- Name: 32787a995c93
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
