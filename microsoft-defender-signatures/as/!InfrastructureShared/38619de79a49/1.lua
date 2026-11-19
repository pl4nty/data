-- Threat: !InfrastructureShared
-- Name: 38619de79a49
-- Type: 21

if peattributes.isdll == true and peattributes.no_resources == true then
  return mp.INFECTED
end
return mp.CLEAN
