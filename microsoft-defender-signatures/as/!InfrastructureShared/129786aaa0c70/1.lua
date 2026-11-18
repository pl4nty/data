-- Threat: !InfrastructureShared
-- Name: 129786aaa0c70
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
