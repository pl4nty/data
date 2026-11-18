-- Threat: !InfrastructureShared
-- Name: !#SLF:SuspFileInArchiveWithMotw.U
-- Type: 12

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONMODIFIEDHANDLECLOSE and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
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
    if not l_0_2:find(".iso->", 1, true) and not l_0_2:find(".arj->", 1, true) and not l_0_2:find(".gz->", 1, true) and not l_0_2:find(".xz->", 1, true) and not l_0_2:find(".ace->", 1, true) and not l_0_2:find(".z->", 1, true) and not l_0_2:find(".vhd->", 1, true) and not l_0_2:find("ppkg->", 1, true) and not l_0_2:find(".img->", 1, true) then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
