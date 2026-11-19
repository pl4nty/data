-- Threat: !InfrastructureShared
-- Name: e9787b36d3f8
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
