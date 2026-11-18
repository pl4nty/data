-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Python/MozzarellaSticks.A!dha
-- Type: 13

if #mp.enum_mpattributesubstring("SCPT:MozzarellaSticks.A") >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
