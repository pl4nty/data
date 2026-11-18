-- Threat: !InfrastructureShared
-- Name: 4f7836bf8683
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
