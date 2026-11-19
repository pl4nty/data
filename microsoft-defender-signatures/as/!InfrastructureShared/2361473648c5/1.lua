-- Threat: !InfrastructureShared
-- Name: 2361473648c5
-- Type: 21

if peattributes.isexe == true and peattributes.no_relocs == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
