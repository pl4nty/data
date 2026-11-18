-- Threat: !InfrastructureShared
-- Name: c278be270ce0
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
