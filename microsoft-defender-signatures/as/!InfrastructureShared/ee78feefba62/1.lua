-- Threat: !InfrastructureShared
-- Name: ee78feefba62
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
