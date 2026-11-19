-- Threat: !InfrastructureShared
-- Name: !#SLF:HackTool:Linux/Coinminer.D13
-- Type: 24
-- MpAttributes: RPF:TopLevelFile & BM_TEXT_FILE

local l_0_0 = mp.enum_mpattributesubstring("SCPT:Miner_")
if l_0_0 ~= nil and 4 < #l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
