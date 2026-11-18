-- Threat: !InfrastructureShared
-- Name: 3d78d591faa0
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
