-- Threat: !InfrastructureShared
-- Name: 237895e3ed8c
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
