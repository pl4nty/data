-- Threat: !InfrastructureShared
-- Name: 9b78c805534d
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
