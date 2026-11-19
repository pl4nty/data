-- Threat: !InfrastructureShared
-- Name: f2618fc88d1a
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
