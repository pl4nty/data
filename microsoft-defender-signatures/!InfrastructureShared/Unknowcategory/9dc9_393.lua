-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\9dc9_393.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if (string.find)(l_0_0, "->(Ole Stream", -18, true) == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.BMSearchFile)(7, 5, "ÎG\n\001\005\144\000")
if l_0_1 ~= 0 then
  return mp.CLEAN
end
;
(mp.UfsSetMetadataBool)("OleShellCode", true)
return mp.INFECTED

