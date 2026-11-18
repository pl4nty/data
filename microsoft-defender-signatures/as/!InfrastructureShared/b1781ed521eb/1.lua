-- Threat: !InfrastructureShared
-- Name: b1781ed521eb
-- Type: 21

if peattributes.isvbpcode == true then
  return mp.INFECTED
end
return mp.CLEAN
