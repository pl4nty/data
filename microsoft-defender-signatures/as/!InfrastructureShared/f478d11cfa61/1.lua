-- Threat: !InfrastructureShared
-- Name: f478d11cfa61
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
