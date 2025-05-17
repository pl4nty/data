-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\631f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)()
if (string.find)(l_0_0, "->%(Ole Stream %d%)$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

