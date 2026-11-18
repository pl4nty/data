-- Threat: !InfrastructureShared
-- Name: !#Lua:Context/RightToLeftOverride.gen!C
-- Type: 13
-- MpAttributes: MpOnOpenOrCloseRtpScan & RPF:TopLevelFile

if mp.get_mpattribute("Lua:Context/RightToLeftOverride.A!masquerading") or mp.get_mpattribute("Lua:Context/RightToLeftOverride.B!masquerading") then
  return mp.CLEAN
end
local l_0_0 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME))
if l_0_0 ~= nil and 5 < #l_0_0 then
  if string.find(string.sub(l_0_0, -4), ".", 1, true) == nil then
    return mp.CLEAN
  end
  if string.find(l_0_0, "\226\128\174", 1, true) == nil then
    return mp.CLEAN
  end
  local l_0_1 = string.sub(l_0_0, -3)
  local l_0_2 = "Lua:Context/RightToLeftOverride.gen!A"
  local l_0_3 = {
    [".7z"] = "Lua:Context/RightToLeftOverride.C",
    zip = "Lua:Context/RightToLeftOverride.C",
    rar = "Lua:Context/RightToLeftOverride.C",
    cmd = "Lua:Context/RightToLeftOverride.D",
    bat = "Lua:Context/RightToLeftOverride.D",
    vbe = "Lua:Context/RightToLeftOverride.D",
    vbs = "Lua:Context/RightToLeftOverride.D",
    [".js"] = "Lua:Context/RightToLeftOverride.D",
    jse = "Lua:Context/RightToLeftOverride.D",
    wsh = "Lua:Context/RightToLeftOverride.D",
    wsf = "Lua:Context/RightToLeftOverride.D",
    ps1 = "Lua:Context/RightToLeftOverride.D",
    jar = "Lua:Context/RightToLeftOverride.D",
    hta = "Lua:Context/RightToLeftOverride.D",
    lnk = "Lua:Context/RightToLeftOverride.D",
    exe = "Lua:Context/RightToLeftOverride.E",
    scr = "Lua:Context/RightToLeftOverride.E",
    com = "Lua:Context/RightToLeftOverride.E",
    pif = "Lua:Context/RightToLeftOverride.E",
    dav = "Lua:Context/RightToLeftOverride.F"
  }
  if l_0_3[l_0_1] == nil then
    return mp.CLEAN
  end
  l_0_2 = l_0_3[l_0_1]
  local l_0_4 = l_0_0:gsub(" ", "")
  l_0_4 = string.gsub(l_0_4, "\226[\128-\129][^\174]", "")
  local l_0_5 = string.gmatch(l_0_4, "\226\128\174(.[%w%p%s]+)")
  local l_0_6 = {}
  local l_0_7 = 0
  for l_0_8 in l_0_5, nil, nil do
    if #l_0_8 == 3 then
      l_0_6[l_0_8] = true
      l_0_7 = l_0_7 + 1
    elseif 3 < #l_0_8 then
      l_0_6[string.sub(l_0_8, 0, 3)] = true
      l_0_6[string.sub(l_0_8, 0, 4)] = true
      l_0_7 = l_0_7 + 2
    end
  end
  if l_0_7 == 0 then
    return mp.CLEAN
  end
  local l_0_9 = {
    cod = "doc",
    xcod = "docx",
    slx = "xls",
    [".slx"] = "xls",
    xslx = "xlsx",
    [".xsl"] = "xlsx",
    tpp = "ppt",
    xtpp = "pptx",
    ftr = "rtf",
    fdp = "pdf",
    txt = "txt",
    ini = "ini",
    ["4pm"] = "mp4",
    ["3pm"] = "mp3",
    vaw = "wav",
    iva = "avi",
    vkm = "mkv",
    bvmr = "rmvb",
    vmw = "wmv",
    vom = "mov",
    vlf = "flv",
    a4m = "m4a",
    gpj = "jpg",
    gepj = "jpeg",
    gnp = "png",
    pmb = "bmp",
    fig = "gif",
    pg3 = "3gp",
    piz = "zip",
    rar = "rar",
    ["z7."] = ".7z",
    lmth = "html",
    mth = "htm",
    php = "php",
    ["3php"] = "php",
    mhc = "chm"
  }
  for l_0_10, l_0_11 in pairs(l_0_6) do
    if l_0_9[l_0_10] ~= nil then
      mp.set_mpattribute(l_0_2)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
