-- Threat: !InfrastructureShared
-- Name: 6c78018d710c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
