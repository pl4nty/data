-- Threat: !InfrastructureShared
-- Name: !#Lua:HTML/GTE85PercJS
-- Type: 13
-- MpAttributes: Nscript:Type_js & (SCPT:VBSUnescape | Nscript:js_hasBigString)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if string.find(l_0_0, "%-%>%(script000%d%)", -15) == nil then
  return mp.CLEAN
end
local l_0_1 = mp.get_parent_filehandle()
if l_0_1 ~= nil then
  local l_0_2 = mp.getfilesize()
  local l_0_3 = mp.get_filesize_by_handle(l_0_1)
  if l_0_2 > l_0_3 * 85 / 100 then
    return mp.INFECTED
  end
end
return mp.CLEAN
