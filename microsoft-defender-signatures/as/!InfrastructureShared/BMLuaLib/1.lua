-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\BMLuaLib\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 ~= nil and type(l_1_0) == "table" then
    local l_1_1, l_1_2 = (bm.get_process_relationships)()
    for l_1_6,l_1_7 in ipairs(l_1_1) do
      if l_1_7.image_path ~= nil then
        local l_1_8 = (l_1_7.image_path):match("\\([^\\]+)$")
        if l_1_0[l_1_8] or l_1_0[(string.lower)(l_1_8)] then
          return true
        end
      end
    end
  end
  do
    l_1_1 = false
    return l_1_1
  end
end

local l_0_1 = function(l_2_0, l_2_1)
  -- function num : 0_1
  if l_2_0 == nil or l_2_1 == nil or next(l_2_1) == nil then
    return nil
  end
  local l_2_2 = l_2_0
  for l_2_6,l_2_7 in ipairs(l_2_1) do
    if l_2_7 ~= nil and l_2_7 ~= "" then
      local l_2_8 = scrubData(l_2_7)
      if (string.find)(l_2_0, l_2_7) ~= nil then
        l_2_2 = (string.gsub)(l_2_2, l_2_7, l_2_8)
      end
    end
  end
  return l_2_2
end

local l_0_2 = function(l_3_0)
  -- function num : 0_2
  local l_3_1 = pcall
  local l_3_2 = mp.GetUrlReputation
  local l_3_3 = {}
  -- DECOMPILER ERROR at PC5: No list found for R3 , SetList fails

  local l_3_4 = {}
  l_3_4.TAG = "NOLOOKUP"
  l_3_1 = l_3_1(l_3_2, l_3_3, l_3_4)
  if l_3_1 and l_3_2 then
    l_3_3 = l_3_2.urls
    l_3_4 = ipairs
    l_3_4 = l_3_4(l_3_3)
    for l_3_8,i_2 in l_3_4 do
      if l_3_8.determination == 2 then
        local l_3_9 = l_3_8.urlresponsecontext
        if l_3_9 then
          local l_3_10 = ""
          for l_3_14,l_3_15 in ipairs(l_3_9) do
            local l_3_16 = l_3_15.key
            local l_3_17 = l_3_15.value
            if l_3_16 == "MaceFamily" then
              do
                do
                  l_3_10 = (string.lower)(l_3_17)
                  do break end
                  -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
          if l_3_10 ~= "" then
            return true, l_3_10, l_3_8.confidence
          end
        end
      end
    end
  end
  do
    l_3_3 = false
    do return l_3_3, nil, nil end
    -- DECOMPILER ERROR at PC52: Confused about usage of register R4 for local variables in 'ReleaseLocals'

  end
end

local l_0_3 = function(l_4_0, l_4_1)
  -- function num : 0_3
  if type(l_4_0) ~= "string" or type(l_4_1) ~= "table" then
    return l_4_0
  end
  for l_4_5,l_4_6 in pairs(l_4_1) do
    if type(l_4_6) == "string" and (string.len)(l_4_6) == 1 then
      l_4_0 = (string.gsub)(l_4_0, "\'%s*%" .. l_4_6 .. "%s*\'", "")
      l_4_0 = (string.gsub)(l_4_0, "\"%s*%" .. l_4_6 .. "%s*\"", "")
    end
  end
  return l_4_0
end

local l_0_4 = function(l_5_0, l_5_1)
  -- function num : 0_4
  local l_5_2 = {}
  local l_5_3 = {}
  -- DECOMPILER ERROR at PC42: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC51: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC52: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC53: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC57: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC58: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC59: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC61: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC69: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC70: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC71: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC73: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC74: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC75: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC77: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC78: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC79: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC81: Overwrote pending register: R40 in 'AssignReg'

  -- DECOMPILER ERROR at PC82: Overwrote pending register: R41 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R42 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R43 in 'AssignReg'

  l_5_2[1], l_5_3 = l_5_3, {"yur", "tox", "how", "your", "motd", "more", "help", "desk", "where", "vault", "leame", "文件解密帮助", "пароль", "unlock", "ransom", "readme", "please", "locked", "warning", "restore", "recover", "rec0ver", "payment", "install", "h_e_l_p", "encrypt", "decrypt", "crjoker", "rarvault", "mensagem", "fs0ciety", "de-crypt", "criptoso", "beni oku", "_what_is", "zino_note", "wallpaper", "infection", "attention", "important!", "000-if-you-want-dec-files", "ontsleutelings_instructies", "nomoreransom_note_original", "if_want_files_back_pls_read", "comment débloquer mes fichiers", "recupere seus arquivos. leia-me!", "dosyalariniza ulaşmak İçİn açiniz", "wie_zum_wiederherstellen_von_dateien", "_adatok_visszaallitasahoz_utasitasok", "como descriptografar os seus arquivos"}
  if l_5_0 ~= nil and l_5_0 ~= "" then
    l_5_3 = l_5_2[l_5_1]
  end
  if l_5_3 == nil then
    l_5_3 = nil
    return l_5_3
  end
  l_5_3 = l_5_3(l_5_0, "[^>](.-)([^\\/]-%.?([^%.\\/]*))$")
  local l_5_4, l_5_5 = nil
  if l_5_4 == nil then
    return nil
  end
  for l_5_9,l_5_10 in ipairs(l_5_2[l_5_1]) do
    if (string.find)(l_5_4:lower(), l_5_10, 1, true) then
      return true
    end
  end
  return false
