-- Threat: !InfrastructureShared
-- Name: 7a782919e147
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
