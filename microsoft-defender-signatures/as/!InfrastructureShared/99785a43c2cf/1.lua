-- Threat: !InfrastructureShared
-- Name: 99785a43c2cf
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
