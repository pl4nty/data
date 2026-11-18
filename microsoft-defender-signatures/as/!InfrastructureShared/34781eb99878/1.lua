-- Threat: !InfrastructureShared
-- Name: 34781eb99878
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
