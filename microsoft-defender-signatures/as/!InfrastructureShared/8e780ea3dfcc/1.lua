-- Threat: !InfrastructureShared
-- Name: 8e780ea3dfcc
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
