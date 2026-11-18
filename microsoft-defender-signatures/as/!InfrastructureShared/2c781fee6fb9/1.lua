-- Threat: !InfrastructureShared
-- Name: 2c781fee6fb9
-- Type: 21

if peattributes.isexe == true and mp.getfilesize() < 25000 then
  return mp.INFECTED
end
return mp.CLEAN
