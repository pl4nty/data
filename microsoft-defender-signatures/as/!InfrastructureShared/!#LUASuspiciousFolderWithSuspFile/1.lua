-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspiciousFolderWithSuspFile
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

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
    mp.set_mpattribute("LUA:SuspFolderInDownloads.A")
    local l_0_5 = l_0_3:sub(-4)
    local l_0_6 = l_0_3:sub(-5)
    local l_0_7 = {
      [".doc"] = true,
      [".xls"] = true,
      [".rtf"] = true,
      [".docm"] = true,
      [".xlsm"] = true,
      [".ppam"] = true,
      [".pptm"] = true,
      [".ppsm"] = true,
      [".potm"] = true,
      [".docx"] = true,
      [".xlsx"] = true,
      [".jse"] = true,
      [".vbs"] = true,
      [".wsf"] = true,
      [".vbe"] = true,
      [".hta"] = true,
      [".mht"] = true,
      [".lnk"] = true,
      [".bat"] = true,
      [".ps1"] = true,
      [".cmd"] = true,
      [".url"] = true,
      [".exe"] = true,
      [".scr"] = true,
      [".pif"] = true,
      [".dll"] = true
    }
    if l_0_7[l_0_5] == true or l_0_7[l_0_6] == true then
      mp.set_mpattribute("LUA:SuspFileInSuspFolder.A")
    end
  end
end
return mp.CLEAN
