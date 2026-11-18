-- Threat: !InfrastructureShared
-- Name: 4b54058c1c568
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.no_security == true and mp.getfilesize() <= 7200 then
  return mp.INFECTED
end
return mp.CLEAN
