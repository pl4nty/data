-- Threat: !InfrastructureShared
-- Name: 150789f45886c
-- Type: 21

if peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
