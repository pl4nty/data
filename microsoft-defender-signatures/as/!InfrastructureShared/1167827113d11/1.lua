-- Threat: !InfrastructureShared
-- Name: 1167827113d11
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
