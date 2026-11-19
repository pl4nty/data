-- Threat: !InfrastructureShared
-- Name: d3783ad5a4f1
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
