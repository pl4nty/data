-- Threat: !InfrastructureShared
-- Name: SuspiciousFileExtension
-- Type: 1

function GetSuspiciuousFileType(l_1_0)
  local l_1_1 = {
    [".au"] = "Bin",
    
    [".ax"] = "Bin",
    [".js"] = "Script",
    [".7z"] = "Archive"
  }
  local l_1_2 = {
    exe = "Bin",
    com = "Bin",
    scr = "Bin",
    cpl = "Bin",
    dll = "Bin",
    ocx = "Bin",
    msi = "Bin",
    sys = "Bin",
    bin = "Bin",
    fon = "Bin",
    drv = "Bin",
    app = "Bin",
    apl = "Bin",
    bat = "Script",
    cmd = "Script",
    vbs = "Script",
    reg = "Script",
    shs = "Script",
    [".vb"] = "Script",
    vbe = "Script",
    wsc = "Script",
    wsf = "Script",
    wsh = "Script",
    asm = "Script",
    ini = "Script",
    pif = "Script",
    htm = "Script",
    chm = "Script",
    msp = "Script",
    tlb = "Script",
    asp = "Script",
    msc = "Script",
    api = "Script",
    rar = "Archive",
    zip = "Archive",
    cab = "Archive",
    tar = "Archive",
    jar = "Archive",
    doc = "Office",
    xls = "Office",
    ppt = "Office"
  }
  local l_1_3 = {
    docm = "Office",
    xlsm = "Office",
    pptm = "Office",
    docx = "Office",
    xlsx = "Office",
    pptx = "Office",
    html = "Script",
    aspx = "Script",
    bzip = "Archive"
  }
  if l_1_0 == nil or string.len(l_1_0) < 4 then
    return nil
  end
  local l_1_4 = string.lower(l_1_0)
  local l_1_5 = string.match(l_1_4, "%.(%l+)$")
  if l_1_5 == nil then
    return nil
  end
  local l_1_6 = string.len(l_1_5)
  local l_1_7
  if l_1_6 == 2 then
    l_1_7 = l_1_1[l_1_5]
  elseif l_1_6 == 3 then
    l_1_7 = l_1_2[l_1_5]
  elseif l_1_6 == 4 then
    l_1_7 = l_1_3[l_1_5]
  end
  return l_1_7
end
