-- Threat: !InfrastructureShared
-- Name: 114782afc5205
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
