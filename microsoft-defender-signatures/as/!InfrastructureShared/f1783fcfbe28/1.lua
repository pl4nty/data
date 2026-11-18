-- Threat: !InfrastructureShared
-- Name: f1783fcfbe28
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
