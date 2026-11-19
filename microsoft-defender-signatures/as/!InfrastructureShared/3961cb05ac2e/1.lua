-- Threat: !InfrastructureShared
-- Name: 3961cb05ac2e
-- Type: 21

if (peattributes.isexe == true or peattributes.isdll == true) and mp.getfilesize() > 307200 then
  return mp.INFECTED
end
return mp.CLEAN
