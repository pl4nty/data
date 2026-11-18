-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspFileInArchiveWithMotw.C
-- Type: 12
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true then
  local l_0_0 = mp.GetMOTWZone()
  if l_0_0 == nil or l_0_0 < 3 then
    return mp.CLEAN
  end
  local l_0_1 = mp.getfilesize()
  if 2097152 < l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = string.lower(mp.getfilename())
  if l_0_2 == nil or string.len(l_0_2) < 10 then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2:sub(-4)
  local l_0_4 = l_0_2:sub(-6)
  local l_0_5 = {
    [".jse"] = true,
    [".vbs"] = true,
    [".wsf"] = true,
    [".vbe"] = true,
    [".hta"] = true,
    [".mht"] = true,
    [".bat"] = true,
    [".ps1"] = true,
    [".cmd"] = true,
    [".url"] = true,
    [".exe"] = true,
    [".scr"] = true,
    [".pif"] = true,
    [".lnk"] = true,
    [".docx"] = true,
    [".xlsx"] = true,
    [".doc"] = true,
    [".xls"] = true,
    [".rtf"] = true,
    docm = true,
    xlsm = true,
    ppam = true,
    pptm = true,
    ppsm = true,
    potm = true
  }
  if l_0_5[l_0_3] == true or l_0_5[l_0_4] == true then
    if not l_0_2:find(".zip->", 1, true) and not l_0_2:find(".7z->", 1, true) and not l_0_2:find(".rar->", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
