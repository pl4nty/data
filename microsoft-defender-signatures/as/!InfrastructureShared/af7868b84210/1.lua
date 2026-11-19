-- Threat: !InfrastructureShared
-- Name: af7868b84210
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
