-- Threat: !InfrastructureShared
-- Name: a17800da6e3e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
