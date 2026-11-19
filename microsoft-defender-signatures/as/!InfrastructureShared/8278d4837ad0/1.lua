-- Threat: !InfrastructureShared
-- Name: 8278d4837ad0
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
