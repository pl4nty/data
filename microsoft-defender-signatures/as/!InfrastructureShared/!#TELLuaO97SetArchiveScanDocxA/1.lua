-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:O97/SetArchiveScanDocx.A
-- Type: 13
-- MpAttributes: SCPT:TemplateDocx.A

if mp.readu_u32(headerpage, 1) == 67324752 and mp.readu_u32(footerpage, mp.FOOTERPAGE_SZ - 21) == 101010256 then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
  if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  local l_0_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  if string.find(l_0_1, "\\microsoft office\\office..\\....\\quickstyles") or string.find(l_0_1, "wordlr%.cab") or string.find(l_0_1, "devexpress%.snap%.v.....core%.dll") or string.find(l_0_1, "\\kingsoft\\wps cloud files\\userdata\\qing\\filecache", 1, true) or string.find(l_0_1, "\\kingsoft\\wps office\\.+\\office6\\mui\\default\\templates\\normal.dotm") then
    return mp.CLEAN
  end
  if string.find("winword.exe|wps.exe|dropbox.exe", l_0_2) and string.find(l_0_1, "%.tmp$") then
    return mp.CLEAN
  end
  local l_0_3 = tostring(footerpage)
  local l_0_4 = string.find(l_0_3, "word/_rels/document.xml.rels")
  if 22 <= l_0_4 then
    local l_0_5 = mp.readu_u32(l_0_3, l_0_4 - 22)
    if 204800 < l_0_5 then
      mp.set_mpattribute("MpForceScanArchives")
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
