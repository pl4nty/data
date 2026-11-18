-- Threat: !InfrastructureShared
-- Name: HIPSEmailInfrastructure
-- Type: 1

function IsSuspiciousFileExt(l_1_0)
  local l_1_1 = {
    exe = 1,
    
    dll = 1,
    scr = 1,
    ocx = 1,
    com = 1,
    js = 2,
    vbs = 2,
    hta = 2,
    cmd = 2,
    jar = 2,
    jse = 2,
    pif = 2,
    vbe = 2,
    wsc = 2,
    wsf = 2,
    wsh = 2,
    bat = 2
  }
  local l_1_2 = l_1_1[l_1_0]
  if l_1_2 == 1 then
    return mp.get_mpattribute("BM_MZ_FILE")
  elseif l_1_2 == 2 then
    return true
  end
  return false
end

function IsArchiveFileExt(l_2_0)
  local l_2_1 = {
    zip = true,
    cab = true,
    rar = true,
    ["7z"] = true
  }
  if l_2_1[l_2_0] == nil then
    return false
  end
  return true
end

function IsLnkPointingtoSuspFileExt()
  if not mp.get_mpattribute("BM_LNK_FILE") then
    return false
  end
  local l_3_0 = {
    exe = true,
    dll = true,
    scr = true,
    ocx = true,
    com = true,
    js = true,
    vbs = true,
    ps1 = true,
    hta = true,
    cmd = true,
    jar = true,
    jse = true,
    pif = true,
    vbe = true,
    wsc = true,
    wsf = true,
    wsh = true,
    bat = true
  }
  local l_3_1 = mp.GetLnkInfo()
  if l_3_1 == nil or l_3_1 == "" then
    return false
  end
  if l_3_1.BasePath ~= nil and l_3_1.BasePath ~= "" then
    local l_3_2 = string.match(l_3_1.BasePath, "%.([^%.]+)$")
    if l_3_2 ~= nil and l_3_2 ~= "" and l_3_0[l_3_2] == true then
      return true
    end
  end
  if l_3_1.RelativePath ~= nil and l_3_1.RelativePath ~= "" then
    local l_3_3 = string.match(l_3_1.RelativePath, "%.([^%.]+)$")
    if l_3_3 ~= nil and l_3_3 ~= "" and l_3_0[l_3_3] == true then
      return true
    end
  end
  return false
end

function IsWebmailDownloadURL()
  local l_4_0 = mp.IOAVGetDownloadUrl()
  if l_4_0 == nil or string.len(l_4_0) < 15 then
    return false
  end
  local l_4_1 = l_4_0:match("https?://([%w%.-]+)/"):lower()
  if l_4_1 == nil then
    return false
  end
  if l_4_1:find("mail.google", 1, true) ~= nil or l_4_1:find("mail-attachment", 1, true) ~= nil or l_4_1:find("attachment.outlook.", 1, true) ~= nil or l_4_1:find("dl-mail.ymail", 1, true) ~= nil or l_4_1:find(".yahoomail.", 1, true) ~= nil then
    return true
  end
  return false
end

function IsWebmailDownloadURLNew()
  local l_5_0 = mp.IOAVGetDownloadUrl()
  if l_5_0 == nil or #l_5_0 < 10 then
    l_5_0 = mp.GetMOTWHostUrl()
    if l_5_0 == nil or #l_5_0 < 10 then
      return false
    end
  end
  local l_5_1 = l_5_0:match("https?://([%w%.-]+)/?")
  l_5_1 = l_5_1 and l_5_1:lower()
  local l_5_2 = {
    "mail.google",
    "dl-mail.ymai",
    ".yahoomail.",
    "outlook-sdf.",
    "attachment"
  }
  for l_5_3, l_5_4 in ipairs(l_5_2) do
    if l_5_1:find(l_5_4, 1, true) then
      return true
    end
  end
  return false
end

function IsWebmailDownloadUrlIoavAndMotwV0()
  local l_6_0 = {
    "mail.google",
    "dl-mail.ymai",
    ".yahoomail.",
    "outlook-sdf.",
    "attachment",
    "outlook.live.com",
    "outlook.office.com"
  }
  local l_6_1 = mp.IOAVGetDownloadUrl()
  if l_6_1 ~= nil and 10 < #l_6_1 then
    local l_6_2 = l_6_1:match("https?://([%w%.-]+)/?")
    if l_6_2 ~= nil and 10 < #l_6_2 then
      l_6_2 = l_6_2:lower()
      for l_6_3, l_6_4 in ipairs(l_6_0) do
        if l_6_2:find(l_6_4, 1, true) then
          return true
        end
      end
    end
  end
  local l_6_5 = mp.GetMOTWHostUrl()
  if l_6_5 ~= nil and 10 < #l_6_5 then
    local l_6_6 = l_6_5:match("https?://([%w%.-]+)/?")
    if l_6_6 ~= nil and 10 < #l_6_6 then
      l_6_6 = l_6_6:lower()
      for l_6_7, l_6_8 in ipairs(l_6_0) do
        if l_6_6:find(l_6_8, 1, true) then
          return true
        end
      end
    end
  end
  return false
end

function IsWebmailDownloadUrlIoavAndMotwV1()
  local l_7_0 = {
    "mail.google",
    "dl-mail.ymai",
    ".yahoomail.",
    "outlook-sdf.",
    "attachment",
    "outlook.live.com",
    "outlook.office.com",
    "outlook.cloud.microsoft"
  }
  local l_7_1 = mp.IOAVGetDownloadUrl()
  if l_7_1 ~= nil and 10 < #l_7_1 then
    local l_7_2 = l_7_1:match("https?://([%w%.-]+)/?")
    if l_7_2 ~= nil and 10 < #l_7_2 then
      l_7_2 = l_7_2:lower()
      for l_7_3, l_7_4 in ipairs(l_7_0) do
        if l_7_2:find(l_7_4, 1, true) then
          return true
        end
      end
    end
  end
  local l_7_5 = mp.GetMOTWHostUrl()
  if l_7_5 ~= nil and 10 < #l_7_5 then
    local l_7_6 = l_7_5:match("https?://([%w%.-]+)/?")
    if l_7_6 ~= nil and 10 < #l_7_6 then
      l_7_6 = l_7_6:lower()
      for l_7_7, l_7_8 in ipairs(l_7_0) do
        if l_7_6:find(l_7_8, 1, true) then
          return true
        end
      end
    end
  end
  return false
end

function IsEmailCachePath(l_8_0)
  local l_8_1 = {
    ["outlook.exe"] = {
      "\\temporary internet files\\content.outlook\\",
      "\\inetcache\\content.outlook\\"
    }
  }
  local l_8_2 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  local l_8_3 = l_8_1[l_8_2]
  if l_8_3 == nil then
    return false
  end
  for l_8_4, l_8_5 in pairs(l_8_3) do
    if l_8_0:find(l_8_5, 1, true) ~= nil then
      return true
    end
  end
  return false
end
