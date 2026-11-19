-- Threat: !InfrastructureShared
-- Name: b9785e392fda
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
