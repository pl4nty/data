-- Threat: !InfrastructureShared
-- Name: 497823429cbf
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
