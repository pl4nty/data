-- Threat: !InfrastructureShared
-- Name: 4d780ed32abf
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
