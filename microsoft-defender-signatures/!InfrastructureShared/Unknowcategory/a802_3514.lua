-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a802_3514.luac 

-- params : ...
-- function num : 0
IsSuspiciousFileExt = function(l_1_0)
  -- function num : 0_0
  local l_1_1 = {}
  l_1_1.exe = 1
  l_1_1.dll = 1
  l_1_1.scr = 1
  l_1_1.ocx = 1
  l_1_1.com = 1
  l_1_1.js = 2
  l_1_1.vbs = 2
  l_1_1.hta = 2
  l_1_1.cmd = 2
  l_1_1.jar = 2
  l_1_1.jse = 2
  l_1_1.pif = 2
  l_1_1.vbe = 2
  l_1_1.wsc = 2
  l_1_1.wsf = 2
  l_1_1.wsh = 2
  l_1_1.bat = 2
  local l_1_2 = l_1_1[l_1_0]
  if l_1_2 == 1 then
    local l_1_3 = mp.get_mpattribute
    local l_1_4 = "BM_MZ_FILE"
    do return l_1_3(l_1_4) end
    -- DECOMPILER ERROR at PC26: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  else
    if l_1_2 == 2 then
      return true
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC33: Confused about usage of register R3 for local variables in 'ReleaseLocals'

end

IsArchiveFileExt = function(l_2_0)
  -- function num : 0_1
  local l_2_1 = {}
  l_2_1.zip = true
  l_2_1.cab = true
  l_2_1.rar = true
  l_2_1["7z"] = true
  if l_2_1[l_2_0] == nil then
    return false
  end
  return true
end

IsLnkPointingtoSuspFileExt = function()
  -- function num : 0_2
  if not (mp.get_mpattribute)("BM_LNK_FILE") then
    return false
  end
  local l_3_0 = {}
  l_3_0.exe = true
  l_3_0.dll = true
  l_3_0.scr = true
  l_3_0.ocx = true
  l_3_0.com = true
  l_3_0.js = true
  l_3_0.vbs = true
  l_3_0.ps1 = true
  l_3_0.hta = true
  l_3_0.cmd = true
  l_3_0.jar = true
  l_3_0.jse = true
  l_3_0.pif = true
  l_3_0.vbe = true
  l_3_0.wsc = true
  l_3_0.wsf = true
  l_3_0.wsh = true
  l_3_0.bat = true
  local l_3_1 = (mp.GetLnkInfo)()
  if l_3_1 == nil or l_3_1 == "" then
    return false
  end
  do
    if l_3_1.BasePath ~= nil and l_3_1.BasePath ~= "" then
      local l_3_2 = (string.match)(l_3_1.BasePath, "%.([^%.]+)$")
      if l_3_2 ~= nil and l_3_2 ~= "" and l_3_0[l_3_2] == true then
        return true
      end
    end
    do
      if l_3_1.RelativePath ~= nil and l_3_1.RelativePath ~= "" then
        local l_3_3 = (string.match)(l_3_1.RelativePath, "%.([^%.]+)$")
        if l_3_3 ~= nil and l_3_3 ~= "" and l_3_0[l_3_3] == true then
          return true
        end
      end
      return false
    end
  end
end

IsWebmailDownloadURL = function()
  -- function num : 0_3
  local l_4_0 = (mp.IOAVGetDownloadUrl)()
  if l_4_0 == nil or (string.len)(l_4_0) < 15 then
    return false
  end
  local l_4_1 = (l_4_0:match("https?://([%w%.-]+)/")):lower()
  if l_4_1 == nil then
    return false
  end
  if l_4_1:find("mail.google", 1, true) ~= nil or l_4_1:find("mail-attachment", 1, true) ~= nil or l_4_1:find("attachment.outlook.", 1, true) ~= nil or l_4_1:find("dl-mail.ymail", 1, true) ~= nil or l_4_1:find(".yahoomail.", 1, true) ~= nil then
    return true
  end
  return false
end

IsWebmailDownloadURLNew = function()
  -- function num : 0_4
  local l_5_0 = (mp.IOAVGetDownloadUrl)()
  if l_5_0 == nil or #l_5_0 < 10 then
    l_5_0 = (mp.GetMOTWHostUrl)()
    if l_5_0 == nil or #l_5_0 < 10 then
      return false
    end
  end
  local l_5_1 = l_5_0:match("https?://([%w%.-]+)/?")
  if l_5_1 then
    l_5_1 = l_5_1:lower()
  end
  do
    local l_5_2 = {}
    -- DECOMPILER ERROR at PC33: No list found for R2 , SetList fails

    -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

    -- DECOMPILER ERROR at PC35: Overwrote pending register: R4 in 'AssignReg'

    for l_5_6,l_5_7 in ("mail.google")("dl-mail.ymai") do
      if l_5_1:find(l_5_7, 1, true) then
        return true
      end
    end
    do return false end
    -- WARNING: undefined locals caused missing assignments!
  end
end

IsWebmailDownloadUrlIoavAndMotwV0 = function()
  -- function num : 0_5
  local l_6_0 = {}
  -- DECOMPILER ERROR at PC8: No list found for R0 , SetList fails

  -- DECOMPILER ERROR at PC9: Overwrote pending register: R1 in 'AssignReg'

  local l_6_1 = (("mail.google").IOAVGetDownloadUrl)()
  -- DECOMPILER ERROR at PC14: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC17: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R4 in 'AssignReg'

  if l_6_1 ~= nil and "dl-mail.ymai" > 10 then
    local l_6_2 = l_6_1:match("outlook-sdf.")
    if l_6_2 ~= nil and #l_6_2 > 10 then
      for l_6_6,l_6_7 in ipairs(l_6_0) do
        if l_6_2:find(l_6_7, 1, true) then
          return true
        end
      end
    end
  end
  do
    -- DECOMPILER ERROR at PC43: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC44: Overwrote pending register: R2 in 'AssignReg'

    local l_6_8 = nil
    -- DECOMPILER ERROR at PC51: Overwrote pending register: R3 in 'AssignReg'

    if l_6_2 ~= nil and l_6_8 > 10 then
      local l_6_9 = nil
      -- DECOMPILER ERROR at PC59: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC61: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC62: Overwrote pending register: R4 in 'AssignReg'

      if l_6_8 ~= nil and l_6_9 > 10 then
        for l_6_13,l_6_14 in l_6_9 do
          local l_6_14 = nil
          -- DECOMPILER ERROR at PC73: Overwrote pending register: R9 in 'AssignReg'

          if l_6_14 then
            return l_6_14
          end
        end
      end
    end
    do
      -- DECOMPILER ERROR at PC77: Overwrote pending register: R3 in 'AssignReg'

      do return l_6_8 end
      -- DECOMPILER ERROR at PC79: Confused about usage of register R4 for local variables in 'ReleaseLocals'

      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

IsEmailCachePath = function(l_7_0)
  -- function num : 0_6
  local l_7_1 = {}
  local l_7_2 = {}
  -- DECOMPILER ERROR at PC4: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC7: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC8: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC10: Overwrote pending register: R4 in 'AssignReg'

  l_7_2 = l_7_2((("\\temporary internet files\\content.outlook\\").get_contextdata)(("\\inetcache\\content.outlook\\").CONTEXT_DATA_PROCESSNAME))
  local l_7_3 = l_7_1[l_7_2]
  if l_7_3 == nil then
    return false
  end
  for l_7_7,l_7_8 in pairs(l_7_3) do
    if l_7_0:find(l_7_8, 1, true) ~= nil then
      return true
    end
  end
  return false
end


