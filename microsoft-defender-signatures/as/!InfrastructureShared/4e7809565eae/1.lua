-- Threat: !InfrastructureShared
-- Name: 4e7809565eae
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
