-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSQakbotSC\0x00000848_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (MpCommon.StringRegExpSearch)("^https?:\\/\\/\\w+.\\w+\\/\\w+\\/\\?\\d+$", (string.lower)(l_0_0)) == true then
  return mp.INFECTED
end
return mp.CLEAN

