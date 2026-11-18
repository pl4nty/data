-- Threat: !InfrastructureShared
-- Name: 51783fa0b8ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
