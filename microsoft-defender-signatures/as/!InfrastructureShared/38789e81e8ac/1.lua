-- Threat: !InfrastructureShared
-- Name: 38789e81e8ac
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
