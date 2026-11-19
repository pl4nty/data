-- Threat: !InfrastructureShared
-- Name: 69786f536745
-- Type: 21

if peattributes.isexe and mp.getfilesize() > 3000000 and mp.getfilesize() < 4500000 then
  return mp.INFECTED
end
return mp.CLEAN
