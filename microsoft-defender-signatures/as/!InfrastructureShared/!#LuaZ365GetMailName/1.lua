-- Threat: !InfrastructureShared
-- Name: !#Lua:Z365GetMailName
-- Type: 11
-- MpAttributes: Lua:EXEExt & HSTR:GolangBinary & LUA:FileSizeLE10M.B

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if 10240000 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 ~= nil and string.find(l_0_2, "\\z365getmail", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN
