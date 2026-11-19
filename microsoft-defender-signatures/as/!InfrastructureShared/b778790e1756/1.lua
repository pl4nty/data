-- Threat: !InfrastructureShared
-- Name: b778790e1756
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
