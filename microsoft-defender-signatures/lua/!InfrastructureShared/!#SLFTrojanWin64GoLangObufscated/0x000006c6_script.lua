-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin64GoLangObufscated\0x000006c6_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattributevalue)("RPF:GoLang:pclntab_magic_unknown")
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1:find("frpc.exe", 1, true) then
  return mp.CLEAN
end
if l_0_0 and (mp.bitand)(l_0_0, 4294967280) ~= 4294967280 then
  return mp.INFECTED
end
return mp.CLEAN

