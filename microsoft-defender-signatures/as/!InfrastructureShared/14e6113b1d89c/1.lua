-- Threat: !InfrastructureShared
-- Name: 14e6113b1d89c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
