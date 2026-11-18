-- Threat: !InfrastructureShared
-- Name: 8e78fde7980c
-- Type: 21

if peattributes.isdll == true and pesecs[1].Name == ".data" then
  return mp.INFECTED
end
return mp.CLEAN
