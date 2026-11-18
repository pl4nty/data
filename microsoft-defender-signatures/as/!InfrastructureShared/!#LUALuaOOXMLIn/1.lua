-- Threat: !InfrastructureShared
-- Name: !#LUA:LuaOOXMLIn
-- Type: 12
-- MpAttributes: BM_XML_FILE | Lua:LNKExt | Lua:VBSExt | Lua:HTAExt | Lua:URLExt | Nscript:Type_ps

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_1 = {
  ".xls->",
  ".xlsx->",
  ".doc->",
  ".docx->",
  ".rtf->",
  ".xlsm->",
  ".xlsb->",
  ".xltx->",
  ".xltm->",
  ".xlam->",
  ".xla->",
  ".docm->",
  ".dotx->",
  ".dotm->",
  ".ppt->",
  ".pptm->",
  ".pps->",
  ".pptx->",
  ".ppsx->",
  ".odt->"
}
for l_0_2, l_0_3 in pairs(l_0_1) do
  local l_0_4, l_0_5 = string.find(l_0_0, l_0_3, 1, true)
  if l_0_5 ~= nil then
    local l_0_6 = string.len(l_0_0)
    if l_0_5 >= l_0_6 or l_0_5 < 6 then
      return mp.CLEAN
    end
    if mp.get_mpattribute("BM_XML_FILE") then
      mp.set_mpattribute("LuaXmlInOOFile")
    elseif mp.get_mpattribute("Lua:LNKExt") then
      mp.set_mpattribute("LuaLNKOOFile")
    elseif mp.get_mpattribute("Lua:VBSExt") then
      mp.set_mpattribute("LuaVbsInOOFile")
    elseif mp.get_mpattribute("Lua:HTAExt") then
      mp.set_mpattribute("LuaHtaInOOFile")
    elseif mp.get_mpattribute("Lua:URLExt") then
      mp.set_mpattribute("LuaUrlInOOFile")
    elseif mp.get_mpattribute("Nscript:Type_ps") then
      mp.set_mpattribute("LuaPSInOOFile")
    end
  end
end
return mp.CLEAN
