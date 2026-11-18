-- Threat: !InfrastructureShared
-- Name: !#Lua:docxmlu2a
-- Type: 13
-- MpAttributes: BM_XML_FILE & SCRIPT:JsEscapeChar & SCRT:wordXMLEscChar_External

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_0:find("->word/_rels/", 1, true) and not l_0_0:find("/drawings/_rels/", 1, true) and not l_0_0:find("/worksheets/_rels/", 1, true) then
  return mp.CLEAN
end
if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
local l_0_1 = tostring(headerpage):lower()
l_0_1 = string.gsub(l_0_1, "&#x(%x%x);", function(l_1_0)
  return string.char(tonumber(l_1_0, 16))
end)
l_0_1 = string.gsub(l_0_1, "&#(%d%d?%d?);", function(l_2_0)
  return string.char(tonumber(l_2_0, 10))
end)
mp.vfo_add_buffer(l_0_1, "[docxmlu2a]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
