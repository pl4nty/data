-- Threat: !InfrastructureShared
-- Name: 16dd78a54d105
-- Type: 21

if mp.get_mpattribute("RPF:CmdLineMLv2:100") or mp.get_mpattribute("RPF:CmdLineMLv2:130") or mp.get_mpattribute("RPF:CmdLineMLv2:150") then
  return mp.INFECTED
end
return mp.CLEAN
