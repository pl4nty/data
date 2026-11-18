-- Threat: !InfrastructureShared
-- Name: 3c78952cc5a8
-- Type: 21

if pe.get_versioninfo().CompanyName == "Microsoft Corporation" then
  return mp.INFECTED
end
return mp.CLEAN
