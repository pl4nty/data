-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanScriptTermFixSAB\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
;
(mp.readprotection)(false)
local l_0_1 = tostring((mp.readfile)(0, l_0_0))
;
(mp.readprotection)(true)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "iex%(irm%s+[\'\"]?[^\'\"%)%s]+[\'\"]?%s+%-usebasicparsing%)[\'\"]?%s*;?%s*e?x?i?t?%s*$"
if (string.find)((string.lower)(l_0_1), l_0_2) then
  return mp.INFECTED
end
return mp.CLEAN

