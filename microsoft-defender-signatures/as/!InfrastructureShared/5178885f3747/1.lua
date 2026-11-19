-- Threat: !InfrastructureShared
-- Name: 5178885f3747
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true and mp.getfilesize() <= 35463936 and mp.getfilesize() >= 25463936 then
  return mp.INFECTED
end
return mp.CLEAN
