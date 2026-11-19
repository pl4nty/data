-- Threat: !InfrastructureShared
-- Name: !#LUA:OutlookOOFile
-- Type: 12
-- Includes: GetEmailPaths

local l_0_0, l_0_1 = mp.getfilename(mp.bitor(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if not mp.get_mpattribute("Lua:DownFromWebMail") then
  if l_0_0 == nil or (string.len(l_0_0) < 30 or string.find(l_0_0, "\\appdata\\local\\microsoft\\windows\\inetcache\\content.outlook\\", 1, true) == nil) and (string.find(l_0_0, "\\downloads", 1, true) == nil or not isOutlookProcess()) then
    return mp.CLEAN
  end
  if string.find(l_0_0, ":\\recoverybin\\volume-", 1, true) ~= nil then
    return mp.CLEAN
  end
end
if l_0_1 == nil or string.len(l_0_1) < 12 then
  return mp.CLEAN
end
local l_0_2 = l_0_1:sub(-4)
local l_0_3 = {
  [".xml"] = true,
  rels = true
}
if l_0_3[l_0_2] == true then
  return mp.CLEAN
end
local l_0_4 = {
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
  ["pptm->"] = "%.pptm%->.+",
  [".pps->"] = "%.pps%->.+",
  ["ppsx->"] = "%.ppsx%->.+",
  [".odt->"] = "%.odt%->.+",
  [".xml->"] = "%.xml%->.+"
}
for l_0_5, l_0_6 in pairs(l_0_4) do
  if string.find(l_0_1, l_0_5, 1, true) then
    local l_0_7 = string.match(l_0_1, l_0_6)
    if l_0_7 == nil or string.len(l_0_7) < 4 then
      return mp.CLEAN
    end
    if l_0_7:find("/vba", 1, true) then
      if l_0_7:sub(-4) == ".bin" then
        mp.set_mpattribute("LUA:MacroInOutlook")
        return mp.INFECTED
      end
      break
    end
    if l_0_7:find(">word/", 1, true) then
      if l_0_7:sub(-4) == ".exe" or l_0_7:sub(-4) == ".scr" then
        mp.set_mpattribute("LUA:ExecInOutlook")
        return mp.INFECTED
      end
      break
    end
    if l_0_7:find(".jar->", 1, true) then
      if l_0_7:sub(-6) == ".class" then
        mp.set_mpattribute("LUA:JarInOutlook")
        return mp.INFECTED
      end
      break
    end
    if l_0_7:find(">xl/embeddings/", 1, true) then
      if l_0_7:sub(-4) == ".bin" or l_0_7:sub(-4) == ".exe" or l_0_7:sub(-4) == ".scr" then
        mp.set_mpattribute("LUA:ExecInOutlook")
        return mp.INFECTED
      end
      break
    end
    if l_0_7:find(">word/embeddings/ole", 1, true) then
      if l_0_7:sub(-4) == ".bin" or l_0_7:sub(-4) == ".exe" then
        mp.set_mpattribute("LUA:ExecInOutlook")
        return mp.INFECTED
      end
      break
    end
    if l_0_7:find("oleobject", 1, true) then
      if l_0_7:sub(-4) == ".bin" then
        mp.set_mpattribute("LUA:OleObjInOutlook")
        return mp.INFECTED
      end
      break
    end
    if l_0_7:match(">%(ole stream .%)%->.+", 1, true) and l_0_7:find("->(utf-", 1, true) == nil then
      if l_0_7:sub(-4) ~= ".bin" then
        if l_0_7:sub(-4) == ".lnk" then
          mp.set_mpattribute("LUA:LnkInOleStreamInOutlook")
          return mp.INFECTED
        end
        break
      end
      if l_0_7:sub(-11) == "ole10native" then
        mp.set_mpattribute("LUA:OleNativeInOutlook")
        return mp.INFECTED
      end
      mp.set_mpattribute("LUA:OleStreamInOutlook")
      return mp.INFECTED
    end
    break
  end
end
return mp.CLEAN
