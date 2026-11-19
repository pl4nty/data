-- Threat: !InfrastructureShared
-- Name: 6178706f4c1f
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
