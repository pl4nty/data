-- Threat: !InfrastructureShared
-- Name: a77872f9f4ba
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
