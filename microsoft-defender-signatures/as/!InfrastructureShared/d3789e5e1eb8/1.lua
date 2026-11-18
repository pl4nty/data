-- Threat: !InfrastructureShared
-- Name: d3789e5e1eb8
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
