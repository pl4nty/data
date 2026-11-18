-- Threat: !InfrastructureShared
-- Name: !#ALFPER:HackTool:PowerShell/EverythingBagel.C!dha
-- Type: 13

if #mp.enum_mpattributesubstring("SCPT:EverythingBagel.C") >= 2 then
  return mp.INFECTED
end
return mp.CLEAN
