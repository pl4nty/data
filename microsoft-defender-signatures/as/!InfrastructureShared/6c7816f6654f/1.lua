-- Threat: !InfrastructureShared
-- Name: 6c7816f6654f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
