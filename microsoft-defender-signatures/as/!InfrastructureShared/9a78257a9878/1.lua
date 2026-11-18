-- Threat: !InfrastructureShared
-- Name: 9a78257a9878
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
