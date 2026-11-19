-- Threat: !InfrastructureShared
-- Name: 7c781e483a25
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() > 1000000 and mp.getfilesize() < 2500000 then
  return mp.INFECTED
end
return mp.CLEAN
