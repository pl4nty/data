-- Threat: !InfrastructureShared
-- Name: 2186100fb870e
-- Type: 21

if peattributes.isvbpcode == true then
  return mp.INFECTED
end
return mp.CLEAN
