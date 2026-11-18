-- Threat: !InfrastructureShared
-- Name: !#Lua:IOAVHTMLFile
-- Type: 13
-- MpAttributes: RPF:AnyFileHasIOAVURL & SCPT:HTMLFile & SCRIPT:HasScriptTag.A & !BM_PDF_FILE

if mp.get_mpattribute("RPF:TopLevelFile") then
  mp.set_mpattribute("Lua:IOAVTopLevelHTMLFile")
  mp.set_mpattribute("//Lua:GIOAVTopLevelHTMLFile")
elseif not mp.get_mpattribute("//Lua:GIOAVFirstHTMLFileInContainer") then
  local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
  if l_0_0:find(".crx->", 1, true) == nil and l_0_0:find(".apk->", 1, true) == nil and l_0_0:find(".msi->", 1, true) == nil and l_0_0:find(".xpi->", 1, true) == nil then
    mp.set_mpattribute("Lua:IOAVFirstHTMLFileInContainer")
    mp.set_mpattribute("//Lua:GIOAVFirstHTMLFileInContainer")
  end
end
return mp.CLEAN
