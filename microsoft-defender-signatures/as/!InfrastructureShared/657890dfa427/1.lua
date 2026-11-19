-- Threat: !InfrastructureShared
-- Name: 657890dfa427
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() <= 714320 and mp.getfilesize() >= 645960 then
  return mp.INFECTED
end
return mp.CLEAN
