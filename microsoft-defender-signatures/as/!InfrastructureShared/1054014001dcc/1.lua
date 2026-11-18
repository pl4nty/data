-- Threat: !InfrastructureShared
-- Name: 1054014001dcc
-- Type: 21

if peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
