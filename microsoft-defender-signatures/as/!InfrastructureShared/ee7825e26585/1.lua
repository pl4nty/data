-- Threat: !InfrastructureShared
-- Name: ee7825e26585
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
