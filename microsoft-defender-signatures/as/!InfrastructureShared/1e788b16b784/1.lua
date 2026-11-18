-- Threat: !InfrastructureShared
-- Name: 1e788b16b784
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
