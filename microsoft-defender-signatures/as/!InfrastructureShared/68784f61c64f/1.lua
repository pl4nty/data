-- Threat: !InfrastructureShared
-- Name: 68784f61c64f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
