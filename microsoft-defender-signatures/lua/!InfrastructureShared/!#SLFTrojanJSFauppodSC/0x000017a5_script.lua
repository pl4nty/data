-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanJSFauppodSC\0x000017a5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)())
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0:find(".zip->version.", 1, true) and StringEndsWith(l_0_0, ".js") then
  set_research_data("IOAVUrl", (MpCommon.Base64Encode)((mp.IOAVGetDownloadUrl)()), false)
  return mp.INFECTED
end
return mp.CLEAN

