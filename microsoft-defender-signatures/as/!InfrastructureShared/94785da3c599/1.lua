-- Threat: !InfrastructureShared
-- Name: 94785da3c599
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
