-- Threat: !InfrastructureShared
-- Name: 130780ea35fa5
-- Type: 21

if peattributes.ismsil == true and mp.getfilesize() < 500000 then
  return mp.INFECTED
end
return mp.CLEAN
