-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__TestModifiedExecuteBitScanReason\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) == 18 and (mp.getfilename)(mp.FILEPATH_QUERY_FULL) == "/tmp/e6c1b6df-5c4a-44ef-8453-2aed16108a33.txt" then
  return mp.INFECTED
end
return mp.CLEAN

