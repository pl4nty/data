-- Threat: !InfrastructureShared
-- Name: !#ALF:HackTool:Python/CosmicEnergy.A!dha
-- Type: 13
-- MpAttributes: Lua:PYExt | Lua:PYCExt

if #mp.enum_mpattributesubstring("SCPT:CosmicEnergyAPy") >= 3 or #mp.enum_mpattributesubstring("SCPT:CosmicEnergyBPy") >= 1 then
  return mp.INFECTED
end
return mp.CLEAN
