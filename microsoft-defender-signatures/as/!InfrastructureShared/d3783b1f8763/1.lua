-- Threat: !InfrastructureShared
-- Name: d3783b1f8763
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
