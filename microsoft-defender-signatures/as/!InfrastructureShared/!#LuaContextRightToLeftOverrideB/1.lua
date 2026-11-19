-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/RightToLeftOverride.B
-- Type: 12
-- MpAttributes: MpOnOpenOrCloseRtpScan

local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0 ~= nil and 5 < #l_0_0 then
  if string.find(string.sub(l_0_0, -4), ".", 1, true) == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.find(l_0_0, "\226\128\174", 2, true)
  if l_0_1 == nil then
    return mp.CLEAN
  end
  local l_0_2 = {
    bat = true,
    exe = true,
    scr = true,
    cmd = true,
    com = true,
    lnk = true,
    pif = true,
    vbe = true,
    vbs = true,
    [".js"] = true,
    jse = true,
    wsh = true,
    wsf = true,
    ps1 = true,
    jar = true,
    hta = true
  }
  local l_0_3 = string.sub(l_0_0, -3)
  if l_0_2[l_0_3] ~= nil then
    if 10 <= #l_0_0 and #l_0_0 > l_0_1 + 6 then
      local l_0_4 = {
        ["cod."] = "doc",
        ["cod "] = "doc",
        xcod = "docx",
        ["slx."] = "xls",
        xslx = "xlsx",
        ["tpp."] = "ppt",
        xtpp = "pptx",
        ["ftr."] = "rtf",
        ["fdp."] = "pdf",
        ["txt."] = "txt",
        ["ini."] = "ini",
        ["4pm."] = "mp4",
        ["3pm."] = "mp3",
        ["vaw."] = "wav",
        ["iva."] = "avi",
        ["vkm."] = "mkv",
        bvmr = "rmvb",
        ["vmw."] = "wmv",
        ["vom."] = "mov",
        ["gpj."] = "jpg",
        ["gnp."] = "png",
        ["pmb."] = "bmp",
        ["pg3."] = "3gp",
        ["piz."] = "zip",
        ["rar."] = "rar",
        lmth = "html",
        ["mth."] = "htm"
      }
      local l_0_5 = string.sub(l_0_0, l_0_1 + 3, l_0_1 + 6)
      if l_0_4[l_0_5] ~= nil then
        mp.set_mpattribute("Lua:Context/RightToLeftOverride.B!fake_" .. l_0_4[l_0_5])
        mp.set_mpattribute("Lua:Context/RightToLeftOverride.B!masquerading")
        return mp.INFECTED
      end
    end
    mp.set_mpattribute("Lua:Context/RightToLeftOverride.B!suspicious")
  end
  return mp.INFECTED
end
return mp.CLEAN
