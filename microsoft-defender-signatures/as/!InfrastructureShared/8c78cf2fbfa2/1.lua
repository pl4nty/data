-- Threat: !InfrastructureShared
-- Name: 8c78cf2fbfa2
-- Type: 21

if peattributes.x86_image == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
