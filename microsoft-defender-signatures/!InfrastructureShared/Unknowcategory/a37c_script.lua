-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a37c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:find("program files", 1, true) then
  return mp.CLEAN
end
if l_0_0:find("system32", 1, true) then
  return mp.CLEAN
end
local l_0_1 = (MpCommon.PathToWin32Path)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.find)(l_0_1, "->")
if l_0_2 then
  l_0_1 = (string.sub)(l_0_1, 1, l_0_2 - 1)
end
return mp.INFECTED

