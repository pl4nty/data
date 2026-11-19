-- Threat: !InfrastructureShared
-- Name: 56781d5f4df8
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true and pe.get_exports() > 10 and mp.getfilesize() > 2097152 then
  return mp.INFECTED
end
return mp.CLEAN
