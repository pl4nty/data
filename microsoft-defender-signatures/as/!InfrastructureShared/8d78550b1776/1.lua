-- Threat: !InfrastructureShared
-- Name: 8d78550b1776
-- Type: 21

if peattributes.isdll == true and epcode[1] == 72 and epcode[2] == 137 then
  return mp.INFECTED
end
return mp.CLEAN
