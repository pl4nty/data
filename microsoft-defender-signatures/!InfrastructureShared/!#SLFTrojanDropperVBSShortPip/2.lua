-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanDropperVBSShortPip\2.luac 

-- params : ...
-- function num : 0
local l_0_0 = (string.lower)((mp.getfilename)(mp.FILEPATH_QUERY_FNAME))
if l_0_0 == nil then
  return mp.CLEAN
end
if (string.sub)(l_0_0, -6) ~= ".3gpp2" then
  return mp.CLEAN
end
local l_0_1 = (mp.readheader)(0, 48)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.gsub)(l_0_1, "%z", "")
if l_0_2 == nil then
  return mp.CLEAN
end
if (string.find)(l_0_2, "on error resume next", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

