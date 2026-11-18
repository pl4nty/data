-- Threat: !InfrastructureShared
-- Name: 4578aa56a68c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
