-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:Python/FishSchool.A!dha
-- Type: 13

if #mp.enum_mpattributesubstring("SCPT:FishSchool.A") >= 3 then
  return mp.INFECTED
end
return mp.CLEAN