end

local l_0_5 = function(l_6_0, l_6_1, l_6_2, l_6_3)
  -- function num : 0_5
  if l_6_0 == nil or l_6_0 == "" or l_6_1 == nil or l_6_1 == "" then
    return 
  end
  local l_6_4, l_6_5 = (string.match)(l_6_0, "pid:(%w+),ProcessStart:(%w+)")
  if l_6_4 ~= nil and l_6_5 ~= nil then
    local l_6_6 = (string.lower)(l_6_4 .. "_" .. l_6_5 .. "_" .. l_6_1)
    if l_6_3 == 0 then
      l_6_3 = 3600
    end
    if #l_6_2 > 0 then
      (MpCommon.SetPersistContextNoPath)(l_6_6, l_6_2, l_6_3)
    end
  end
end

local l_0_6 = function(l_7_0, l_7_1)
  -- function num : 0_6
  if l_7_0 == nil or l_7_0 == "" or l_7_1 == nil or l_7_1 == "" then
    return 
  end
  local l_7_2, l_7_3 = (string.match)(l_7_0, "pid:(%w+),ProcessStart:(%w+)")
  if l_7_2 ~= nil and l_7_3 ~= nil then
    local l_7_7 = string.lower
    local l_7_8 = l_7_2
    local l_7_9 = "_"
    l_7_8 = l_7_8 .. l_7_9 .. l_7_3 .. "_" .. l_7_1
    l_7_7 = l_7_7(l_7_8)
    local l_7_4 = nil
    l_7_8 = MpCommon
    l_7_8 = l_7_8.GetPersistContextCountNoPath
    l_7_9 = l_7_7
    l_7_8 = l_7_8(l_7_9)
    if l_7_8 > 0 then
      do
        l_7_8 = MpCommon
        l_7_8 = l_7_8.GetPersistContextNoPath
        local l_7_5 = nil
        l_7_9 = l_7_7
        local l_7_6 = nil
        do return l_7_8(l_7_9) end
        -- DECOMPILER ERROR at PC38: Confused about usage of register R6 for local variables in 'ReleaseLocals'

      end
    end
  end
end

