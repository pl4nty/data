-- Threat: !InfrastructureShared
-- Name: fe611c3e7147
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
