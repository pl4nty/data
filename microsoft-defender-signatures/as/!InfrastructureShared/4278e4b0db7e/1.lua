-- Threat: !InfrastructureShared
-- Name: 4278e4b0db7e
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
