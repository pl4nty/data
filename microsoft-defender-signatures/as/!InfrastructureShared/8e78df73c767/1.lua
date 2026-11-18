-- Threat: !InfrastructureShared
-- Name: 8e78df73c767
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