local l_0_7 = function()
  -- function num : 0_7
  local l_8_0 = {}
  local l_8_1 = {}
  -- DECOMPILER ERROR at PC4: No list found for R1 , SetList fails

  local l_8_2 = {}
  -- DECOMPILER ERROR at PC6: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC8: No list found for R2 , SetList fails

  local l_8_3 = {}
  -- DECOMPILER ERROR at PC10: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC12: No list found for R3 , SetList fails

  local l_8_4 = {}
  -- DECOMPILER ERROR at PC14: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC16: No list found for R4 , SetList fails

  local l_8_5 = {}
  -- DECOMPILER ERROR at PC18: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC20: No list found for R5 , SetList fails

  local l_8_6 = {}
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: No list found for R6 , SetList fails

  local l_8_7 = {}
  -- DECOMPILER ERROR at PC26: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC28: No list found for R7 , SetList fails

  local l_8_8 = {}
  -- DECOMPILER ERROR at PC30: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: No list found for R8 , SetList fails

  local l_8_9 = {}
  -- DECOMPILER ERROR at PC34: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC36: No list found for R9 , SetList fails

  local l_8_10 = {}
  -- DECOMPILER ERROR at PC38: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: No list found for R10 , SetList fails

  local l_8_11 = {}
  -- DECOMPILER ERROR at PC42: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC44: No list found for R11 , SetList fails

  local l_8_12 = {}
  -- DECOMPILER ERROR at PC46: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC48: No list found for R12 , SetList fails

  local l_8_13 = {}
  -- DECOMPILER ERROR at PC50: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC52: No list found for R13 , SetList fails

  local l_8_14 = {}
  -- DECOMPILER ERROR at PC54: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: No list found for R14 , SetList fails

  local l_8_15 = {}
  -- DECOMPILER ERROR at PC58: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC60: No list found for R15 , SetList fails

  local l_8_16 = {}
  -- DECOMPILER ERROR at PC62: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: No list found for R16 , SetList fails

  local l_8_17 = {}
  -- DECOMPILER ERROR at PC66: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: No list found for R17 , SetList fails

  local l_8_18 = {}
  -- DECOMPILER ERROR at PC70: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC72: No list found for R18 , SetList fails

  local l_8_19 = {}
  -- DECOMPILER ERROR at PC74: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC76: No list found for R19 , SetList fails

  local l_8_20 = {}
  -- DECOMPILER ERROR at PC78: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC80: No list found for R20 , SetList fails

  local l_8_21 = {}
  -- DECOMPILER ERROR at PC82: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: No list found for R21 , SetList fails

  local l_8_22 = {}
  -- DECOMPILER ERROR at PC86: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC88: No list found for R22 , SetList fails

  local l_8_23 = {}
  -- DECOMPILER ERROR at PC90: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC92: No list found for R23 , SetList fails

  local l_8_24 = {}
  -- DECOMPILER ERROR at PC94: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC96: No list found for R24 , SetList fails

  local l_8_25 = {}
  -- DECOMPILER ERROR at PC98: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC100: No list found for R25 , SetList fails

  local l_8_26 = {}
  -- DECOMPILER ERROR at PC102: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC104: No list found for R26 , SetList fails

  local l_8_27 = {}
  -- DECOMPILER ERROR at PC106: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: No list found for R27 , SetList fails

  local l_8_28 = {}
  -- DECOMPILER ERROR at PC110: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: No list found for R28 , SetList fails

  local l_8_29 = {}
  -- DECOMPILER ERROR at PC114: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: No list found for R29 , SetList fails

  local l_8_30 = {}
  -- DECOMPILER ERROR at PC118: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: No list found for R30 , SetList fails

  local l_8_31 = {}
  -- DECOMPILER ERROR at PC122: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: No list found for R31 , SetList fails

  local l_8_32 = {}
  -- DECOMPILER ERROR at PC126: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC128: No list found for R32 , SetList fails

  local l_8_33 = {}
  -- DECOMPILER ERROR at PC130: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: No list found for R33 , SetList fails

  local l_8_34 = {}
  -- DECOMPILER ERROR at PC134: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC136: No list found for R34 , SetList fails

  local l_8_35 = {}
  -- DECOMPILER ERROR at PC138: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: No list found for R35 , SetList fails

  local l_8_36 = {}
  -- DECOMPILER ERROR at PC142: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC144: No list found for R36 , SetList fails

  local l_8_37 = {}
  -- DECOMPILER ERROR at PC146: Overwrote pending register: R38 in 'AssignReg'

  -- DECOMPILER ERROR at PC148: No list found for R37 , SetList fails

  local l_8_38 = {}
  -- DECOMPILER ERROR at PC150: Overwrote pending register: R39 in 'AssignReg'

  -- DECOMPILER ERROR at PC152: No list found for R38 , SetList fails

  do
    local l_8_39 = {}
    -- DECOMPILER ERROR at PC154: Overwrote pending register: R40 in 'AssignReg'

    -- DECOMPILER ERROR at PC156: No list found for R39 , SetList fails

    -- DECOMPILER ERROR at PC157: No list found for R0 , SetList fails

    do return l_8_0 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

local l_0_8 = function(l_9_0)
  -- function num : 0_8
  local l_9_1 = math_floor(l_9_0 / 8)
  local l_9_2 = math_floor((l_9_0 - 8 * l_9_1) / 2)
  do
    local l_9_3 = {}
    -- DECOMPILER ERROR at PC11: No list found for R3 , SetList fails

    do return l_9_3 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

local l_0_9 = function(l_10_0, l_10_1, l_10_2)
  -- function num : 0_9
  local l_10_3, l_10_4 = pcall(MpCommon.TypoDistance, l_10_0, l_10_1)
  if l_10_3 and l_10_4 then
    return l_10_4
  end
  return 1000
end

local l_0_10 = function(l_11_0)
  -- function num : 0_10
  local l_11_1 = split(l_11_0, ".")
  for l_11_5,l_11_6 in ipairs(l_11_1) do
    l_11_1[l_11_5] = tonumber(l_11_6)
  end
  return l_11_1
end

local l_0_11 = function()
  -- function num : 0_11
  local l_12_0 = {}
  local l_12_1 = {}
  local l_12_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList"
  local l_12_3 = (sysio.RegOpenKey)(l_12_2)
  if l_12_3 then
    local l_12_4 = (sysio.RegEnumKeys)(l_12_3)
    if l_12_4 then
      for l_12_8,l_12_9 in ipairs(l_12_4) do
        local l_12_10 = (sysio.RegOpenKey)((string.format)("%s\\%s", l_12_2, l_12_9))
        if l_12_10 then
          local l_12_11 = (sysio.GetRegValueAsDword)(l_12_10, "FullProfile")
          if l_12_11 == 1 then
            if l_12_9 ~= "" and #trim(l_12_9) > 0 then
              l_12_9 = l_12_9:lower()
              l_12_0[l_12_9] = 1
              AppendToRollingQueue("localUsers", l_12_9, 1, 604800)
            end
            local l_12_12 = (sysio.GetRegValueAsString)(l_12_10, "ProfileImagePath")
            if l_12_12 then
              local l_12_13 = l_12_12:match("[^\\]+$")
              if l_12_13 and l_12_13 ~= "" and #trim(l_12_13) > 0 then
                l_12_13 = l_12_13:lower()
                l_12_1[l_12_13] = 1
                AppendToRollingQueue("localProfiles", l_12_13, 1, 604800)
              end
            end
          end
        end
      end
    end
  end
  do
    l_12_4 = l_12_0
    return l_12_4, l_12_1
  end
