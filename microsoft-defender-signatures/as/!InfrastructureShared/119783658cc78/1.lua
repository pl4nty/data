-- Threat: !InfrastructureShared
-- Name: 119783658cc78
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
