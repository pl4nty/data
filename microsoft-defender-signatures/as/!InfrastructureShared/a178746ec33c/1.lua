-- Threat: !InfrastructureShared
-- Name: a178746ec33c
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
