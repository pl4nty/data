-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowShellFormatobfusA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0:find("psdeobfus-stg1", 1, true) then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage)
if l_0_1 then
  l_0_1 = (string.gsub)(l_0_1, "`?%s?", "")
  l_0_1 = (string.gsub)(l_0_1, "[%\'\"]%)?%+%(?[%\'\"]", "")
  l_0_1 = (string.gsub)(l_0_1, "%([%\'\"]([%w%.%-]+)[%\'\"]%)", "\'%1\'")
  l_0_1 = (string.gsub)(l_0_1, "%.[%\'\"](%w+)[%\'\"]", "%.%1")
  l_0_1 = (string.gsub)(l_0_1, "::[%\'\"](%w+)[%\'\"]", "::%1")
  l_0_1 = (string.lower)(l_0_1)
  ;
  (mp.vfo_add_buffer)(l_0_1, "[psdeobfus-stg1]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
return mp.CLEAN

