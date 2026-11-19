-- Threat: !InfrastructureShared
-- Name: 3478c6bf8998
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