end

local l_0_12 = function()
  -- function num : 0_12
  do
    local l_13_0 = {}
    l_13_0["2fb5b8cc8c2180d80aedb449adaaa118431999a3"] = 0
    l_13_0.e2c28e74ecab690d701d0607f0fbbfaed5866b03 = 0
    l_13_0["5a87af4ff7b535b6bd8dede9904102e044febccb"] = 0
    l_13_0["3b4c664cc8dae08eed20c649d16cf7ddc91d4b8a"] = 0
    l_13_0["26a5d0b18940cf045ab8ff65a4041c55ea6e7484"] = 0
    do return l_13_0[scrubData((string.lower)((mp.GetMachineGUID)()))] ~= nil end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

local l_0_13 = function(l_14_0)
  -- function num : 0_13
  do return (l_14_0.LT == 3 or l_14_0.LT == 10 or l_14_0.LT == 11) and l_14_0.Ip ~= "-" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_14 = function(l_15_0)
  -- function num : 0_14
  do return l_15_0.LT == 2 end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_15 = function(l_16_0)
  -- function num : 0_15
  -- DECOMPILER ERROR at PC18: Unhandled construct in 'MakeBoolean' P3

  do return (l_16_0.SLId == 30000000 or l_16_0.SLId == 0) and l_16_0.LT ~= 3 and l_16_0.LT ~= 10 and l_16_0.TSid ~= "s-1-5-7" end
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

local l_0_16 = function(l_17_0)
  -- function num : 0_16
  AppendToRollingQueue("RDP-S-Ws", l_17_0, 1, 31104000, 1000)
end

local l_0_17 = function(l_18_0)
  -- function num : 0_17
  AppendToRollingQueue("RDP-S-IPs", l_18_0.Ip, 1, 31104000, 1000)
  AppendToRollingQueue("RDP-S-IP-Wsn", l_18_0.Ip .. "-" .. l_18_0.Wsn, 1, 31104000, 1000)
  AppendToRollingQueue("RDP-S-IP-User", l_18_0.Ip .. "-" .. l_18_0.TFUN, 1, 31104000, 1000)
end

local l_0_18 = function(l_19_0)
  -- function num : 0_18
  AppendToRollingQueue("RDP-S-User-Wsn", l_19_0.TFUN .. "-" .. l_19_0.Wsn, 1, 31104000, 1000)
end

local l_0_19 = function()
  -- function num : 0_19
  local l_20_0 = GetRollingQueueKeys
  local l_20_1 = "RDP-S-IPs"
  do return l_20_0(l_20_1) end
  -- DECOMPILER ERROR at PC4: Confused about usage of register R1 for local variables in 'ReleaseLocals'

end

