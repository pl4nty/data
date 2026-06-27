-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanAIGenNPMStealerB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if (#(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Stealer_") or 0 >= 6 or #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_RegEx_") or 0 >= 6) and (#(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Env_Printenv") or 0 >= 2 or #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Meta_") or 0 >= 1) then
  return mp.INFECTED
end
return mp.CLEAN

