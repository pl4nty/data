-- Threat: !InfrastructureShared
-- Name: 1a878f404a00f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 13000 then
  return mp.INFECTED
end
return mp.CLEAN
