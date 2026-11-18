-- Threat: !InfrastructureShared
-- Name: 597829b38c30
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
