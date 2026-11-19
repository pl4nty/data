-- Threat: !InfrastructureShared
-- Name: 4f78ae851b5e
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
