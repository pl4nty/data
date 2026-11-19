-- Threat: !InfrastructureShared
-- Name: e061d68f2682
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
