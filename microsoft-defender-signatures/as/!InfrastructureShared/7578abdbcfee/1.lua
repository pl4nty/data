-- Threat: !InfrastructureShared
-- Name: 7578abdbcfee
-- Type: 21

if mp.getfilesize() > 2097152 and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
