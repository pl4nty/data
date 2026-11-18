-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Python/BellJar.A!dha
-- Type: 13

if #mp.enum_mpattributesubstring("SCPT:BellJar.A") >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
