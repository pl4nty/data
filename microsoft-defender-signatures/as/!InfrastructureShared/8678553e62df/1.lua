-- Threat: !InfrastructureShared
-- Name: 8678553e62df
-- Type: 21

if peattributes.no_security and peattributes.ismsil and pe.get_versioninfo().CompanyName == "" then
  return mp.INFECTED
end
return mp.CLEAN
