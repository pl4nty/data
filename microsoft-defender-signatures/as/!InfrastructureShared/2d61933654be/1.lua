-- Threat: !InfrastructureShared
-- Name: 2d61933654be
-- Type: 21

if mp.get_mpattribute("SIGATTR:GoogleSoftwareRemovalTool") == true then
  return mp.CLEAN
end
return mp.INFECTED
