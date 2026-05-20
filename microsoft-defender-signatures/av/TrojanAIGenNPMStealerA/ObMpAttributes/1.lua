-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanAIGenNPMStealerA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Stealer_") >= 4 and #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_RegEx_") >= 4 then
  return mp.INFECTED
end
return mp.CLEAN

