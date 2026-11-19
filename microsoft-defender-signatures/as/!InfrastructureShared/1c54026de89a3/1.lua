-- Threat: !InfrastructureShared
-- Name: 1c54026de89a3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
