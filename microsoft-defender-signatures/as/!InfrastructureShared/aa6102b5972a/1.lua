-- Threat: !InfrastructureShared
-- Name: aa6102b5972a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
