-- Threat: !InfrastructureShared
-- Name: 18478e4295aba
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 3140000 then
  return mp.INFECTED
end
return mp.CLEAN
