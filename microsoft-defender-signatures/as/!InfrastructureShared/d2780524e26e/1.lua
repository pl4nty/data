-- Threat: !InfrastructureShared
-- Name: d2780524e26e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
