-- Threat: !InfrastructureShared
-- Name: 75404e43bcd5
-- Type: 21

if peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
