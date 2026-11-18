-- Threat: !InfrastructureShared
-- Name: 4a78fe4bc7b1
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
