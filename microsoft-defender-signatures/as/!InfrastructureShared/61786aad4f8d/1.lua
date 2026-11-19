-- Threat: !InfrastructureShared
-- Name: 61786aad4f8d
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and mp.getfilesize() < 2097152 and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
