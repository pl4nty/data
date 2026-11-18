-- Threat: !InfrastructureShared
-- Name: 20d789540f677
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
