-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\7a5_372.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.IOAVGetDownloadUrl)()
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.len)(l_0_0) < 12 then
  return mp.CLEAN
end
l_0_0 = (string.lower)(l_0_0)
if (string.find)(l_0_0, "/.+invoice.+/") ~= nil or (string.find)(l_0_0, "/.+rechnung.+/") ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

