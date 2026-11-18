-- Threat: !InfrastructureShared
-- Name: 5d785755ad68
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true and mp.getfilesize() < 184322 then
  return mp.INFECTED
end
return mp.CLEAN
