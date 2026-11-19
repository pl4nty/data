-- Threat: !InfrastructureShared
-- Name: 6761e4a49e97
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
