-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASusPDFName\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
local l_0_1 = (mp.getfilesize)()
if l_0_1 < 65536 and l_0_1 > 327680 then
  return mp.CLEAN
end
if l_0_0 == nil or (string.len)(l_0_0) <= 5 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "lnvoice%-%d%d%d%d%d+%.pdf$") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

