-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaSuspRefOO
-- Type: 13
-- MpAttributes: BM_XML_FILE & (SCPT:JS/URL.exe.B | SCPT:JS/URL.dll.B)

local l_0_0 = mp.getfilesize()
if 1536000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1, l_0_2 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_1:find("\\downloads", 1, true) then
  return mp.CLEAN
end
local l_0_3 = {
  [".xls->"] = "%.xls%->.+",
  ["xlsx->"] = "%.xlsx%->.+",
  [".doc->"] = "%.doc%->.+",
  ["docx->"] = "%.docx%->.+",
  [".rtf->"] = "%.rtf%->.+",
  ["xlsm->"] = "%.xlsm%->.+",
  ["xlsb->"] = "%.xlsb%->.+",
  ["xltx->"] = "%.xltx%->.+",
  ["xltm->"] = "%.xltm%->.+",
  ["xlam->"] = "%.xlam%->.+",
  [".xla->"] = "%.xla%->.+",
  ["docm->"] = "%.docm%->.+",
  ["dotx->"] = "%.dotx%->.+",
  ["dotm->"] = "%.dotm%->.+",
  [".ppt->"] = "%.ppt%->.+",
  ["pptm->"] = "%.pptm%->.+",
  [".pps->"] = "%.pps%->.+",
  ["pptx->"] = "%.pptx%->.+",
  ["ppsx->"] = "%.ppsx%->.+",
  [".odt->"] = "%.odt%->.+",
  [".xml->"] = "%.xml%->.+"
}
for l_0_4, l_0_5 in pairs(l_0_3) do
  if string.find(l_0_2, l_0_4, 1, true) then
    local l_0_6 = string.match(l_0_2, l_0_5)
    if l_0_6 == nil or l_0_6:len() < 12 then
      return mp.CLEAN
    end
    if l_0_6:find("sheets/", 1, true) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
