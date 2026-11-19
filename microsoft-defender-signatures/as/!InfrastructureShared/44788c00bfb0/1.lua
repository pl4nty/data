-- Threat: !InfrastructureShared
-- Name: 44788c00bfb0
-- Type: 21

if peattributes.hasexports == true and peattributes.no_security == true and peattributes.no_relocs == true then
  return mp.INFECTED
end
return mp.CLEAN
