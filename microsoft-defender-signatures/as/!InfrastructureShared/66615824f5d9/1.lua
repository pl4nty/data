-- Threat: !InfrastructureShared
-- Name: 66615824f5d9
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
