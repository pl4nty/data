-- Threat: !InfrastructureShared
-- Name: 77784db58913
-- Type: 21

if peattributes.isdll == true and pesecs[1].Name == ".data" then
  return mp.INFECTED
end
return mp.CLEAN
