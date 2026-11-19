-- Threat: !InfrastructureShared
-- Name: 23178ecb37994
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
