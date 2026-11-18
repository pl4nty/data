-- Threat: !InfrastructureShared
-- Name: 4a785a6c1d40
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
