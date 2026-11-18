-- Threat: !InfrastructureShared
-- Name: 8c784120b25e
-- Type: 21

if pe.get_versioninfo().CompanyName == "Microsoft Corporation" then
  return mp.CLEAN
end
return mp.INFECTED
