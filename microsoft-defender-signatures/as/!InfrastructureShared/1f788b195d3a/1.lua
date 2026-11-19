-- Threat: !InfrastructureShared
-- Name: 1f788b195d3a
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
