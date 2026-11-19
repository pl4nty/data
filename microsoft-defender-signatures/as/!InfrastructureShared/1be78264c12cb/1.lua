-- Threat: !InfrastructureShared
-- Name: 1be78264c12cb
-- Type: 21

if peattributes.ismsil == true and peattributes.isdll == true and peattributes.hasexports == false and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
