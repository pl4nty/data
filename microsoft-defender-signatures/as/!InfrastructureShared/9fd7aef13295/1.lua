-- Threat: !InfrastructureShared
-- Name: 9fd7aef13295
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
