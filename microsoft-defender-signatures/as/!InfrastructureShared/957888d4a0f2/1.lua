-- Threat: !InfrastructureShared
-- Name: 957888d4a0f2
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true and mp.getfilesize() < 62000 then
  return mp.INFECTED
end
return mp.CLEAN
