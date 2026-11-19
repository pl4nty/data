-- Threat: !InfrastructureShared
-- Name: e541c81dd892
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
