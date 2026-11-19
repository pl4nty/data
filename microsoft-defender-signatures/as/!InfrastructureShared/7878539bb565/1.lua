-- Threat: !InfrastructureShared
-- Name: 7878539bb565
-- Type: 21

if pesecs[4].Name == ".gentee" and peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
