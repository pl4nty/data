-- Threat: !InfrastructureShared
-- Name: 97784ac0ca70
-- Type: 21

if peattributes.x86_image == true and peattributes.hasexports == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
