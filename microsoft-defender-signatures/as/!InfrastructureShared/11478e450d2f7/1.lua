-- Threat: !InfrastructureShared
-- Name: 11478e450d2f7
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 4200000 then
  return mp.INFECTED
end
return mp.CLEAN
