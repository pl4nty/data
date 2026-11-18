-- Threat: !InfrastructureShared
-- Name: 7578c35042df
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
