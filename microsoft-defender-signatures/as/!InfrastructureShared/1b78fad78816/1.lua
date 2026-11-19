-- Threat: !InfrastructureShared
-- Name: 1b78fad78816
-- Type: 21

if mp.get_mpattribute("SIGATTR:GoogleSoftwareRemovalTool") == true then
  return mp.CLEAN
end
mp.set_mpattribute("PUA:Block:BrowseFox")
return mp.INFECTED
