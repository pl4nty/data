-- Threat: !InfrastructureShared
-- Name: 1d89c4a0dd38
-- Type: 21

if pe.get_versioninfo().CompanyName == "Microsoft Corporation" then
  return mp.INFECTED
end
return mp.LOWFI
