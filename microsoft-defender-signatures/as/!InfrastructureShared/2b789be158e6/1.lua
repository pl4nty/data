-- Threat: !InfrastructureShared
-- Name: 2b789be158e6
-- Type: 21

if mp.get_mpattribute("SIGATTR:GoogleSoftwareRemovalTool") == true then
  return mp.CLEAN
end
mp.set_mpattribute("PUA:Block:CrossRider")
return mp.INFECTED
