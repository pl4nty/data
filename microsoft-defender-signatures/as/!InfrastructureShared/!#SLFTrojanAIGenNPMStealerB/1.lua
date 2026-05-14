-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanAIGenNPMStealerB\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Stealer_") >= 6 or #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_RegEx_") >= 6 then
  return mp.INFECTED
end
return mp.CLEAN

