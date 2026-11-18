-- Threat: !InfrastructureShared
-- Name: b978311b38ba
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
