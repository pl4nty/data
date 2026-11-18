-- Threat: !InfrastructureShared
-- Name: e5d77b32952d
-- Type: 21

if not mp.get_mpattribute("MpCmdLineFoundB64") then
  return mp.CLEAN
end
return mp.INFECTED
