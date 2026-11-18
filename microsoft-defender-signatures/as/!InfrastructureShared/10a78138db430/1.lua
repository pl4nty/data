-- Threat: !InfrastructureShared
-- Name: 10a78138db430
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
