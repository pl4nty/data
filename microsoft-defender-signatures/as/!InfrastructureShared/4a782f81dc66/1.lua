-- Threat: !InfrastructureShared
-- Name: 4a782f81dc66
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
