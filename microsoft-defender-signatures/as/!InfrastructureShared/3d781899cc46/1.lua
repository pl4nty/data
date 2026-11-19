-- Threat: !InfrastructureShared
-- Name: 3d781899cc46
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
