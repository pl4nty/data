-- Threat: !InfrastructureShared
-- Name: !#Lua:BlockPdfDroppedBySuspProc
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if string.find(l_0_1, "\\device\\", 1, true) then
  l_0_1 = MpCommon.PathToWin32Path(l_0_1)
end
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = "Lua:PdfDroppedBySuspProc"
local l_0_3 = MpCommon.QueryPersistContext(l_0_1, l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = "global_marker"
local l_0_5 = "big_lnk_file_with_ps"
l_0_3 = MpCommon.QueryPersistContextNoPath(l_0_4, l_0_5)
if not l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
