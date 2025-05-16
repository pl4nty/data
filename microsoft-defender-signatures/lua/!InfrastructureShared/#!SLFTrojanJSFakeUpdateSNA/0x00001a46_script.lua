-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\#!SLFTrojanJSFakeUpdateSNA\0x00001a46_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0 then
  return mp.CLEAN
end
if not StringEndsWith(l_0_0, ".js.zip") and not StringEndsWith(l_0_0, ".js") then
  return mp.CLEAN
end
local l_0_1 = (mp.IOAVGetDownloadUrl)()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if l_0_1 == "about:internet" then
  return mp.CLEAN
end
if not StringEndsWith(l_0_1, "/") then
  return mp.CLEAN
end
if not StringStartsWith(l_0_1, "https") then
  return mp.CLEAN
end
local l_0_2 = ExtractPartsFromUri(l_0_1)
if next(l_0_2) == nil then
  return mp.CLEAN
end
if l_0_2.host == nil or l_0_2.host == "" or l_0_2.path ~= nil or StringStartsWith(l_0_2.host, "www") or l_0_2.scheme ~= "https" then
  return mp.CLEAN
end
if #split(l_0_2.host, ".") == 3 then
  return mp.INFECTED
end
return mp.CLEAN

