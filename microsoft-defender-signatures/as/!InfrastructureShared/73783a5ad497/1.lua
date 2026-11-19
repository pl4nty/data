-- Threat: !InfrastructureShared
-- Name: 73783a5ad497
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
