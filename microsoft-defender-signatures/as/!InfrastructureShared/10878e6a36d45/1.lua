-- Threat: !InfrastructureShared
-- Name: 10878e6a36d45
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
