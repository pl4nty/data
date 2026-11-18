-- Threat: !InfrastructureShared
-- Name: 5778a449d9e7
-- Type: 21

if peattributes.isdll and peattributes.ismsil then
  return mp.INFECTED
end
return mp.CLEAN
