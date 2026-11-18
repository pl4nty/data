-- Threat: !InfrastructureShared
-- Name: 6b78e3cdc237
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and mp.getfilesize() > 850000 then
  return mp.INFECTED
end
return mp.CLEAN
