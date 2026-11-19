-- Threat: !InfrastructureShared
-- Name: 2d78dd587486
-- Type: 21

if peattributes.isvbnative == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
