-- Threat: !InfrastructureShared
-- Name: !#MpUnicodeToAnsiConvertedVfo
-- Type: 12
-- MpAttributes: Lua:AbsentExtension & !Lua:FileInZip

local l_0_0 = mp.get_parent_filehandle()
if mp.is_handle_nil(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if string.sub(l_0_1, -12) == "->(utf-16le)" then
  return mp.INFECTED
end
return mp.CLEAN
