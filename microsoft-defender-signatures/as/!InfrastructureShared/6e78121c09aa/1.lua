-- Threat: !InfrastructureShared
-- Name: 6e78121c09aa
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
