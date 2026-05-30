-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__GhStealerZ!MTB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if #(mp.enum_mpattributesubstring)("NPMCreds_Cred_") >= 2 and #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Token_") >= 2 and #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Env_Printenv") >= 2 and #(mp.enum_mpattributesubstring)("SCPT:NPMCreds_Meta_") >= 1 then
  return mp.INFECTED
end
return mp.CLEAN

