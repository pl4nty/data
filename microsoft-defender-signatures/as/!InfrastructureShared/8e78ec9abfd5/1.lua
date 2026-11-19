-- Threat: !InfrastructureShared
-- Name: 8e78ec9abfd5
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
