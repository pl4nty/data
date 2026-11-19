-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:JavaScript/BreadSticks.A!dha
-- Type: 13

if #mp.enum_mpattributesubstring("SCPT:BreadSticks.A") >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
