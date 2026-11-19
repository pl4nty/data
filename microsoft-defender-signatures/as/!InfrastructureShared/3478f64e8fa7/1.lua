-- Threat: !InfrastructureShared
-- Name: 3478f64e8fa7
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
