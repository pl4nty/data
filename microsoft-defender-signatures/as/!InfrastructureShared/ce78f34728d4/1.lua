-- Threat: !InfrastructureShared
-- Name: ce78f34728d4
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
