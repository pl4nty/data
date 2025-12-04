-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\128b3991f8f73\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((bm.get_imagepath)())
if l_0_0 then
  if (string.find)(l_0_0, "\\crowdcrawlerworker.exe", 1, true) or (string.find)(l_0_0, "\\search_engine_ranker.exe", 1, true) or (string.find)(l_0_0, "\\searchenginedata.exe", 1, true) or (string.find)(l_0_0, "\\net_updater32.exe", 1, true) or (string.find)(l_0_0, "\\sidcraker.exe", 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end
return mp.CLEAN

