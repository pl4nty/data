-- Threat: !InfrastructureShared
-- Name: 7578ae83dc6e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
