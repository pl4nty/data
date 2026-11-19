-- Threat: !InfrastructureShared
-- Name: 3540e991f77e
-- Type: 21

if pe.get_versioninfo().CompanyName == "Microsoft" then
  return mp.INFECTED
end
return mp.CLEAN