local l_0_20 = function(l_21_0, l_21_1)
  -- function num : 0_20
  local l_21_2 = IsKeyInRollingQueue
  local l_21_3 = "RDP-S-IP-User"
  do
    local l_21_6 = l_21_0
    l_21_6 = l_21_6 .. "-" .. l_21_1
    local l_21_4 = nil
    l_21_4 = true
    local l_21_5 = nil
    do return l_21_2(l_21_3, l_21_6, l_21_4) end
    -- DECOMPILER ERROR at PC9: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_21 = function(l_22_0)
  -- function num : 0_21
  local l_22_1 = {}
  local l_22_2, l_22_3 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RDP-F-IP", l_22_0 .. "-")
  if l_22_2 and l_22_3 then
    for l_22_7,l_22_8 in ipairs(l_22_3) do
      (table.insert)(l_22_1, (string.sub)(l_22_8.key, #l_22_0 + 2))
    end
  end
  do
    return l_22_1
  end
end

local l_0_22 = function(l_23_0)
  -- function num : 0_22
  local l_23_1 = IsKeyInRollingQueue
  local l_23_2 = "RDP-S-Ws"
  local l_23_3 = l_23_0
  do
    local l_23_4 = true
    do return l_23_1(l_23_2, l_23_3, l_23_4) end
    -- DECOMPILER ERROR at PC6: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_23 = function(l_24_0, l_24_1)
  -- function num : 0_23
  local l_24_2 = IsKeyInRollingQueue
  local l_24_3 = "RDP-S-IP-Wsn"
  do
    local l_24_6 = l_24_1
    l_24_6 = l_24_6 .. "-" .. l_24_0
    local l_24_4 = nil
    l_24_4 = true
    local l_24_5 = nil
    do return l_24_2(l_24_3, l_24_6, l_24_4) end
    -- DECOMPILER ERROR at PC9: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_24 = function(l_25_0, l_25_1)
  -- function num : 0_24
  local l_25_2 = IsKeyInRollingQueue
  local l_25_3 = "RDP-S-User-Wsn"
  do
    local l_25_6 = l_25_1
    l_25_6 = l_25_6 .. "-" .. l_25_0
    local l_25_4 = nil
    l_25_4 = true
    local l_25_5 = nil
    do return l_25_2(l_25_3, l_25_6, l_25_4) end
    -- DECOMPILER ERROR at PC9: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_25 = function(l_26_0)
  -- function num : 0_25
  local l_26_1 = IsKeyInRollingQueue
  local l_26_2 = "RDP-S-IPs"
  local l_26_3 = l_26_0
  do
    local l_26_4 = true
    do return l_26_1(l_26_2, l_26_3, l_26_4) end
    -- DECOMPILER ERROR at PC6: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_26 = function(l_27_0, l_27_1, l_27_2, l_27_3, l_27_4)
  -- function num : 0_26
  if not l_27_3 then
    l_27_3 = 604800
  end
  if not l_27_4 then
    l_27_4 = 100
  end
  local l_27_5 = "DecayingCounter_" .. l_27_0
  local l_27_6 = l_27_1
  if l_27_2 then
    local l_27_7 = GetRollingQueue(l_27_5)
    do
      if l_27_7 == nil then
        local l_27_9, l_27_10 = pcall(MpCommon.RollingQueueCreate, l_27_5, l_27_4, l_27_3, 0)
        if not l_27_9 then
          return nil
        end
      end
      do
        local l_27_8 = MpCommon.RollingQueueSumOfValues
        l_27_8 = l_27_8(l_27_5)
        if l_27_8 then
          l_27_6 = l_27_8.sum + l_27_1
        end
        AppendToRollingQueue(l_27_5, l_27_0, l_27_1, l_27_3, l_27_4, 0)
        do
          local l_27_11, l_27_12 = pcall(MpCommon.AtomicCounterAdd, l_27_5, l_27_1)
          if not l_27_11 then
            (MpCommon.AtomicCounterSet)(l_27_5, l_27_1, l_27_3, 10, 1, 0)
          else
            l_27_6 = l_27_1 + l_27_12
          end
          return l_27_6
        end
      end
    end
  end
end

local l_0_27 = function(l_28_0, l_28_1, l_28_2, l_28_3, l_28_4)
  -- function num : 0_27
  if not l_28_2 then
    l_28_2 = 1
  end
  if not l_28_3 then
    l_28_3 = 604800
  end
  if not l_28_4 then
    l_28_4 = 100
  end
  local l_28_5, l_28_6 = pcall(MpCommon.RollingQueueQueryKey, l_28_0, l_28_1)
  if l_28_5 and l_28_6 then
    l_28_2 = l_28_6.value + l_28_2
  end
  AppendToRollingQueue(l_28_0, l_28_1, l_28_2, l_28_3, l_28_4, 1)
  return l_28_2
end

local l_0_28 = function()
  -- function num : 0_28
  local l_29_0 = "BruteForceProtectionCookieV3"
  do
    if not GetAtomicCounter(l_29_0) then
      local l_29_1, l_29_2 = (MpCommon.GetCurrentTimeT)()
      l_29_2 = pcall
      l_29_2(MpCommon.AtomicCounterSet, l_29_0, l_29_1, 3110400000)
    end
    -- DECOMPILER ERROR at PC26: Confused about usage of register: R1 in 'UnsetPending'

    if GetRollingQueueKeyValue("RDP-Successful-Counter", "counter") and (MpCommon.GetCurrentTimeT)() - l_29_1 > 1209600 then
      return true
    end
    return false
  end
end

local l_0_29 = function()
  -- function num : 0_29
  local l_30_0 = {}
  l_30_0.status = 0
  l_30_0.learning_mode = true
  l_30_0.block_local_ip = false
  local l_30_1, l_30_2 = nil, nil
  if MpCommon.GetBehavioralNetworkBlocksSettings then
    l_30_1 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, 1)
  end
  if l_30_1 and l_30_2 then
    if l_30_2.State then
      l_30_0.status = l_30_2.State
    else
      l_30_0.status = 0
    end
    if l_30_2.Exclusions then
      l_30_0.ip_exclusion_list = l_30_2.Exclusions
    end
    if l_30_2.MaxTimeout then
      l_30_0.MaxTimeout = l_30_2.MaxTimeout
    end
    if l_30_2.AggressiveLevel then
      l_30_0.AggressiveLevel = l_30_2.AggressiveLevel
    end
    if l_30_2.Plugins then
      l_30_0.Plugins = l_30_2.Plugins
      if l_30_0.Plugins then
        if (mp.bitand)(l_30_0.Plugins, 2) == 2 then
          l_30_0.learning_mode = false
        end
        if (mp.bitand)(l_30_0.Plugins, 1) == 1 then
          l_30_0.block_local_ip = true
        end
      end
    end
  end
  if l_30_0.ip_exclusion_list then
    l_30_0.ip_exclusion_list = split(l_30_0.ip_exclusion_list, ",")
  end
  return l_30_0
end

local l_0_30 = function(l_31_0, l_31_1, l_31_2)
  -- function num : 0_30
  if not l_31_1 then
    l_31_1 = {}
  end
  if not l_31_2 then
    l_31_2 = ""
  end
  local l_31_3 = (sysio.RegOpenKey)(l_31_0)
  if l_31_3 then
    local l_31_4 = (sysio.RegEnumValues)(l_31_3)
    if l_31_4 then
      for l_31_8,l_31_9 in pairs(l_31_4) do
        if not l_31_1[l_31_9] then
          l_31_1[l_31_9] = 0
          l_31_2 = l_31_2 .. "," .. l_31_9
        end
      end
    end
  end
  do
    l_31_4 = l_31_1
    return l_31_4, l_31_2
  end
end

local l_0_31 = function(l_32_0)
  -- function num : 0_31
  local l_32_1 = scrubData(l_32_0)
  l_32_1 = "F0000" .. (string.sub)(l_32_1, 6)
  local l_32_2 = 220
  local l_32_3, l_32_4 = (MpCommon.SNidSearch)(l_32_2, l_32_1)
  if l_32_3 and l_32_4 then
    l_32_4 = (string.sub)(l_32_4, 3)
    l_32_4 = (MpCommon.Base64Decode)(l_32_4)
    for l_32_8,l_32_9,l_32_10 in l_32_4:gmatch("I=(%d+)|V=(%d+)|S=(%d+)") do
      do return true, tonumber(l_32_8), tonumber(l_32_9), tonumber(l_32_10) end
    end
  end
  do
    return false, 0, 0, 0
  end
end

local l_0_32 = function(l_33_0)
  -- function num : 0_32
  local l_33_1 = scrubData(l_33_0)
  l_33_1 = "00000" .. (string.sub)(l_33_1, 6)
  local l_33_2 = 220
  local l_33_3, l_33_4 = (MpCommon.SNidSearch)(l_33_2, l_33_1)
  if l_33_3 and l_33_4 then
    l_33_4 = (string.sub)(l_33_4, 3)
    l_33_4 = (MpCommon.Base64Decode)(l_33_4)
    for l_33_8,l_33_9,l_33_10 in l_33_4:gmatch("I=(%d+)|V=(%d+)|S=(%d+)") do
      do return true, tonumber(l_33_8), tonumber(l_33_9), tonumber(l_33_10) end
    end
  end
  do
    return false, 0, 0, 0
  end
end

local l_0_33 = function(l_34_0)
  -- function num : 0_33
  local l_34_1 = {}
  local l_34_2 = 0
  local l_34_3 = tonumber(GetRollingQueueKeyValue("RDP_Ip", l_34_0.Ip))
  local l_34_4 = tonumber(GetRollingQueueKeyValue("RDP_Usr", l_34_0.TFUN))
  do
    if l_34_3 then
      local l_34_5 = tonumber(l_34_3)
      if l_34_5 and l_34_5 >= 100 then
        l_34_2 = 1
      end
    end
    local l_34_6 = {}
    l_34_6.IpScore = l_34_3
    l_34_6.UserScore = l_34_4
    l_34_6.case = l_34_2
    return l_34_2, l_34_6
  end
end

local l_0_34 = function(l_35_0, l_35_1)
  -- function num : 0_34
  if not l_35_1 then
    l_35_1 = 7200
  end
  if GetRollingQueueCount("FW-IPs") == 500 then
    AppendToRollingQueue("FW-IPs-Extended", l_35_0, 1, l_35_1, 1000)
  else
    AppendToRollingQueue("FW-IPs", l_35_0, 1, l_35_1, 500)
  end
end

local l_0_35 = function(l_36_0)
  -- function num : 0_35
  if not IsKeyInRollingQueue("FW-IPs", l_36_0, true) then
    return IsKeyInRollingQueue("FW-IPs-Extended", l_36_0, true)
  end
end

local l_0_36 = function(l_37_0)
  -- function num : 0_36
  AppendToRollingQueue("RDP-S-User", l_37_0, tostring((MpCommon.GetCurrentTimeT)()), 31104000, 100)
end

local l_0_37 = function(l_38_0)
  -- function num : 0_37
  local l_38_1 = GetRollingQueueKeyValue
  local l_38_2 = "RDP-S-User"
  do
    local l_38_3 = l_38_0
    do return l_38_1(l_38_2, l_38_3) end
    -- DECOMPILER ERROR at PC5: Confused about usage of register R2 for local variables in 'ReleaseLocals'

  end
end

local l_0_38 = function()
  -- function num : 0_38
  local l_39_0 = {}
  -- DECOMPILER ERROR at PC20: No list found for R0 , SetList fails

  local l_39_1 = {}
  -- DECOMPILER ERROR at PC22: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC23: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC24: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC25: No list found for R1 , SetList fails

  local l_39_2 = {}
  -- DECOMPILER ERROR at PC27: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC28: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC29: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

  for l_39_6,l_39_7 in ("RDP-S-User-Wsn")("RDP-S-IPs") do
    -- DECOMPILER ERROR at PC35: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC36: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC38: Overwrote pending register: R10 in 'AssignReg'

    ("RDP-Ip-Failed-Counter")(("RDP-IP-Failed-Counter").RollingQueueErase, "RDP-F-User")
  end
  for l_39_11,l_39_12 in ipairs(l_39_1) do
    pcall(MpCommon.AtomicCounterErase, l_39_12)
  end
  for l_39_16,l_39_17 in ipairs(l_39_2) do
    -- DECOMPILER ERROR at PC62: Overwrote pending register: R12 in 'AssignReg'

    pcall(MpCommon.OverwritePersistContextNoPath, l_39_17, {}, "RDP_Ip")
  end
  -- WARNING: undefined locals caused missing assignments!
end

local l_0_39 = function(l_40_0, l_40_1, l_40_2)
  -- function num : 0_39
  l_40_0 = tonumber(l_40_0)
  l_40_1 = tonumber(l_40_1)
  l_40_2 = tonumber(l_40_2)
  if l_40_0 and l_40_1 and l_40_2 and l_40_0 > 1900 and l_40_0 < 2040 and l_40_1 > 0 and l_40_1 <= 12 and l_40_2 > 0 and l_40_2 <= 31 then
    return true
  end
  return false
end

local l_0_40 = function()
  -- function num : 0_40
  local l_41_0, l_41_1 = pcall(bm.get_current_process_startup_info)
  if not l_41_0 or not l_41_1 then
    return 
  end
  return l_41_1.ppid
end

local l_0_41 = function()
  -- function num : 0_41
  local l_42_0, l_42_1 = pcall(bm.get_imagepath)
  if not l_42_0 or not l_42_1 then
    return 
  end
  local l_42_2 = string.match
  local l_42_3 = l_42_1
  do
    local l_42_4 = "([^\\]+)$"
    do return l_42_2(l_42_3, l_42_4) end
    -- DECOMPILER ERROR at PC15: Confused about usage of register R3 for local variables in 'ReleaseLocals'

  end
end

local l_0_42 = function()
  -- function num : 0_42
  local l_43_0 = {}
  do
    local l_43_4 = function(l_44_0)
    -- function num : 0_42_0 , upvalues : l_43_0, l_43_1
    -- DECOMPILER ERROR at PC9: Confused about usage of register: R1 in 'UnsetPending'

    if l_43_0[l_44_0] ~= l_44_0 then
      l_43_0[l_44_0] = l_43_1(l_43_0[l_44_0])
    end
    return l_43_0[l_44_0]
  end

    do return {find = l_43_4, union = function(l_46_0, l_46_1)
    -- function num : 0_42_2 , upvalues : l_43_2, l_43_1, l_43_0
    l_43_2(l_46_0)
    l_43_2(l_46_1)
    local l_46_2 = l_43_1(l_46_0)
    local l_46_3 = l_43_1(l_46_1)
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R4 in 'UnsetPending'

    if l_46_2 ~= l_46_3 then
      l_43_0[l_46_3] = l_46_2
    end
  end
, ensure = function(l_45_0)
    -- function num : 0_42_1 , upvalues : l_43_0
    -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

    l_43_0[l_45_0] = l_43_0[l_45_0] or l_45_0
  end
} end
    -- DECOMPILER ERROR at PC15: freeLocal<0 in 'ReleaseLocals'

  end
end

local l_0_43 = function(l_44_0)
  -- function num : 0_43
  local l_44_1, l_44_2 = (string.find)(l_44_0, "://", 1, true)
  local l_44_3 = l_44_0
  if l_44_1 and l_44_2 then
    l_44_3 = (string.sub)(l_44_0, l_44_2 + 1)
  end
  l_44_1 = (string.find)(l_44_3, "/", 1, true)
  if l_44_1 then
    l_44_3 = (string.sub)(l_44_3, 1, l_44_1 - 1)
  end
  return (string.match)(l_44_3, "[%.%w%d-]+")
end

do
  local l_0_64 = function()
  -- function num : 0_44 , upvalues : l_0_1
  local l_45_0 = (bm.get_current_process_startup_info)()
  if l_45_0 == nil then
    return {}
  end
  local l_45_1 = {}
  l_45_1.User = {}
  l_45_1.Session = {}
  local l_45_2 = {}
  l_45_2.UserName = MpCommon.WTSUserName
  l_45_2.Domain = MpCommon.WTSDomainName
  local l_45_3 = {}
  l_45_3.ClientIP = MpCommon.WTSClientAddress
  l_45_3.ClientName = MpCommon.WTSClientName
  l_45_3.WinStationName = MpCommon.WTSWinStationName
  l_45_3.Id = MpCommon.WTSSessionId
  l_45_3.ClientBuildNumber = MpCommon.WTSClientBuildNumber
  l_45_3.ClientProductId = MpCommon.WTSClientProductId
  l_45_3.ClientProtocolType = MpCommon.WTSClientProtocolType
  l_45_3.ClientConnectState = MpCommon.WTSConnectState
  l_45_3.ClientInfo = MpCommon.WTSClientInfo
  l_45_3.ClientSessionInfo = MpCommon.WTSSessionInfo
  l_45_3.ConfigInfo = MpCommon.WTSConfigInfo
  l_45_3.IsRemoteSession = MpCommon.WTSIsRemoteSession
  l_45_1.User = querySessionInformation(l_45_0.ppid, l_45_2)
  l_45_1.Session = querySessionInformation(l_45_0.ppid, l_45_3)
  if l_45_1.User and l_45_1.Session then
    local l_45_4 = {}
    -- DECOMPILER ERROR at PC81: No list found for R4 , SetList fails

    -- DECOMPILER ERROR at PC82: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC87: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC96: Confused about usage of register: R5 in 'UnsetPending'

    if ((l_45_1.User).UserName).ClientIP ~= nil and type(((l_45_1.User).Domain).ClientIP) == "table" then
      local l_45_5 = ""
      local l_45_6 = false
      -- DECOMPILER ERROR at PC99: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC100: Overwrote pending register: R8 in 'AssignReg'

      l_45_6 = ((l_45_1.Session).ClientName)(((l_45_1.Session).WinStationName).GetUserAccountInfo, (l_45_1.User).Domain, (l_45_1.User).UserName)
      if l_45_6 and l_45_5 then
        l_45_5.Name = scrubData(l_45_5.Name)
        -- DECOMPILER ERROR at PC118: Confused about usage of register: R7 in 'UnsetPending'

        ;
        (l_45_1.User).Info = l_45_5
        -- DECOMPILER ERROR at PC127: Confused about usage of register: R7 in 'UnsetPending'

        ;
        ((l_45_1.User).Info).HomeDir = l_0_1(((l_45_1.User).Info).HomeDir, l_45_4)
        -- DECOMPILER ERROR at PC136: Confused about usage of register: R7 in 'UnsetPending'

        ;
        ((l_45_1.User).Info).ProfilePath = l_0_1(((l_45_1.User).Info).ProfilePath, l_45_4)
      end
      -- DECOMPILER ERROR at PC145: Overwrote pending register: R5 in 'AssignReg'

      l_45_6 = pcall(MpCommon.GetUserAccountGroups, (l_45_1.User).Domain, (l_45_1.User).UserName)
      -- DECOMPILER ERROR at PC153: Confused about usage of register: R7 in 'UnsetPending'

      if l_45_6 and l_45_5 then
        (l_45_1.User).Groups = {}
        for l_45_10,l_45_11 in ipairs(l_45_5) do
          (table.insert)((l_45_1.User).Groups, scrubData(l_45_11.Name))
        end
      end
      do
        do
          -- DECOMPILER ERROR at PC173: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (l_45_1.User).UserName = scrubData((l_45_1.User).UserName)
          -- DECOMPILER ERROR at PC179: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (l_45_1.User).Domain = scrubData((l_45_1.User).Domain)
          -- DECOMPILER ERROR at PC185: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (l_45_1.Session).ClientName = scrubData((l_45_1.Session).ClientName)
          -- DECOMPILER ERROR at PC191: Confused about usage of register: R7 in 'UnsetPending'

          ;
          (l_45_1.Session).WinStationName = scrubData((l_45_1.Session).WinStationName)
          -- DECOMPILER ERROR at PC209: Confused about usage of register: R7 in 'UnsetPending'

          if (l_45_1.Session).ConfigInfo and type((l_45_1.Session).ConfigInfo) ~= "string" then
            ((l_45_1.Session).ConfigInfo).LogonDomain = scrubData(((l_45_1.Session).ConfigInfo).LogonDomain)
            -- DECOMPILER ERROR at PC217: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((l_45_1.Session).ConfigInfo).LogonUserName = scrubData(((l_45_1.Session).ConfigInfo).LogonUserName)
            -- DECOMPILER ERROR at PC226: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((l_45_1.Session).ConfigInfo).InitialProgram = l_0_1(((l_45_1.Session).ConfigInfo).InitialProgram, l_45_4)
            -- DECOMPILER ERROR at PC235: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((l_45_1.Session).ConfigInfo).WorkDirectory = l_0_1(((l_45_1.Session).ConfigInfo).WorkDirectory, l_45_4)
          end
          -- DECOMPILER ERROR at PC254: Confused about usage of register: R7 in 'UnsetPending'

          if (l_45_1.Session).ClientInfo and type((l_45_1.Session).ClientInfo) ~= "string" then
            ((l_45_1.Session).ClientInfo).InitialProgram = l_0_1(((l_45_1.Session).ClientInfo).InitialProgram, l_45_4)
            -- DECOMPILER ERROR at PC263: Confused about usage of register: R7 in 'UnsetPending'

            ;
            ((l_45_1.Session).ClientInfo).WorkDirectory = l_0_1(((l_45_1.Session).ClientInfo).WorkDirectory, l_45_4)
          end
          return l_45_1
        end
      end
    end
  end
end

  -- DECOMPILER ERROR at PC481: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

