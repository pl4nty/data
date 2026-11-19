-- Threat: !InfrastructureShared
-- Name: dc7828ac90cf
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
