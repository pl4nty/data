-- Threat: !InfrastructureShared
-- Name: 5c78c2e0e638
-- Type: 21

if peattributes.x86_image == true and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
