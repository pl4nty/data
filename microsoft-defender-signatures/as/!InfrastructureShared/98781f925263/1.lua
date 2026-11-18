-- Threat: !InfrastructureShared
-- Name: 98781f925263
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
