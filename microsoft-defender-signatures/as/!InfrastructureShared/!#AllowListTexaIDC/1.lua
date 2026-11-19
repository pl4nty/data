-- Threat: !InfrastructureShared
-- Name: !#AllowList:TexaIDC
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & LUA:FileSizeGT256M.A & AGGR:ArchiveFile

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1:sub(-4)
if string.find(l_0_0, "\\texa\\idc5\\car\\data\\swupdate\\temp\\updates\\download\\", 1, true) ~= nil then
  return mp.CLEAN
end
if l_0_2 == ".tpk" then
  return mp.INFECTED
end
if l_0_2 == ".rar" then
  return mp.INFECTED
end
return mp.CLEAN
