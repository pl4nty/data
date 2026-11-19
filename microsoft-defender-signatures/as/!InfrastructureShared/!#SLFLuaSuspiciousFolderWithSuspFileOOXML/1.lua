-- Threat: !InfrastructureShared
-- Name: !#SLF:LuaSuspiciousFolderWithSuspFileOOXML
-- Type: 13

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONMODIFIEDHANDLECLOSE or mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN then
  local l_0_0 = string.lower(mp.getfilename())
  if l_0_0 == nil then
    return mp.CLEAN
  end
  if l_0_0:len() < 50 then
    return mp.CLEAN
  end
  if not l_0_0:find("\\downloads", 1, true) then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if 1048576 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2, l_0_3 = l_0_0:match("(.+\\)([^\\]+)$")
  if l_0_2 == nil then
    return mp.CLEAN
  end
  if l_0_2:len() > 40 and l_0_3 ~= nil then
    if l_0_2:find("\\users\\[^\\]+\\downloads\\[0-9a-f]+\\") == nil then
      return mp.CLEAN
    end
    local l_0_4 = l_0_2:match("\\downloads\\[0-9a-f]+\\")
    if l_0_4 == nil or l_0_4:len() < 44 then
      return mp.CLEAN
    end
    local l_0_5 = {
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
    for l_0_6, l_0_7 in pairs(l_0_5) do
      if string.find(l_0_3, l_0_6, 1, true) then
        local l_0_8 = string.match(l_0_3, l_0_7)
        if l_0_8 == nil or string.len(l_0_8) < 4 then
          return mp.CLEAN
        end
        if l_0_8:find(">word/", 1, true) or l_0_8:find(">xl/embeddings/", 1, true) then
          if l_0_8:sub(-4) == ".bin" or l_0_8:sub(-4) == ".exe" or l_0_8:sub(-4) == ".scr" then
            return mp.INFECTED
          end
          break
        end
        if l_0_8:find(".jar->", 1, true) then
          if l_0_8:sub(-6) == ".class" then
            return mp.INFECTED
          end
          break
        end
        if l_0_8:find(">word/embeddings/ole", 1, true) then
          if l_0_8:sub(-4) == ".bin" or l_0_8:sub(-4) == ".exe" then
            return mp.INFECTED
          end
          break
        end
        if l_0_8:match(">%(ole stream .%)%->.+", 1, true) then
          return mp.INFECTED
        end
        break
      end
    end
  end
end
return mp.CLEAN
