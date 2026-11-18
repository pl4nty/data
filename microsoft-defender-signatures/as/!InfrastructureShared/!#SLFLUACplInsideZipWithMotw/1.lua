-- Threat: !InfrastructureShared
-- Name: !#SLF:LUA:CplInsideZipWithMotw
-- Type: 13
-- MpAttributes: BM_MZ_DLL & Lua:CPLExt

local l_0_0, l_0_1 = mp.UfsGetMetadataBool("Lua:FileInZip", true)
if l_0_0 ~= 0 or not l_0_1 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.UfsGetMetadataBool("Lua:ZipWithMotw", true)
if l_0_2 ~= 0 or not l_0_3 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = mp.UfsGetMetadataBool("Lua:SingleFileInZip", true)
if l_0_4 == 0 and l_0_5 then
  return mp.CLEAN
end
return mp.INFECTED
