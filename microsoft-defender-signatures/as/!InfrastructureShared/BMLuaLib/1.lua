-- Threat: !InfrastructureShared
-- Name: BMLuaLib
-- Type: 1
-- Includes: LuaFuncHelper, TechniqueTracker

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

-- [unluac error] diagnostic pseudocode: recovery errors; output may not recompile or preserve behavior

local function r0_0(p1_0)
  if p1_0 ~= nil and type(p1_0) == "table" then
    local r1_0, r1_1 = bm.get_process_relationships()
    for r1_2, r1_3 in ipairs(r1_0) do
      if r1_3.image_path ~= nil then
        local r1_4 = r1_3.image_path
        r1_4 = r1_4:match("\\([^\\]+)$")
        if p1_0[r1_4] or p1_0[string.lower(r1_4)] then
          return true
        end
      end
    end
  end
  return false
end

local function r0_1(p2_0, p2_1)
  if p2_0 ~= nil and p2_1 ~= nil and next(p2_1) ~= nil then
    local r2_0 = p2_0
    for r2_1, r2_2 in ipairs(p2_1) do
      if r2_2 ~= nil and r2_2 ~= "" then
        local r2_3 = scrubData(r2_2)
        if string.find(p2_0, r2_2) ~= nil then
          r2_0 = string.gsub(r2_0, r2_2, r2_3)
        end
      end
    end
    return r2_0
  end
  return nil
end

local function r0_2(p3_0)
  local r3_0, r3_1 = pcall(mp.GetUrlReputation, { p3_0 }, { TAG = "NOLOOKUP" })
  if r3_0 and r3_1 then
    local r3_2 = r3_1.urls
    for r3_3, r3_4 in ipairs(r3_2) do
      if r3_4.determination == 2 then
        local r3_5 = r3_4.urlresponsecontext
        if r3_5 then
          local r3_6 = ""
          for r3_7, r3_8 in ipairs(r3_5) do
            local r3_9 = r3_8.key
            local r3_10 = r3_8.value
            if r3_9 == "MaceFamily" then
              r3_6 = string.lower(r3_10)
              break
            end
          end
          if r3_6 ~= "" then
            return true, r3_6, r3_4.confidence
          end
        end
      end
    end
  end
  return false, nil, nil
end

local function r0_3(p4_0, p4_1)
  if type(p4_0) == "string" and type(p4_1) == "table" then
    for r4_0, r4_1 in pairs(p4_1) do
      if type(r4_1) == "string" and string.len(r4_1) == 1 then
        p4_0 = string.gsub(p4_0, "'%s*%" .. r4_1 .. "%s*'", "")
        p4_0 = string.gsub(p4_0, '"%s*%' .. r4_1 .. '%s*"', "")
      end
    end
    return p4_0
  end
  return p4_0
end

local function r0_4(p5_0, p5_1)
  local r5_0 = {
    [0] = {
      "yur", "tox", "how", "your", "motd", "more", "help", "desk", "where", "vault", "leame",
      "文件解密帮助", "пароль", "unlock", "ransom", "readme", "please", "locked", "warning", "restore",
      "recover", "rec0ver", "payment", "install", "h_e_l_p", "encrypt", "decrypt", "crjoker",
      "rarvault", "mensagem", "fs0ciety", "de-crypt", "criptoso", "beni oku", "_what_is",
      "zino_note", "wallpaper", "infection", "attention", "important!"
    },
    [1] = {
      "files_back", "dummy_file", "decryptage", "dale_files", "chip_files", "прочти_менѝ",
      "instruction", "getyoufiles", "enigma_encr", "_descifrado", "yougothacked", "shtodelatvam",
      "saving grace", "你的檔案被我們加密啦!!!", "thxforyurtyme", "desktoposiris", "buyunlockcode",
      "take_seriously", "me-enced-files", "instructionaga", "read-for-hellpp", "de_crypt_readme",
      "we-must-dec-files", "allfilesarelocked", "@_use_to_fix_jjny", "!!!!!atenção!!!!!",
      "try-read-me-to-dec", "desifrovani_pokyny", "leer_inmediatamente", "check-it-help-files",
      "sifre_cozme_talimati", "let-me-try-dec-files", "_files_are_encrypted",
      "whathappendtoyourfiles", "merry_i_love_you_bruce", "entschlusseln_hinweise",
      "no-problem-we-dec-files", "istruzioni_decrittazione", "как раѝшифровать файлы!!!",
      "oksowathappendtoyourfiles", "000-if-you-want-dec-files", "ontsleutelings_instructies",
      "nomoreransom_note_original", "if_want_files_back_pls_read", "comment débloquer mes fichiers",
      "recupere seus arquivos. leia-me!", "dosyalariniza ulaşmak İçİn açiniz",
      "wie_zum_wiederherstellen_von_dateien", "_adatok_visszaallitasahoz_utasitasok",
      "como descriptografar os seus arquivos"
    }
  }
  if p5_0 ~= nil and p5_0 ~= "" and r5_0[p5_1] ~= nil then
    local r5_1, r5_2, r5_3 = p5_0:match("[^>](.-)([^\\/]-%.?([^%.\\/]*))$")
    if r5_2 == nil then
      return nil
    end
    for r5_4, r5_5 in ipairs(r5_0[p5_1]) do
      if string.find(r5_2:lower(), r5_5, 1, true) then
        return true
      end
    end
    return false
  end
  return nil
end

local function r0_5(p6_0, p6_1, p6_2, p6_3)
  if p6_0 == nil or p6_0 == "" or p6_1 == nil or p6_1 == "" then
    return
  end
  local r6_0, r6_1 = string.match(p6_0, "pid:(%w+),ProcessStart:(%w+)")
  if r6_0 ~= nil and r6_1 ~= nil then
    local r6_2 = string.lower
    local r6_3 = r6_0
    local r6_4 = "_"
    local r6_5 = r6_1
    local r6_6, r6_7 = "_", p6_1
    r6_3 = r6_3 .. r6_4 .. r6_5 .. r6_6 .. r6_7
    r6_5 = nil
    r6_7 = nil
    r6_2 = r6_2(r6_3)
    p6_3 = p6_3 == 0 and 3600 or p6_3
    if #p6_2 > 0 then
      MpCommon.SetPersistContextNoPath(r6_2, p6_2, p6_3)
    end
  end
end

local function r0_6(p7_0, p7_1)
  if p7_0 == nil or p7_0 == "" or p7_1 == nil or p7_1 == "" then
    return
  end
  local r7_0, r7_1 = string.match(p7_0, "pid:(%w+),ProcessStart:(%w+)")
  if r7_0 ~= nil and r7_1 ~= nil then
    local r7_2 = string.lower
    local r7_3 = r7_0
    local r7_4 = "_"
    local r7_5 = r7_1
    local r7_6, r7_7 = "_", p7_1
    r7_3 = r7_3 .. r7_4 .. r7_5 .. r7_6 .. r7_7
    r7_5 = nil
    r7_7 = nil
    r7_2 = r7_2(r7_3)
    if MpCommon.GetPersistContextCountNoPath(r7_2) > 0 then
      local r7_8 = MpCommon.GetPersistContextNoPath
      local r7_9 = r7_2
      return r7_8(r7_9)
    end
  end
end

local function r0_7()
  return {
    { "/usr/bin/python", "/usr/bin/python /bin/yum" },
    { "/usr/bin/python", "/usr/bin/python /usr/bin/yum" },
    { "/usr/bin/python", "/usr/bin/python3 /bin/yum" },
    { "/usr/bin/python", "/usr/bin/python3 /usr/bin/yum" },
    { "/usr/libexec/platform-python", "/usr/libexec/platform-python /bin/yum" },
    { "/usr/libexec/platform-python", "/usr/libexec/platform-python /usr/bin/dnf" },
    { "/usr/libexec/platform-python", "/usr/libexec/platform-python /usr/bin/yum" },
    { "/usr/libexec/platform-python", "" }, { "/usr/bin/dpkg", "" }, { "/bin/rpm", "" },
    { "/usr/bin/rpm", "" }, { "/usr/bin/rpmkeys", "--checksig --root" },
    { "/usr/bin/bash", "/var/tmp/rpm-tmp." }, { "/bin/bash", "/var/tmp/rpm-tmp." },
    { "/usr/bin/sh", "/var/tmp/rpm-tmp." }, { "/bin/sh", "/var/tmp/rpm-tmp." },
    { "/usr/bin/python", "/usr/bin/dnf" }, { "/usr/bin/python", "/bin/dnf" },
    { "/usr/bin/python", "/bin/convert2rhel" }, { "/usr/bin/python", "/usr/bin/python /bin/dnf" },
    { "/usr/bin/python", "/usr/bin/python3 /bin/dnf" }, { "/usr/bin/python", "/usr/bin/pip" },
    { "", "pip install" }, { "", "/bin/pip list" }, { "", "/yum" }, { "", "/.ansible/" },
    { "", "AnsiballZ_dnf" }, { "/usr/libexec/platform-python", "/usr/bin/pip" },
    { "", "/usr/libexec/platform-python --" }, { "", "/usr/libexec/platform-python /usr/bin/dnf" },
    { "", "/usr/libexec/platform-python /bin/dnf" }, { "", "/usr/sbin/rhn_check" },
    { "", "/usr/sbin/osad --pid-file" }, { "", "/bin/etckeeper pre-install" },
    { "/usr/lib/snapd/snapd", "" }, { "/usr/bin/apt", "" }, { "/usr/bin/apt-get", "" },
    { "/usr/bin/pacman", "" }, { "/sbin/apk", "" }, { "/usr/bin/apk", "" },
    { "/bin/bash", "/var/lib/dpkg/info/" }, { "/bin/sh", "/var/lib/dpkg/info/" },
    { "/usr/bin/python", "/usr/bin/dpkg" },
    { "/usr/bin/python", "/usr/bin/python3 /usr/bin/unattended-upgrade" },
    { "", "unattended-upgrade" }, { "", "dnf-automatic" }, { "/usr/bin/node", "install" },
    { "/bin/node", "npm" }, { "/usr/lib/dracut/dracut-install", "" },
    { "/usr/sbin/hardlink", "/sbin/dracut -f /boot/initramfs" }, { "/usr/bin/zypper", "install" },
    { "/usr/bin/zypper", "remove" }, { "/usr/bin/zypper", "refresh" },
    { "/usr/bin/zypper", "verify" }, { "/usr/bin/zypper", "update" },
    { "/usr/bin/zypper", "upgrade" }, { "/usr/bin/zypper", "patch" },
    { "/usr/bin/python ", "/usr/bin/needs-restarting" }, { "/usr/bin/openssl", "openssl ca" },
    { "", "/usr/local/sbin/sysconfig -all" }, { "/usr/bin/tdnf", "" }, { "/usr/bin/microdnf", "" },
    { "/usr/bin/dnf5", "" }, { "", "convert-usrmerge" }, { "", "convert2rhel" },
    { "", "/usr/bin/dnf-automatic" }, { "", "/var/tmp/rpm-tmp." },
    { "", "rpmkeys --checksig --root" }, { "/usr/libexec/packagekitd", "" }
  }
end

local function r0_8(p9_0)
  local r9_0 = math_floor(p9_0 / 8)
  local r9_1 = math_floor((p9_0 - 8 * r9_0) / 2)
  return { r9_0, r9_1 }
end

local function r0_9(p10_0, p10_1, p10_2)
  local r10_0, r10_1 = pcall(MpCommon.TypoDistance, p10_0, p10_1)
  if r10_0 and r10_1 then
    return r10_1
  end
  return 1000
end

local function r0_10(p11_0)
  local r11_0 = split(p11_0, ".")
  for r11_1, r11_2 in ipairs(r11_0) do
    r11_0[r11_1] = tonumber(r11_2)
  end
  return r11_0
end

local function r0_11()
  local r12_0 = {}
  local r12_1 = {}
  local r12_2 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\ProfileList"
  local r12_3 = sysio.RegOpenKey(r12_2)
  if r12_3 then
    local r12_4 = sysio.RegEnumKeys(r12_3)
    if r12_4 then
      for r12_5, r12_6 in ipairs(r12_4) do
        local r12_7 = sysio.RegOpenKey(string.format("%s\\%s", r12_2, r12_6))
        if r12_7 and sysio.GetRegValueAsDword(r12_7, "FullProfile") == 1 then
          if r12_6 ~= "" and #trim(r12_6) > 0 then
            local r12_8 = r12_6:lower()
            r12_6 = r12_8
            r12_0[r12_6] = 1
            r12_8 = AppendToRollingQueue
            r12_8("localUsers", r12_6, 1, 604800)
          end
          local r12_9 = sysio.GetRegValueAsString(r12_7, "ProfileImagePath")
          if r12_9 then
            local r12_10 = r12_9:match("[^\\]+$")
            if r12_10 and r12_10 ~= "" and #trim(r12_10) > 0 then
              r12_10 = r12_10:lower()
              r12_1[r12_10] = 1
              AppendToRollingQueue("localProfiles", r12_10, 1, 604800)
            end
          end
        end
      end
    end
  end
  return r12_0, r12_1
end

local function r0_12()
  local r13_0 = {
    ["2fb5b8cc8c2180d80aedb449adaaa118431999a3"] = 0, e2c28e74ecab690d701d0607f0fbbfaed5866b03 = 0,
    ["5a87af4ff7b535b6bd8dede9904102e044febccb"] = 0,
    ["3b4c664cc8dae08eed20c649d16cf7ddc91d4b8a"] = 0,
    ["26a5d0b18940cf045ab8ff65a4041c55ea6e7484"] = 0
  }
  local r13_1 = scrubData(string.lower(mp.GetMachineGUID()))
  r13_1 = r13_0[r13_1] ~= nil
  return r13_1
end

local function r0_13(p14_0)
  return (p14_0.LT == 3 or p14_0.LT == 10 or p14_0.LT == 11) and p14_0.Ip ~= "-"
end

local function r0_14(p15_0)
  return p15_0.LT == 2
end

local function r0_15(p16_0)
  return (p16_0.SLId == 30000000 or p16_0.SLId == 0)
    and (p16_0.LT == 3 or p16_0.LT == 10 or p16_0.LT == 11)
    and p16_0.TSid ~= "s-1-5-7"
end

local function r0_16(p17_0)
  AppendToRollingQueue("RDP-S-Ws", p17_0, 1, 31104000, 1000)
end

local function r0_17(p18_0)
  AppendToRollingQueue("RDP-S-IPs", p18_0.Ip, 1, 31104000, 1000)
  AppendToRollingQueue("RDP-S-IP-Wsn", p18_0.Ip .. "-" .. p18_0.Wsn, 1, 31104000, 1000)
  AppendToRollingQueue("RDP-S-IP-User", p18_0.Ip .. "-" .. p18_0.TFUN, 1, 31104000, 1000)
end

local function r0_18(p19_0)
  AppendToRollingQueue("RDP-S-User-Wsn", p19_0.TFUN .. "-" .. p19_0.Wsn, 1, 31104000, 1000)
end

local function r0_19()
  return GetRollingQueueKeys("RDP-S-IPs")
end

local function r0_20(p21_0, p21_1)
  return IsKeyInRollingQueue("RDP-S-IP-User", p21_0 .. "-" .. p21_1, true)
end

local function r0_21(p22_0)
  local r22_0 = {}
  local r22_1, r22_2 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RDP-F-IP", p22_0 .. "-")
  if r22_1 and r22_2 then
    for r22_3, r22_4 in ipairs(r22_2) do
      table.insert(r22_0, string.sub(r22_4.key, #p22_0 + 2))
    end
  end
  return r22_0
end

local function r0_22(p23_0)
  return IsKeyInRollingQueue("RDP-S-Ws", p23_0, true)
end

local function r0_23(p24_0, p24_1)
  return IsKeyInRollingQueue("RDP-S-IP-Wsn", p24_1 .. "-" .. p24_0, true)
end

local function r0_24(p25_0, p25_1)
  return IsKeyInRollingQueue("RDP-S-User-Wsn", p25_1 .. "-" .. p25_0, true)
end

local function r0_25(p26_0)
  return IsKeyInRollingQueue("RDP-S-IPs", p26_0, true)
end

local function r0_26(p27_0, p27_1, p27_2, p27_3, p27_4)
  p27_3 = p27_3 or 604800
  p27_4 = p27_4 or 100
  local r27_0 = "DecayingCounter_" .. p27_0
  local r27_1 = p27_1
  if p27_2 then
    local r27_2 = GetRollingQueue(r27_0)
    if r27_2 == nil then
      local r27_3 = pcall(MpCommon.RollingQueueCreate, r27_0, p27_4, p27_3, 0)
      if not r27_3 then
        return nil
      end
    end
    local r27_4 = MpCommon.RollingQueueSumOfValues(r27_0)
    if r27_4 then
      r27_1 = r27_4.sum + p27_1
    end
    AppendToRollingQueue(r27_0, p27_0, p27_1, p27_3, p27_4, 0)
  else
    local r27_5, r27_6 = pcall(MpCommon.AtomicCounterAdd, r27_0, p27_1)
    if r27_5 then
      r27_1 = p27_1 + r27_6
    else
      MpCommon.AtomicCounterSet(r27_0, p27_1, p27_3, 10, 1, 0)
    end
  end
  return r27_1
end

local function r0_27(p28_0, p28_1, p28_2, p28_3, p28_4)
  p28_2 = p28_2 or 1
  p28_3 = p28_3 or 604800
  p28_4 = p28_4 or 100
  local r28_0, r28_1 = pcall(MpCommon.RollingQueueQueryKey, p28_0, p28_1)
  if r28_0 and r28_1 then
    p28_2 = r28_1.value + p28_2
  end
  AppendToRollingQueue(p28_0, p28_1, p28_2, p28_3, p28_4, 1)
  return p28_2
end

local function r0_28()
  local r29_0 = "BruteForceProtectionCookieV3"
  local r29_1 = GetAtomicCounter(r29_0)
  if not r29_1 then
    r29_1 = MpCommon.GetCurrentTimeT()
    pcall(MpCommon.AtomicCounterSet, r29_0, r29_1, 3110400000)
  end
  if GetRollingQueueKeyValue("RDP-Successful-Counter", "counter")
    and MpCommon.GetCurrentTimeT() - r29_1 > 1209600 then
    return true
  end
  return false
end

local function r0_29()
  local r30_0 = { status = 0, learning_mode = true, block_local_ip = false }
  local r30_1, r30_2 = nil, nil
  if MpCommon.GetBehavioralNetworkBlocksSettings then
    r30_1, r30_2 = pcall(MpCommon.GetBehavioralNetworkBlocksSettings, 1)
  end
  if r30_1 and r30_2 then
    if r30_2.State then
      r30_0.status = r30_2.State
    else
      r30_0.status = 0
    end
    if r30_2.Exclusions then
      r30_0.ip_exclusion_list = r30_2.Exclusions
    end
    if r30_2.MaxTimeout then
      r30_0.MaxTimeout = r30_2.MaxTimeout
    end
    if r30_2.AggressiveLevel then
      r30_0.AggressiveLevel = r30_2.AggressiveLevel
    end
    if r30_2.Plugins then
      r30_0.Plugins = r30_2.Plugins
      if r30_0.Plugins then
        if mp.bitand(r30_0.Plugins, 2) == 2 then
          r30_0.learning_mode = false
        end
        if mp.bitand(r30_0.Plugins, 1) == 1 then
          r30_0.block_local_ip = true
        end
      end
    end
  end
  if r30_0.ip_exclusion_list then
    r30_0.ip_exclusion_list = split(r30_0.ip_exclusion_list, ",")
  end
  return r30_0
end

local function r0_30(p31_0, p31_1, p31_2)
  p31_1 = p31_1 or {}
  p31_2 = p31_2 or ""
  local r31_0 = sysio.RegOpenKey(p31_0)
  if r31_0 then
    local r31_1 = sysio.RegEnumValues(r31_0)
    if r31_1 then
      for r31_2, r31_3 in pairs(r31_1) do
        if not p31_1[r31_3] then
          p31_1[r31_3] = 0
          p31_2 = p31_2 .. "," .. r31_3
        end
      end
    end
  end
  return p31_1, p31_2
end

local function r0_31(p32_0)
  local r32_0 = scrubData(p32_0)
  r32_0 = "F0000" .. string.sub(r32_0, 6)
  local r32_1 = 220
  local r32_2, r32_3 = MpCommon.SNidSearch(r32_1, r32_0)
  if r32_2 and r32_3 then
    local r32_4 = string.sub(r32_3, 3)
    r32_4 = MpCommon.Base64Decode(r32_4)
    for r32_5, r32_6, r32_7 in r32_4:gmatch("I=(%d+)|V=(%d+)|S=(%d+)") do
      return true, tonumber(r32_5), tonumber(r32_6), tonumber(r32_7)
    end
  end
  return false, 0, 0, 0
end

local function r0_32(p33_0)
  local r33_0 = scrubData(p33_0)
  r33_0 = "00000" .. string.sub(r33_0, 6)
  local r33_1 = 220
  local r33_2, r33_3 = MpCommon.SNidSearch(r33_1, r33_0)
  if r33_2 and r33_3 then
    local r33_4 = string.sub(r33_3, 3)
    r33_4 = MpCommon.Base64Decode(r33_4)
    for r33_5, r33_6, r33_7 in r33_4:gmatch("I=(%d+)|V=(%d+)|S=(%d+)") do
      return true, tonumber(r33_5), tonumber(r33_6), tonumber(r33_7)
    end
  end
  return false, 0, 0, 0
end

local function r0_33(p34_0)
  local r34_0 = {}
  local r34_1 = 0
  local r34_2 = tonumber(GetRollingQueueKeyValue("RDP_Ip", p34_0.Ip))
  local r34_3 = tonumber(GetRollingQueueKeyValue("RDP_Usr", p34_0.TFUN))
  if r34_2 then
    local r34_4 = tonumber(r34_2)
    if r34_4 and r34_4 >= 100 then
      r34_1 = 1
    end
  end
  local r34_5 = { IpScore = r34_2, UserScore = r34_3, case = r34_1 }
  return r34_1, r34_5
end

local function r0_34(p35_0, p35_1)
  p35_1 = p35_1 or 7200
  if GetRollingQueueCount("FW-IPs") == 500 then
    AppendToRollingQueue("FW-IPs-Extended", p35_0, 1, p35_1, 1000)
  else
    AppendToRollingQueue("FW-IPs", p35_0, 1, p35_1, 500)
  end
end

local function r0_35(p36_0)
  return IsKeyInRollingQueue("FW-IPs", p36_0, true)
    or IsKeyInRollingQueue("FW-IPs-Extended", p36_0, true)
end

local function r0_36(p37_0)
  AppendToRollingQueue("RDP-S-User", p37_0, tostring(MpCommon.GetCurrentTimeT()), 31104000, 100)
end

local function r0_37(p38_0)
  return GetRollingQueueKeyValue("RDP-S-User", p38_0)
end

local function r0_38()
  local r39_0 = {
    "RDP-Ip-Successful-Counter", "RDP-WSN-Successful-Counter", "RDP-S-User-Wsn", "RDP-S-IPs",
    "RDP-S-IP-Wsn", "RDP-S-IP-User", "RDP-S-Ws", "RDP-Ip-Failed-Counter", "RDP-IP-Failed-Counter",
    "RDP-F-User", "RDP-F-IP", "RDP_Ip", "RDP_Usr", "RDP_blocked_IP", "FW-IPs", "RDP-S-User",
    "RDP-Event-Success", "RDP-Event-Fail", "RDP-Successful-Counter"
  }
  local r39_1 = { "BruteForceProtectionCookieV3", "RDP-Successful-Counter", "RDP-Failed-Counter" }
  local r39_2 = { "BruteForceProtectionCookieV3", "RDP-Successful-Counter", "FW-Usrs" }
  for r39_3, r39_4 in ipairs(r39_0) do
    pcall(MpCommon.RollingQueueErase, r39_4)
  end
  for r39_5, r39_6 in ipairs(r39_1) do
    pcall(MpCommon.AtomicCounterErase, r39_6)
  end
  for r39_7, r39_8 in ipairs(r39_2) do
    pcall(MpCommon.OverwritePersistContextNoPath, r39_8, {}, 1)
  end
end

local function r0_39(p40_0, p40_1, p40_2)
  p40_0 = tonumber(p40_0)
  p40_1 = tonumber(p40_1)
  p40_2 = tonumber(p40_2)
  if p40_0
    and p40_1
    and p40_2
    and p40_0 > 1900
    and p40_0 < 2040
    and p40_1 > 0
    and p40_1 <= 12
    and p40_2 > 0
    and p40_2 <= 31 then
    return true
  end
  local r40_0 = false
  return r40_0
end

local function r0_40()
  local r41_0, r41_1 = pcall(bm.get_current_process_startup_info)
  if not (r41_0 and r41_1) then
    return
  end
  return r41_1.ppid
end

local function r0_41()
  local r42_0, r42_1 = pcall(bm.get_imagepath)
  if not (r42_0 and r42_1) then
    return
  end
  return string.match(r42_1, "([^\\]+)$")
end

local function r0_42()
  local r43_0 = {}

  local function r43_1(p44_0)
    if r43_0[p44_0] ~= p44_0 then
      r43_0[p44_0] = r43_1(r43_0[p44_0])
    end
    return r43_0[p44_0]
  end

  local function r43_2(p45_0)
    r43_0[p45_0] = r43_0[p45_0] or p45_0
  end

  local function r43_3(p46_0, p46_1)
    r43_2(p46_0)
    r43_2(p46_1)
    local r46_0 = r43_1(p46_0)
    local r46_1 = r43_1(p46_1)
    if r46_0 ~= r46_1 then
      r43_0[r46_1] = r46_0
    end
  end

  return { find = r43_1, union = r43_3, ensure = r43_2 }
end

local function r0_43(p47_0)
  local r47_0, r47_1 = string.find(p47_0, "://", 1, true)
  local r47_2 = p47_0
  if r47_0 and r47_1 then
    r47_2 = string.sub(p47_0, r47_1 + 1)
  end
  r47_0, r47_1 = string.find(r47_2, "/", 1, true)
  if r47_0 then
    r47_2 = string.sub(r47_2, 1, r47_0 - 1)
  end
  return (string.match(r47_2, "[%.%w%d-]+"))
end

local function r0_44()
  local r48_0 = bm.get_current_process_startup_info()
  if r48_0 == nil then
    return {}
  end
  local r48_1 = { User = {}, Session = {} }
  local r48_2 = { UserName = MpCommon.WTSUserName, Domain = MpCommon.WTSDomainName }
  local r48_3 = {
    ClientIP = MpCommon.WTSClientAddress, ClientName = MpCommon.WTSClientName,
    WinStationName = MpCommon.WTSWinStationName, Id = MpCommon.WTSSessionId,
    ClientBuildNumber = MpCommon.WTSClientBuildNumber, ClientProductId = MpCommon.WTSClientProductId,
    ClientProtocolType = MpCommon.WTSClientProtocolType,
    ClientConnectState = MpCommon.WTSConnectState, ClientInfo = MpCommon.WTSClientInfo,
    ClientSessionInfo = MpCommon.WTSSessionInfo, ConfigInfo = MpCommon.WTSConfigInfo,
    IsRemoteSession = MpCommon.WTSIsRemoteSession
  }
  r48_1.User = querySessionInformation(r48_0.ppid, r48_2)
  r48_1.Session = querySessionInformation(r48_0.ppid, r48_3)
  local r48_4 = r48_1.User
  if r48_4 and r48_1.Session then
    local r48_5 = {}
    local r48_6 = r48_1.User.UserName
    local r48_7 = r48_1.User.Domain
    local r48_8 = r48_1.Session.ClientName
    local r48_9 = r48_1.Session.WinStationName
    -- [unluac error] HIR proto#48 still contains residual table-set-list during AST lowering
    r48_6 = r48_1.Session.ClientIP
    if r48_6 ~= nil and type(r48_1.Session.ClientIP) == "table" then
      r48_1.Session.ClientIP = r48_1.Session.ClientIP.Address
    end
    r48_6 = ""
    r48_7 = false
    r48_8 = pcall
    r48_9 = MpCommon
    local r48_10, r48_11 = r48_8(r48_9.GetUserAccountInfo, r48_1.User.Domain, r48_1.User.UserName)
    r48_6 = r48_11
    if r48_10 and r48_6 then
      local r48_12 = scrubData(r48_6.Name)
      r48_6.Name = r48_12
      r48_12 = r48_1.User
      r48_12.Info = r48_6
      r48_12 = r48_1.User.Info
      local r48_13 = r0_1(r48_1.User.Info.HomeDir, r48_5)
      r48_12.HomeDir = r48_13
      r48_12 = r48_1.User.Info
      r48_13 = r0_1
      r48_13 = r48_13(r48_1.User.Info.ProfilePath, r48_5)
      r48_12.ProfilePath = r48_13
    end
    local r48_14, r48_15 = pcall(MpCommon.GetUserAccountGroups, r48_1.User.Domain,
      r48_1.User.UserName)
    r48_6 = r48_15
    if r48_14 and r48_6 then
      local r48_16 = r48_1.User
      local r48_17 = {}
      r48_16.Groups = r48_17
      r48_16 = ipairs
      r48_17 = r48_6
      for r48_18, r48_19 in r48_16(r48_17) do
        table.insert(r48_1.User.Groups, scrubData(r48_19.Name))
      end
    end
    r48_14 = r48_1.User
    local r48_20 = scrubData(r48_1.User.UserName)
    r48_14.UserName = r48_20
    r48_14 = r48_1.User
    r48_20 = scrubData
    r48_20 = r48_20(r48_1.User.Domain)
    r48_14.Domain = r48_20
    r48_14 = r48_1.Session
    r48_20 = scrubData
    r48_20 = r48_20(r48_1.Session.ClientName)
    r48_14.ClientName = r48_20
    r48_14 = r48_1.Session
    r48_20 = scrubData
    r48_20 = r48_20(r48_1.Session.WinStationName)
    r48_14.WinStationName = r48_20
    if r48_1.Session.ConfigInfo and type(r48_1.Session.ConfigInfo) ~= "string" then
      local r48_21 = r48_1.Session.ConfigInfo
      local r48_22 = scrubData(r48_1.Session.ConfigInfo.LogonDomain)
      r48_21.LogonDomain = r48_22
      r48_21 = r48_1.Session.ConfigInfo
      r48_22 = scrubData
      r48_22 = r48_22(r48_1.Session.ConfigInfo.LogonUserName)
      r48_21.LogonUserName = r48_22
      r48_21 = r48_1.Session.ConfigInfo
      r48_22 = r0_1
      r48_22 = r48_22(r48_1.Session.ConfigInfo.InitialProgram, r48_5)
      r48_21.InitialProgram = r48_22
      r48_21 = r48_1.Session.ConfigInfo
      r48_22 = r0_1
      r48_22 = r48_22(r48_1.Session.ConfigInfo.WorkDirectory, r48_5)
      r48_21.WorkDirectory = r48_22
    end
    if r48_1.Session.ClientInfo and type(r48_1.Session.ClientInfo) ~= "string" then
      local r48_23 = r48_1.Session.ClientInfo
      local r48_24 = r0_1(r48_1.Session.ClientInfo.InitialProgram, r48_5)
      r48_23.InitialProgram = r48_24
      r48_23 = r48_1.Session.ClientInfo
      r48_24 = r0_1
      r48_24 = r48_24(r48_1.Session.ClientInfo.WorkDirectory, r48_5)
      r48_23.WorkDirectory = r48_24
    end
  end
  return r48_1
end

local function r0_45(p49_0, p49_1, p49_2)
  if p49_0 ~= nil and p49_0 ~= "" and p49_1 ~= nil and p49_1 ~= "" then
    if p49_2 == nil then
      p49_2 = r0_7()
    end
    if p49_2 ~= nil and type(p49_2) == "table" then
      for r49_0, r49_1 in ipairs(p49_2) do
        if string.find(p49_0, r49_1[1], 1, true) and string.find(p49_1, r49_1[2], 1, true) then
          return true
        end
      end
      local r49_2 = p49_0 .. ":cmdline:" .. p49_1
      bm.add_related_string("proc_context_info", r49_2, bm.RelatedStringBMReport)
      return false
    end
    return false
  end
  local r49_3 = "Failed to fetch process details"
  bm.add_related_string("proc_context_info", r49_3, bm.RelatedStringBMReport)
  return false
end

local function r0_46(p50_0)
  local r50_0 = r0_10(p50_0)
  return mp.shl32(r50_0[1], 24) + mp.shl32(r50_0[2], 16) + mp.shl32(r50_0[3], 8) + r50_0[4]
end

local function r0_47()
  local r51_0 = GetRollingQueueKeys("localProfiles")
  if r51_0 == nil then
    _, r51_0 = r0_11()
  end
  return r51_0
end

local function r0_48(p52_0)
  r0_27("RDP-F-User", p52_0.TFUN .. "-" .. p52_0.Ip, 1, 172800, 300)
end

local function r0_49(p53_0)
  local r53_0 = p53_0.TFUN
  if p53_0.SubStatus ~= 3221225572 then
    r53_0 = scrubData(r53_0)
  end
  r0_27("RDP-F-IP", p53_0.Ip .. "-" .. r53_0, 1, 172800, 300)
end

local function r0_50(p54_0)
  local r54_0 = tostring(MpCommon.GetCurrentTimeT())
  r0_36(p54_0.TFUN)
end

local function r0_51()
  local r55_0 = GetRollingQueueKeyValue("DefenderExclusion", "IpAddresses")
  local r55_1
  if r55_0 then
    local r55_2 = split(r55_0, ",")
    local r55_3 = convert_to_hashtable(r55_2)
    r55_2 = r55_3
  else
    local r55_4, r55_5 = r0_30("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Exclusions\\IpAddresses")
    r55_0 = r55_5
    r55_1 = r55_4
    r55_4 = r0_30
    r55_5 = "HKLM\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Exclusions\\IpAddresses"
    local r55_6, r55_7 = r55_4(r55_5, r55_1, r55_0)
    r55_0 = r55_7
    r55_1 = r55_6
    r55_6 = AppendToRollingQueue
    r55_7 = "DefenderExclusion"
    r55_6(r55_7, "IpAddresses", r55_0, 3600, 2)
  end
  return r55_1
end

local function r0_52(p56_0, p56_1, p56_2)
  p56_2 = p56_2 or 50
  local r56_0 = 0
  local r56_1, r56_2, r56_3, r56_4 = r0_31(p56_0)
  local r56_5 = p56_0:lower()
  local r56_6, r56_7, r56_8, r56_9
  if p56_0 == r56_5 then
    r56_6, r56_7, r56_8, r56_9 = nil, r56_2, r56_3, r56_4
  else
    local r56_10, r56_11, r56_12, r56_13 = r0_31(r56_5)
    local r56_14, r56_15, r56_16 = r56_13, r56_12, r56_11
    r56_6 = r56_10
    if r56_6 then
      r56_7 = r56_1 and math_round((r56_2 + r56_16) / 2) or r56_16
      r56_8 = r56_1 and math_round((r56_3 + r56_15) / 2) or r56_15
      repeat
        if r56_1 then
          local r56_17 = math_round((r56_4 + r56_14) / 2)
          if r56_17 then
            r56_9 = r56_17
            break
          end
        end
        r56_9 = r56_14
      until true
    else
      r56_7, r56_8, r56_9 = r56_2, r56_3, r56_4
    end
  end
  if r56_1 or r56_6 then
    if p56_1 then
      r56_0 = p56_2 * (math_ln(r56_7 + r56_8) - math_ln(r56_9)) / 21
    else
      r56_0 = p56_2 * (math_ln(r56_7 + r56_8) - math_ln(r56_9)) / 19
    end
  end
  return r56_7 + r56_8 > 0 and r56_9 == 0, math_max(0, math_round(r56_0))
end

local function r0_53(p57_0, p57_1, p57_2)
  p57_2 = p57_2 or 50
  local r57_0 = 0
  local r57_1, r57_2, r57_3, r57_4 = r0_32(p57_0)
  local r57_5 = p57_0:lower()
  local r57_6, r57_7, r57_8, r57_9
  if p57_0 == r57_5 then
    r57_6, r57_7, r57_8, r57_9 = nil, r57_2, r57_3, r57_4
  else
    local r57_10, r57_11, r57_12, r57_13 = r0_32(r57_5)
    local r57_14, r57_15, r57_16 = r57_13, r57_12, r57_11
    r57_6 = r57_10
    if r57_6 then
      r57_7 = r57_1 and math_round((r57_2 + r57_16) / 2) or r57_16
      r57_8 = r57_1 and math_round((r57_3 + r57_15) / 2) or r57_15
      repeat
        if r57_1 then
          local r57_17 = math_round((r57_4 + r57_14) / 2)
          if r57_17 then
            r57_9 = r57_17
            break
          end
        end
        r57_9 = r57_14
      until true
    else
      r57_7, r57_8, r57_9 = r57_2, r57_3, r57_4
    end
  end
  if r57_1 or r57_6 then
    if p57_1 then
      r57_0 = p57_2 * (math_ln(r57_7 + r57_8) - math_ln(r57_9)) / 21
    else
      r57_0 = p57_2 * (math_ln(r57_7 + r57_8) - math_ln(r57_9)) / 19
    end
  end
  return r57_7 + r57_8 > 0, math_max(0, math_round(r57_0))
end

local function r0_54(p58_0, p58_1, p58_2)
  p58_0.current_event = deepCopy(p58_1)
  p58_0.IPF = r0_21(p58_1.Ip)
  if p58_2 and p58_1.SubStatus ~= 3221225572 and p58_0.current_event.TN then
    p58_0.current_event.TN = "username_" .. scrubData(p58_0.current_event.TN)
  end
  p58_0.current_event = safeJsonSerialize(p58_0.current_event)
  p58_0.IsServer = versioning.IsServer()
  local r58_0 = {}
  for r58_1, r58_2 in pairs(p58_0) do
    local r58_3 = type(r58_2)
    local r58_4 = r58_3 == "table" and safeJsonSerialize(r58_2)
    if r58_4 then
      r58_3 = r58_4
    elseif type(r58_2) == "string" then
      r58_3 = r58_2
    else
      r58_3 = tostring(r58_2) or r58_2
    end
    r58_0[r58_1] = r58_3
  end
  local r58_5 = {}
  r58_5["RDP-Successful-Counter"] = GetRollingQueueKeyValue("RDP-Successful-Counter", "counter")
  r58_5["RDP-Ip-Successful-Counter"] = GetRollingQueueKeyValue("RDP-Ip-Successful-Counter", p58_1.Ip)
  r58_5["RDP-WSN-Successful-Counter"] = GetRollingQueueKeyValue("RDP-WSN-Successful-Counter",
    p58_1.Wsn)
  r58_5["RDP-Ip-Failed-Counter"] = GetRollingQueueKeyValue("RDP-IP-Failed-Counter", p58_1.Ip)
  r58_5["All-Ip-Failed-Count"] = GetRollingQueueCount("RDP-IP-Failed-Counter")
  r58_5["RDP-blocked-IP-Counter"] = GetRollingQueueKeyValue("RDP_blocked_IP", p58_1.Ip)
  r58_5.NumberOfBlockedIPs = GetRollingQueueCount("FW-IPs")
  r58_5.NumberOfBlockedIPsExtended = GetRollingQueueCount("FW-IPs-Extended")
  r58_5["Unique-Ip-Success-Count"] = GetRollingQueueCount("RDP-Ip-Successful-Counter")
  r58_5.localProfilesCount = GetRollingQueueCount("localProfiles")
  r58_5["BF-HighVolumeRequest-IP"] = GetRollingQueueKeyValue("BF-HighVolumeRequest", p58_1.Ip)
  r58_5["BF-FailedCloudCalls-Counter"] = GetRollingQueueKeyValue("BF-FailedCloudCalls", "Counter")
  r58_5["BF-FailedCloudCalls-LastError"] = GetRollingQueueKeyValue("BF-FailedCloudCalls",
    "LastError")
  r58_5 = safeJsonSerialize(r58_5)
  if r58_5 then
    r58_0.detection_info = r58_5
  end
  r58_0.network_data = GetRollingQueueKeyValue("RDPIncomingConnection", p58_1.Ip)
  if r58_0.network_data then
    AppendToRollingQueue("RDPIncomingConnection", p58_1.Ip, "", 1, 100)
  end
  r58_0.defender_for_identity_version = GetRollingQueueKeyValue("DefenderForIdentity", "Version")
  r58_0.defender_for_identity_supported_users = GetRollingQueueKeyValue("DefenderForIdentity",
    "SupportedUsers")
  r58_0.AadTenantID = getAadTenantID()
  return r58_0
end

local function r0_55(p59_0)
  local r59_0 = r0_43(p59_0) or p59_0
  local r59_1 = is_valid_ip(r59_0)
  local r59_2
  if r59_1 then
    r59_2 = not isPublicIP(r59_0)
  else
    r59_2 = false
  end
  return r59_2
end

local function r0_56(p60_0, p60_1)
  local r60_0 = r0_46(p60_0)
  local r60_1 = r0_46(p60_1)
  if getIpAddressClass(r60_0) == getIpAddressClass(r60_1) then
    local r60_2 = math_base(mp.bitxor(r60_0, r60_1), 2)
    r60_2 = #r60_2
    return r60_2
  end
  return 32
end

local function r0_57(p61_0, p61_1)
  local r61_0 = r0_47()
  local r61_1, r61_2 = 1000, ""
  for r61_3 in pairs(r61_0) do
    local r61_4 = r0_9(p61_0, r61_3, p61_1)
    if r61_4 < r61_1 then
      r61_1 = r61_4
      r61_2 = r61_3
    end
  end
  return r61_1, r61_2
end

local function r0_58(p62_0, p62_1, p62_2)
  if r0_13(p62_0) then
    local r62_0 = deepCopy(p62_0)
    if p62_2 then
      r62_0.TN = "username_" .. scrubData(r62_0.TN)
    end
    if p62_1 then
      r0_50(p62_0)
      r0_18(p62_0)
      r0_16(p62_0.Wsn)
      r0_17(p62_0)
      r0_27("RDP-Successful-Counter", "counter", 1, 311040000, 1)
      r0_27("RDP-Ip-Successful-Counter", p62_0.Ip, 1, 311040000, 1000)
      r0_27("RDP-WSN-Successful-Counter", p62_0.Wsn, 1, 311040000, 1000)
      r0_27("RDP-Event-Success", safeJsonSerialize(r62_0), 1, 604800, 10)
    else
      r0_48(p62_0)
      r0_49(p62_0)
      r0_26("RDP-Failed-Counter", 1, false, 2419200)
      r0_27("RDP-IP-Failed-Counter", p62_0.Ip, 1, 2419200, 1000)
      r0_27("RDP-Event-Fail", safeJsonSerialize(r62_0), 1, 604800, 10)
    end
  end
end

local function r0_59(p63_0)
  local r63_0, r63_1 = r0_52(p63_0.Wsn, p63_0.SubStatus ~= 3221225572)
  return r63_0, r63_1
end

local function r0_60(p64_0)
  local r64_0, r64_1 = r0_53(p64_0.TN, p64_0.SubStatus ~= 3221225572)
  return r64_0, r64_1
end

local function r0_61(p65_0)
  local r65_0 = r0_43(p65_0) or p65_0
  local r65_1 = string.match(r65_0, "%.[a-zA-Z][a-zA-Z]+$")
  if string.match(r65_0, "%.local$") then
    return true
  end
  if isnull(r65_1) then
    if is_valid_ip(r65_0) then
      return r0_55(r65_0)
    end
    return true
  end
  return false
end

local function r0_62(p66_0)
  local r66_0 = r0_19()
  local r66_1, r66_2 = 4294967296, nil
  if r66_0 then
    for r66_3, r66_4 in ipairs(r66_0) do
      local r66_5 = r0_56(p66_0.Ip, r66_4)
      if r66_5 < r66_1 then
        r66_2 = r66_4
        r66_1 = r66_5
      end
    end
  else
    error("Unable to find any good IPs")
  end
  return r66_1, r66_2
end

local function r0_63(p67_0)
  local r67_0, r67_1, r67_2, r67_3, r67_4, r67_5, r67_6, r67_7, r67_8, r67_9, r67_10, r67_11, r67_12, r67_13, r67_14, r67_15, r67_16, r67_17, r67_18 = 0, 0, 1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32568, 65536
  local r67_19 = isPublicIP(p67_0.Ip)

  local function r67_20(p68_0, p68_1, p68_2)
    if r0_23(p68_0.Ip, p68_0.Wsn) then
      p68_2 = mp.bitor(p68_2, r67_13)
      p68_1 = p68_1 - 10
    elseif r0_24(p68_0.TFUN, p68_0.Wsn) then
      p68_2 = mp.bitor(p68_2, r67_14)
      p68_1 = p68_1 - 10
    elseif r0_22(p68_0.Wsn) then
      p68_2 = mp.bitor(p68_2, r67_12)
      p68_1 = p68_1 - 5
    else
      local r68_0, r68_1 = r0_59(p68_0)
      if r68_0 then
        p68_2 = mp.bitor(p68_2, r67_8)
        p68_1 = p68_1 + r68_1
      elseif mp.bitand(p68_2, r67_7) == r67_7 and mp.bitand(p68_2, r67_6) == r67_6 then
        p68_1 = p68_1 + 1
      else
        p68_1 = p68_1 + 10
      end
    end
    return p68_1, p68_2
  end

  local function r67_21(p69_0, p69_1, p69_2)
    if p69_0.SubStatus == 3221225572 then
      p69_2 = mp.bitor(p69_2, r67_7)
      local r69_0, r69_1 = r0_57(p69_0.TN, 3)
      if r69_0 < 3 then
        p69_2 = mp.bitor(p69_2, r67_6)
        p69_1 = math_min(math_floor(p69_1 * r69_0 / 4), p69_1 - 10)
        if r0_20(p69_0.Ip, r69_1) then
          p69_2 = mp.bitor(p69_2, r67_3)
          p69_1 = p69_1 - 10
        end
      else
        p69_1 = p69_1 + 10
        local r69_2, r69_3 = r0_60(p69_0)
        if r69_2 then
          p69_2 = mp.bitor(p69_2, r67_5)
          p69_1 = p69_1 + r69_3
        end
        if #p69_0.TDN and p69_0.TDN ~= "" then
          local r69_4 = isValidLocalDomain(p69_0.TDN)
          if r69_4 > 0 then
            p69_2 = mp.bitor(p69_2, r67_17)
            if r69_4 == 1 then
              p69_2 = mp.bitor(p69_2, r67_18)
            end
            p69_1 = p69_1 - 10
          end
        end
      end
    else
      p69_2 = mp.bitor(p69_2, r67_4)
      p69_1 = p69_1 - 1
    end
    return p69_1, p69_2
  end

  local function r67_22(p70_0, p70_1, p70_2)
    if r0_13(p70_0) then
      p70_2 = mp.bitor(p70_2, r67_2)
      if r67_19 then
        p70_2 = mp.bitor(p70_2, r67_15)
        if r0_25(p70_0.Ip) then
          p70_2 = mp.bitor(p70_2, r67_11)
          p70_1 = p70_1 - 20
          if r0_20(p70_0.Ip, p70_0.TFUN) then
            p70_2 = mp.bitor(p70_2, r67_3)
            p70_1 = p70_1 - 10
          end
        else
          local r70_0, r70_1, r70_2 = pcall(r0_62, p70_0)
          if r70_0 then
            if r70_1 < 16 then
              p70_2 = mp.bitor(p70_2, r67_9)
              p70_1 = p70_1 + r70_1 - 8
              if r0_20(r70_2, p70_0.TFUN) then
                p70_2 = mp.bitor(p70_2, r67_3)
                p70_1 = p70_1 - 10
              end
              if r0_23(p70_0.Wsn, r70_2) then
                p70_2 = mp.bitor(p70_2, r67_3)
                p70_1 = p70_1 - 10
              end
            else
              p70_1 = p70_1 + 10
            end
          end
        end
      else
        p70_1 = p70_1 + 10
      end
    end
    return p70_1, p70_2
  end

  local function r67_23(p71_0, ...)
    local r71_1 = { pcall(p71_0, ...) }
    if r71_1[1] then
      return r71_1[2], r71_1[3]
    end
    return 0, 0, r71_1[2]
  end

  local r67_24 = 0
  local r67_25, r67_26, r67_27 = r67_23(r67_22, p67_0, r67_24, r67_1)
  local r67_28 = r67_27
  r67_1 = r67_26
  r67_24 = r67_25
  r67_25 = r67_23
  r67_26 = r67_21
  r67_27 = p67_0
  local r67_29, r67_30, r67_31 = r67_25(r67_26, r67_27, r67_24, r67_1)
  r67_1 = r67_30
  r67_24 = r67_29
  local r67_32
  if r67_19 and p67_0.Wsn ~= "-" then
    local r67_33, r67_34, r67_35 = r67_23(r67_20, p67_0, r67_24, r67_1)
    r67_1, r67_24, r67_32 = r67_34, r67_33, r67_35
  else
    r67_32 = nil
  end
  if isValidLocalDomain(p67_0.TDN) ~= 0 then
    local r67_36 = r0_37(p67_0.TFUN)
    local r67_37
    if r67_36 == nil then
      r67_37 = nil
    else
      r67_37 = MpCommon.GetCurrentTimeT() - r67_36
    end
    if mp.bitand(r67_1, r67_7) == 0 then
      if versioning.IsServer() then
        if r67_36 == nil or r67_37 > 2592000 then
          r67_24 = r67_24 - 5
        end
      elseif r67_36 == nil or r67_37 > 604800 then
        r67_24 = r67_24 - 5
      end
    end
  end
  r67_24 = r67_19 and GetRollingQueueKeyValue("RDP-Ip-Successful-Counter", p67_0.Ip) and 0
    or math_max(r67_24, 1)
  local r67_38 = r0_27("RDP_Ip", p67_0.Ip, r67_24, 604800, 1000)
  local r67_39 = 0
  local r67_40 = mp.bitand(r67_1, r67_4)
  if r67_40 ~= r67_4 then
    r67_39 = r0_27("RDP_Usr", p67_0.TFUN, r67_24, 604800, 1000)
  end
  r67_0 = r67_38 >= 100 and 1 or r67_0
  if r67_39 >= 100 then
    r67_0 = mp.bitor(r67_0, 2)
  end
  r67_40 = {
    IpScore = r67_38, UserScore = r67_39, flags = r67_1, score = r67_24, case = r67_0,
    compute_ip_sore_error = r67_28, compute_user_score_error = r67_31,
    compute_wsn_score_error = r67_32
  }
  local r67_41 = r67_0
  local r67_42 = r67_40
  return r67_41, r67_42
end

function getService(p72_0)
  if p72_0 and p72_0 ~= "" then
    local r72_0 = sysio.EnumerateServices()
    if r72_0 then
      p72_0 = p72_0:lower()
      for r72_1, r72_2 in pairs(r72_0) do
        local r72_3 = r72_2.ServiceName
        if r72_3 and p72_0 == r72_3:lower() then
          return r72_2
        end
      end
      return
    end
    return false
  end
  return false
end

local function r0_64(p73_0)
  if p73_0 then
    local r73_0 = {}
    local r73_1, r73_2, r73_3 = nil, 8, 1
    local r73_4 = { 0, 0, 0, 0, 0, 0, 0, 0 }
    local r73_5 = 0
    local r73_6 = string.len(p73_0)
    if not (r73_6 < 2) and not (r73_6 > 39) then
      for r73_7 = r73_6, 1, -1 do
        local r73_8 = string.sub(p73_0, r73_7, r73_7)
        if r73_8 == ":" then
          r73_2 = r73_2 - 1
          if r73_2 < 1 then
            return nil
          end
          if r73_1 == ":" then
            r73_5 = r73_2
          end
          r73_3 = 1
        else
          if r73_3 >= 65536 then
            return nil
          end
          if r73_7 == r73_6 - 1 and r73_1 == ":" then
            return nil
          end
          r73_8 = tonumber(r73_8, 16)
          if not r73_8 then
            return nil
          end
          r73_4[r73_2] = r73_4[r73_2] + r73_8 * r73_3
          r73_3 = r73_3 * 16
        end
        r73_1 = r73_8
      end
      if r73_2 ~= 1 then
        for r73_9 = r73_2, r73_5 do
          r73_4[r73_9 - r73_2 + 1] = r73_4[r73_9]
          r73_4[r73_9] = 0
        end
      end
      if r73_2 > 6 then
        return nil
      end
      local r73_10, r73_11, r73_12, r73_13 = 0, 1, 0, nil
      for r73_14 = 1, 8 do
        local r73_15 = r73_4[r73_14]
        if r73_15 == 0 then
          r73_10 = r73_10 + 1
          if r73_10 == 1 then
            r73_11 = r73_14
          end
          if r73_12 < r73_10 then
            r73_12 = r73_10
            r73_13 = r73_11
          end
        else
          r73_10 = 0
        end
        r73_4[r73_14] = string.format("%x", r73_15)
      end
      local r73_16 = 0
      for r73_17 = 1, 8 do
        if r73_17 < r73_13 or r73_13 + r73_12 <= r73_17 then
          r73_0[#r73_0 + 1] = r73_4[r73_17]
          r73_16 = 0
        end
        if r73_16 < 2 and r73_17 < 8 then
          r73_0[#r73_0 + 1] = ":"
          r73_16 = r73_16 + 1
        end
      end
      return table.concat(r73_0, "")
    end
    return nil
  end
  return nil
end

local function r0_65(p74_0, p74_1)
  if p74_0 then
    local r74_0 = {}
    local r74_1 = string.len(p74_0)
    if r74_1 < 16 then
      return nil
    end
    local r74_2, r74_3 = nil, nil
    for r74_4 = 1, r74_1, 2 do
      r74_2, r74_3 = string.byte(p74_0, r74_4, r74_4 + 3)
      if not r74_2 or not r74_3 then
        return nil
      end
      r74_0[#r74_0 + 1] = string.format("%02x%02x", r74_2, r74_3)
      if #r74_0 == 8 then
        local r74_5 = table.concat(r74_0, ":")
        r74_5 = r0_64(r74_5)
        if r74_5 then
          p74_1[#p74_1 + 1] = r74_5
        end
        r74_0 = {}
      end
    end
    return
  end
  return nil
end

function updateSystemDNSServers()
  local r75_0 = {}
  local r75_1 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters")
  if r75_1 then
    r75_0 = split(sysio.GetRegValueAsString(r75_1, "DhcpNameServer"), " ",
      (split(sysio.GetRegValueAsString(r75_1, "NameServer"), ",", r75_0)))
  end
  r75_1 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters")
  if r75_1 then
    local r75_2 = sysio.GetRegValueAsString(r75_1, "NameServer")
    r75_0 = split(r75_2, ",", r75_0)
    local r75_3 = sysio.GetRegValueAsBinary(r75_1, "Dhcpv6DNSServers")
    r0_65(r75_3, r75_0)
  end
  local r75_4 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\Interfaces"
  local r75_5 = sysio.RegOpenKey(r75_4)
  if r75_5 then
    local r75_6 = sysio.RegEnumKeys(r75_5)
    if r75_6 then
      for r75_7, r75_8 in pairs(r75_6) do
        local r75_9 = sysio.RegOpenKey(string.format("%s\\%s", r75_4, r75_8))
        if r75_9 then
          local r75_10 = sysio.GetRegValueAsString(r75_9, "NameServer")
          r75_0 = split(r75_10, ",", r75_0)
          r75_10 = sysio.GetRegValueAsString(r75_9, "DhcpNameServer")
          r75_0 = split(r75_10, " ", r75_0)
        end
      end
    end
  end
  r75_4 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters\\Interfaces"
  r75_5 = sysio.RegOpenKey(r75_4)
  if r75_5 then
    local r75_11 = sysio.RegEnumKeys(r75_5)
    if r75_11 then
      for r75_12, r75_13 in pairs(r75_11) do
        local r75_14 = sysio.RegOpenKey(string.format("%s\\%s", r75_4, r75_13))
        if r75_14 then
          local r75_15 = sysio.GetRegValueAsString(r75_14, "NameServer")
          if r75_15 then
            local r75_16 = {}
            split(r75_15, ",", r75_16)
            for r75_17, r75_18 in ipairs(r75_16) do
              r75_18 = r0_64(r75_18)
              if r75_18 then
                r75_0[#r75_0 + 1] = r75_18
              end
            end
          end
          r75_15 = sysio.GetRegValueAsString(r75_14, "Dhcpv6DNSServers")
          r0_65(r75_15, r75_0)
        end
      end
    end
  end
  local r75_19 = GetRollingQueueKeyValues("rq_dnsServer", "dnsServers")
  if r75_19 ~= nil and #r75_19 > 0 then
    for r75_20, r75_21 in ipairs(r75_19) do
      AppendToRollingQueue("rq_dnsServer", "lastDnsServers", r75_21.value, 86400, 100, 0)
    end
  end
  AppendToMultiValueRollingQueue("rq_dnsServer", "dnsServers", r75_0, 86400, 100)
  return r75_0
end

function isAlternateDNSServer(p76_0, p76_1)
  local r76_0, r76_1, r76_2, r76_3 = false, false, false, false
  local r76_4 = IsKeyValuePairInRollingQueue("rq_dnsServer", "dnsServers", p76_0)
  local r76_5
  if r76_4 then
    r76_5 = r76_0
  else
    local r76_6 = GetRollingQueueCountForKey("rq_dnsServer", "dnsServers") or 0
    if 0 == r76_6 then
      local r76_7 = updateSystemDNSServers()
      local r76_8 = 0
      for r76_9, r76_10 in pairs(r76_7) do
        if r76_10 == p76_0 then
          r76_8 = 1
        end
      end
      if #r76_7 > 0 and r76_8 == 0 then
        r76_5 = true
      else
        r76_5 = r76_0
      end
    else
      r76_5 = true
    end
  end
  local r76_11
  if r76_5 then
    if IsKeyValuePairInRollingQueue("rq_dnsServer", "lastDnsServers", p76_0) then
      r76_11, r76_1 = false, true
    elseif p76_1 then
      updateSystemDNSServers()
      r76_5 = isAlternateDNSServer(p76_0)
      if r76_5 then
        r76_11 = r76_5
      else
        r76_11, r76_2 = r76_5, true
      end
    else
      r76_11 = r76_5
    end
  else
    r76_11 = r76_5
  end
  local r76_12 = r76_11
  local r76_13 = r76_1
  local r76_14 = r76_2
  return r76_12, r76_13, r76_14
end

local function r0_66(p77_0)
  local r77_0 = "aAeEiIoOuUyYwWbBcCdDfFgGHjJkKlLmMnNpPqQrRsStT"
  local r77_1 = r77_0:find(string.char(p77_0), 1, true)
  return r77_1 == nil and 0 or r77_1 > 14 and 2 or 1
end

function computeStringScores(p78_0)
  local r78_0, r78_1, r78_2 = 0, 0, 0
  if #p78_0 < 5 then
    return r78_0, 1, r78_1, r78_2
  end
  local r78_3 = 1
  local r78_4 = #p78_0
  for r78_5 = 2, r78_4 do
    local r78_6 = p78_0:byte(r78_5)
    local r78_7 = p78_0:byte(r78_5 - 1)
    local r78_8 = r78_6 > 47 and r78_6 < 58
    local r78_9 = r78_7 > 47 and r78_7 < 58
    if r78_8 ~= r78_9 then
      r78_2 = r78_2 + 1
    end
    if r78_6 > 64 and r78_6 < 91 and r78_7 > 96 and r78_7 < 123
      or r78_7 > 64 and r78_7 < 91 and r78_6 > 96 and r78_6 < 123 then
      r78_1 = r78_1 + 1
    end
    if r0_66(r78_6) == r0_66(r78_7) then
      r78_0 = r78_0 + r78_3
      r78_3 = r78_3 + 1
    else
      r78_3 = 1
    end
  end
  return r78_0, r78_0 / #p78_0, r78_1, r78_2
end

function reportPersistedContext(p79_0, p79_1, p79_2)
  local r79_0 = string.lower(bm.get_imagepath())
  local r79_1 = bm.get_current_process_startup_info()
  local r79_2 = r79_1.command_line
  local r79_3 = MpCommon.GetPersistContextNoPath(p79_0)
  if r79_3 then
    for r79_4, r79_5 in ipairs(r79_3) do
      bm.add_related_string(p79_1, r79_5, bm.RelatedStringBMReport)
    end
  end
end

function reportAndSinkholeDNSTelemetry(p80_0, p80_1, p80_2)
  local r80_0 = MpCommon.GetPersistContextNoPath(p80_0)
  if r80_0 and #r80_0 > 0 then
    for r80_1, r80_2 in ipairs(r80_0) do
      if r80_2 then
        local r80_3 = string.format("BM_%s_%s", p80_0, r80_2)
        if 0 == MpCommon.GetPersistContextCountNoPath(r80_3) then
          bm.add_related_string("bmurl", r80_2, bm.RelatedStringBMReport)
          local r80_4 = string.find(r80_2, "_", 1, true)
          local r80_5 = string.sub(r80_2, 1, r80_4 - 1)
          local r80_6, r80_7
          if p80_2 or r80_5 == "dns-exfil.net" then
            local r80_8, r80_9 = MpCommon.AddDnsBlockListDomain(r80_5, 600)
            r80_6, r80_7 = r80_8, r80_9
          else
            r80_6, r80_7 = nil, nil
          end
          local r80_10 = MpCommon.GetPersistContextNoPath(r80_2)
          if r80_10 then
            for r80_11, r80_12 in ipairs(r80_10) do
              local r80_13 = bm.add_related_string
              local r80_14 = r80_5
              local r80_15 = r80_12 .. "." .. r80_14
              local r80_16 = bm.RelatedStringBMReport
              r80_14 = nil
              r80_13("bmurl", r80_15, r80_16)
            end
            MpCommon.AppendPersistContextNoPath(r80_3, "1", 600)
          end
          local r80_17 = r80_5
          local r80_18 = r80_6
          local r80_19 = r80_7
          return r80_17, r80_18, r80_19
        end
      end
    end
  end
end

function extractCommonSuffix(p81_0, p81_1)
  local r81_0 = #p81_0
  local r81_1, r81_2 = false, p81_1
  repeat
    p81_1 = p81_1 + 1
    local r81_3 = p81_0[1]
    local r81_4 = r81_3
    r81_3 = r81_4.byte
    local r81_5 = p81_0[1]
    local r81_6 = r81_3(r81_4, #r81_5 - p81_1)
    if r81_6 == 46 then
      r81_2 = p81_1
    end
    local r81_7 = r81_1
    for r81_8 = 2, r81_0 do
      if #p81_0[r81_8] < p81_1 or p81_0[r81_8]:byte(#p81_0[r81_8] - p81_1) ~= r81_6 then
        r81_7 = true
        break
      end
    end
    r81_1 = r81_7
  until r81_7
  p81_1 = p81_1 - 1
  local r81_9 = string.sub
  local r81_10 = p81_0[1]
  local r81_11 = p81_0[1]
  r81_9 = r81_9(r81_10, #r81_11 - p81_1)
  r81_10 = r81_2
  r81_11 = r81_9
  return r81_10, r81_11
end

function computeDataLength(p82_0, p82_1)
  local r82_0 = 0
  local r82_1 = {}
  local r82_2 = #p82_0[1] - p82_1
  local r82_3 = 0
  for r82_4, r82_5 in ipairs(p82_0) do
    table.insert(r82_1, string.sub(r82_5, 0, #r82_5 - p82_1))
    r82_0 = r82_0 + #r82_5 - p82_1
  end
  return r82_0, r82_2, r82_1
end

function routeBasedOnProcess(p83_0, p83_1)
  local r83_0 = 0
  if string.find(p83_0, "svchost.exe", 1, true) then
    r83_0 = mp.bitor(r83_0, 1)
  end
  if versioning.GetCloudBlockLevel() > 3 then
    r83_0 = mp.bitor(r83_0, 2)
  end
  local r83_1 = {
    [0] = "Telemetry", [1] = "SystemResolver", [2] = "CloudBlock", [3] = "CBSsystemResolver"
  }
  local r83_2 = 805306720 + 4 * p83_1 + r83_0
  return r83_2, r83_1[r83_0]
end

function computeReponseLength(p84_0)
  local r84_0 = nri.GetRawResponseBlob()
  if r84_0 then
    local r84_1 = #r84_0
    local r84_2, r84_3 = 0, 13
    while r84_2 < p84_0 do
      if not (r84_2 < 20) or not (r84_3 <= r84_1) then
        break
      end
      if mp.bitand(string.byte(r84_0, r84_3), 192) == 192 then
        r84_3 = r84_3 + 6
      else
        local r84_4 = string.find(r84_0, "\000", r84_3, true)
        if r84_4 then
          r84_3 = r84_4 + 5
        end
      end
      r84_2 = r84_2 + 1
    end
    return r84_1 - r84_3
  end
  return mp.CLEAN
end

function add_parents(p85_0, p85_1, p85_2)
  local r85_0 = ""
  local r85_1 = {}
  p85_1 = (p85_1 == nil or p85_1 > 5) and 5 or p85_1
  if p85_1 == 0 then
    return r85_1
  end
  local r85_2, r85_3, r85_4
  if p85_0 == nil then
    r85_4 = bm.get_current_process_startup_info()
    local r85_5, r85_6 = pcall(bm.get_process_relationships, r85_4.ppid)
    r85_2, r85_3 = r85_5, r85_6
  else
    local r85_7, r85_8 = pcall(bm.get_process_relationships, p85_0)
    r85_2, r85_3, r85_4 = r85_7, r85_8, nil
  end
  if r85_2 then
    if r85_3 == nil then
      return r85_1
    end
    p85_2 = p85_2 == nil and 1 or p85_2
    for r85_9, r85_10 in ipairs(r85_3) do
      if mp.bitand(r85_10.reason_ex, p85_2) == p85_2 and r85_10.ppid ~= nil then
        if r85_10.cmd_line then
          pcall(bm_AddRelatedFileFromCommandLine, r85_10.cmd_line)
        end
        bm.add_related_process(r85_10.ppid)
        local r85_11 = add_parents(r85_10.ppid, p85_1 - 1, p85_2)
        r85_1 = r85_11
        table.insert(r85_1, r85_10)
      end
    end
    if p85_0 == nil then
      table.insert(r85_1, r85_4)
    end
    return r85_1
  end
  return r85_1
end

function is_excluded_parent_proc_auto()
  local r86_0 = {
    ["ccmexec.exe"] = true, ["gpscript.exe"] = true, ["mpcmdrun.exe"] = true, ["mssense.exe"] = true,
    ["senseir.exe"] = true
  }
  return r0_0(r86_0)
end

function sms_untrusted_process()
  local r87_0 = add_parents()
  local r87_1 = {}
  for r87_2, r87_3 in ipairs(r87_0) do
    local r87_4 = MpCommon.IsFriendlyProcess(r87_3.ppid)
    if not r87_4 then
      bm.request_SMS(r87_3.ppid, "H")
      table.insert(r87_1, r87_3)
    end
  end
  return #r87_1 > 0, r87_1
end

function sms_untrusted_process_pid(p88_0)
  local r88_0 = add_parents(p88_0)
  local r88_1 = {}
  for r88_2, r88_3 in ipairs(r88_0) do
    local r88_4 = MpCommon.IsFriendlyProcess(r88_3.ppid)
    if not r88_4 then
      bm.request_SMS(r88_3.ppid, "H")
      table.insert(r88_1, r88_3)
    end
  end
  return #r88_1 > 0, r88_1
end

function multi_match_regex(p89_0, p89_1)
  if p89_0 and p89_1 then
    local r89_0, r89_1 = MpCommon.StringRegExpSearch(p89_1, p89_0)
    local r89_2 = {}
    while r89_0 do
      table.insert(r89_2, r89_1)
      local r89_3, r89_4 = string.find(p89_0, r89_1, 1, true)
      p89_0 = string.sub(p89_0, r89_4)
      r89_0, r89_1 = MpCommon.StringRegExpSearch(p89_1, p89_0)
    end
    return r89_2
  end
  return {}
end

function extractRansomNote(p90_0)
  if p90_0 == nil then
    return
  end
  local r90_0, r90_1 = pcall(mp.ContextualExpandEnvironmentVariables, p90_0)
  if r90_0 then
    p90_0 = r90_1
  end
  if not sysio.IsFileExists(p90_0) then
    return
  end
  local r90_2 = sysio.GetFileSize(p90_0)
  if r90_2 > 50000 then
    return
  end
  bm.add_related_file(p90_0)
  local r90_3, r90_4, r90_5, r90_6, r90_7, r90_8, r90_9 = "(?:---BEGIN ID---|Company Key: )(?:\\x0d\\x0a| )?([A-Za-z0-9+/=]*)(?:\\x0d\\x0a| |<)", "(\\b[a-fA-F0-9]{76}\\b)", "(\\b([13]{1}[a-km-zA-HJ-NP-Z1-9]{26,33}|bc1[a-z0-9]{39,59}|((bitcoincash|bchreg|bchtest):)?[qp][a-z0-9]{41}|[48][0-9AB][1-9A-HJ-NP-Za-km-z]{93}|0x[a-fA-F0-9]{40})\\b)", "((?i)(?:[\\\\A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[A-Za-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?\\.)+[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[A-Za-z0-9-]*[A-Za-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\]))", "((?i)(?:http|ftp|https):\\/\\/(?:[\\w_-]+(?:(?:\\.[\\w_-]+)+))(?:[\\w.,@?^=%&:\\/~+#-]*[\\w@?^=%&\\/~+#-])?|([a-zA-Z2-7]{1,56}\\.onion)(?:[\\w.,@?^=%&:\\/~+#-]*[\\w@?^=%&\\/~+#-])?)", "(\\b05[a-fA-F0-9]{64}\\b)", nil
  r90_9 = sysio.ReadFile(p90_0, 0, r90_2)

  local function r90_10(p91_0, p91_1)
    local r91_0 = p91_0
    if p91_1 == "emails" then
      local r91_1 = 1
      while #r91_0 >= r91_1 do
        if string.match(r91_0[r91_1], "\\") then
          table.remove(r91_0, r91_1)
        else
          r91_1 = r91_1 + 1
        end
      end
    end
    if p91_1 == "urls" then
      for r91_2, r91_3 in ipairs(r91_0) do
        if r91_0[r91_2]:sub(-1, -1) == "/" then
          r91_0[r91_2] = r91_0[r91_2]:sub(1, -2)
        end
      end
    end
    return r91_0
  end

  local r90_11 = {
    wallets = table_dedup(multi_match_regex(r90_9, r90_5)),
    emails = table_dedup(r90_10(multi_match_regex(r90_9, r90_6), "emails")),
    urls = table_dedup(r90_10(multi_match_regex(r90_9, r90_7), "urls")),
    tox_ids = table_dedup(multi_match_regex(r90_9, r90_4)),
    victim_ids = table_dedup(multi_match_regex(r90_9, r90_3)),
    session_ids = table_dedup(multi_match_regex(r90_9, r90_8))
  }
  local r90_12 = safeJsonSerialize(r90_11)
  r90_12 = MpCommon.Base64Encode(r90_12)
  bm.trigger_sig("RansomNoteContent", p90_0)
  bm.add_related_string("RansomNoteContent", r90_12, bm.RelatedStringBMReport)
  bm.add_related_string("RansomNoteContentLength", tostring(#r90_12), bm.RelatedStringBMReport)
  return true
end

function reportHeaders(p92_0)
  local r92_0 = {}
  p92_0 = not p92_0 and { "User-Agent" } or type(p92_0) == "string" and { p92_0 } or p92_0
  local r92_1, r92_2, r92_3 = ipairs(p92_0)
  for r92_4, r92_5 in r92_1, r92_2, r92_3 do
    local r92_6 = string.gsub
    r92_6 = r92_6(r92_5:lower(), "-", "")
    local r92_7 = nri.GetHttpRequestHeader(r92_5)
    r92_0[r92_6] = r92_7
  end
  r92_1 = nri.GetURI()
  if r92_1 then
    r92_0.uri = r92_1
  end
  nri.AddTelemetry(mp.bitor(mp.bitor(nri.Telemetry_HOSTNAME, nri.Telemetry_PATH),
      nri.Telemetry_QUERY),
    r92_0)
end

function isTrustedDomain(p93_0, p93_1)
  local r93_0 = nil
  if p93_0 and type(p93_0) == "string" then
    local r93_1 = {}
    local r93_2 = { SIG_CONTEXT = "BM", CONTEXT_SOURCE = p93_1 }
    local r93_3 = string.find(p93_0, "://", 1, true)
    if r93_3 then
      local r93_4 = { p93_0 }
      r93_0 = p93_0
      r93_1 = r93_4
    else
      local r93_5 = p93_0
      r93_1[1] = "http://" .. r93_5
      r93_5 = p93_0
      r93_1[2] = "http://www." .. r93_5
      r93_1[3] = "https://" .. p93_0
      r93_0 = p93_0
      r93_1[4] = "https://www." .. r93_0
    end
    local r93_6 = pcall
    local r93_7 = mp
    r93_0 = nil
    r93_0 = nil
    local r93_8, r93_9 = r93_6(r93_7.GetUrlReputation, r93_1, r93_2)
    if r93_8 and r93_9 and r93_9.urls then
      for r93_10, r93_11 in ipairs(r93_9.urls) do
        if r93_11.determination == 1 then
          return true
        end
      end
      return
    end
    return false
  end
  return false
end

function isTamperProtectionOn(p94_0)
  local r94_0, r94_1 = 60, "MpTamperProtectionState"
  p94_0 = p94_0 == nil or p94_0
  if p94_0 then
    if MpCommon.QueryPersistContextNoPath(r94_1, "off") then
      return false
    end
    if MpCommon.QueryPersistContextNoPath(r94_1, "on") then
      return true
    end
  end
  local r94_2 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
  if r94_2 then
    local r94_3 = sysio.GetRegValueAsDword(r94_2, "TamperProtection")
    if r94_3 then
      if mp.bitand(r94_3, 1) == 1 then
        MpCommon.SetPersistContextNoPath(r94_1, { "on" }, r94_0)
        return r94_3
      end
      MpCommon.SetPersistContextNoPath(r94_1, { "off" }, r94_0)
      return false
    end
  end
  return false
end

function getTamperProtectionSource()
  local r95_0 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Windows Defender\\Features")
  local r95_1
  if r95_0 then
    r95_1 = sysio.GetRegValueAsDword(r95_0, "TamperProtectionSource")
  end
  return r95_1
end

function scrubData(p96_0)
  if p96_0 == nil then
    return nil
  end
  if #p96_0 > 0 then
    return crypto.Sha1Buffer(p96_0, 0, #p96_0)
  end
  return "da39a3ee5e6b4b0d3255bfef95601890afd80709"
end

function querySessionInformation(p97_0, p97_1)
  local r97_0 = {}
  for r97_1, r97_2 in pairs(p97_1) do
    local r97_3, r97_4 = pcall(MpCommon.QuerySessionInformation, p97_0, r97_2)
    if r97_3 and r97_4 then
      r97_0[r97_1] = r97_4
    end
  end
  if next(r97_0) == nil then
    return {}
  end
  return r97_0
end

function reportSessionInformationInclusive()
  local r98_0, r98_1 = pcall(r0_44)
  if r98_0 and r98_1 then
    bm.add_related_string("sessionInfo", safeJsonSerialize(r98_1), bm.RelatedStringBMReport)
    return r98_1
  end
  bm.add_related_string("sessioninfofail", r98_1, bm.RelatedStringBMReport)
  return {}
end

function reportSessionInformation()
  local r99_0 = bm.get_current_process_startup_info()
  if r99_0 == nil then
    return {}
  end
  local r99_1, r99_2 = false, false
  r99_2, r99_1 = pcall(MpCommon.QuerySessionInformation, r99_0.ppid, MpCommon.WTSIsRemoteSession)
  if r99_2 and r99_1 then
    local r99_3, r99_4 = pcall(r0_44)
    if r99_3 and r99_4 then
      bm.add_related_string("sessionInfo", safeJsonSerialize(r99_4), bm.RelatedStringBMReport)
      return r99_4
    end
    bm.add_related_string("sessioninfofail", r99_4, bm.RelatedStringBMReport)
  end
  return {}
end

function reportRelevantUntrustedEntities(p100_0)
  p100_0 = p100_0 or 0
  local r100_0 = add_parents()
  local r100_1 = {}
  for r100_2, r100_3 in ipairs(r100_0) do
    if not MpCommon.IsFriendlyProcess(r100_3.ppid) then
      if r100_3.image_Path then
        table.insert(r100_1, r100_3.image_path)
        if p100_0 == 0 then
          bm.add_related_file(r100_3.image_path)
        end
      end
      pcall(bm.request_SMS, r100_3.ppid, "H")
    end
    local r100_4 = mp.GetProcessCommandLine(r100_3.ppid)
    if r100_4 then
      local r100_5, r100_6 = pcall(mp.GetExecutablesFromCommandLine, r100_4)
      if r100_5 and r100_6 then
        for r100_7, r100_8 in ipairs(r100_6) do
          r100_8 = mp.ContextualExpandEnvironmentVariables(r100_8)
          if r100_8 then
            local r100_9 = mp.IsKnownFriendlyFile(r100_8, true, true)
            if r100_9 == nil or r100_9 == false then
              if p100_0 == 1 then
                bm.add_threat_file(r100_8)
              end
              if p100_0 == 0 then
                bm.add_related_file(r100_8)
              end
              table.insert(r100_1, r100_8)
            end
          end
        end
      end
      local r100_10, r100_11 = pcall(mp.GetInlineScriptsFromCommandLine, r100_4)
      if r100_10 and r100_11 then
        for r100_12, r100_13 in ipairs(r100_11) do
          r100_13 = mp.ContextualExpandEnvironmentVariables(r100_13)
          if r100_13 and string.match(r100_13, "^[%a]:\\") then
            local r100_14 = mp.IsKnownFriendlyFile(r100_13, true, true)
            if r100_14 == nil or r100_14 == false then
              if p100_0 == 1 then
                bm.add_threat_file(r100_13)
              end
              if p100_0 == 0 then
                bm.add_related_file(r100_13)
              end
              table.insert(r100_1, r100_13)
            end
          end
        end
      end
    end
  end
  return r100_1
end

function reportRelevantUntrustedEntitiesForPid(p101_0)
  local r101_0 = {}
  while p101_0 do
    local r101_1 = MpCommon.GetImagePathFromPid(p101_0)
    local r101_2 = mp.GetProcessCommandLine(p101_0)
    local r101_3 = MpCommon.IsFriendlyProcess(p101_0)
    if not r101_3 and r101_1 then
      table.insert(r101_0, r101_1)
    end
    if r101_2 then
      local r101_4, r101_5 = pcall(mp.GetExecutablesFromCommandLine, r101_2)
      if r101_4 and r101_5 then
        for r101_6, r101_7 in ipairs(r101_5) do
          r101_7 = mp.ContextualExpandEnvironmentVariables(r101_7)
          if r101_7 then
            local r101_8 = mp.IsKnownFriendlyFile(r101_7, true, false)
            if r101_8 == nil or r101_8 == false then
              local r101_9, r101_10, r101_11 = false, 0, 0
              local r101_12 = MpCommon.PathToWin32Path(r101_7)
              if r101_12 and string.match(r101_12, "^[%a]:\\") then
                local r101_13 = sysio.IsPathAVExcluded(r101_12, false)
                local r101_14 = sysio.GetFileSize(r101_12)
                if sysio.IsFileExists(r101_12) then
                  local r101_15 = sysio.GetFileLastWriteTime(r101_12)
                  r101_15 = r101_15 / 10000000 - 11644473600
                  r101_11 = MpCommon.GetCurrentTimeT() - r101_15
                  local r101_16 = {}
                  r101_16.path = r101_7
                  r101_16.isAVExcluded = r101_13
                  r101_16.size = r101_14
                  r101_16.age = r101_11
                  table.insert(r101_0, r101_16)
                end
              end
            end
          end
        end
      end
      local r101_17, r101_18 = pcall(mp.GetInlineScriptsFromCommandLine, r101_2)
      if r101_17 and r101_18 then
        for r101_19, r101_20 in ipairs(r101_18) do
          r101_20 = mp.ContextualExpandEnvironmentVariables(r101_20)
          if r101_20 then
            local r101_21 = mp.IsKnownFriendlyFile(r101_20, true, false)
            if r101_21 == nil or r101_21 == false then
              local r101_22 = false
              local r101_23 = 0
              local r101_24 = 0
              local r101_25 = MpCommon.PathToWin32Path(r101_20)
              if r101_25 and string.find(r101_25, "^[%a]:\\") then
                local r101_26 = sysio.IsPathAVExcluded(r101_25, false)
                local r101_27 = sysio.GetFileSize(r101_25)
                if sysio.IsFileExists(r101_25) then
                  local r101_28 = sysio.GetFileLastWriteTime(r101_25)
                  r101_28 = r101_28 / 10000000 - 11644473600
                  r101_24 = MpCommon.GetCurrentTimeT() - r101_28
                  local r101_29 = {}
                  r101_29.path = r101_20
                  r101_29.isAVExcluded = r101_26
                  r101_29.size = r101_27
                  r101_29.age = r101_24
                  table.insert(r101_0, r101_29)
                end
              end
            end
          end
        end
      end
    end
    local r101_30 = mp.GetParentProcInfo(p101_0)
    if not r101_30 then
      break
    end
    p101_0 = r101_30.ppid
  end
  return r101_0
end

function reportAVExcludedEntities()
  local r102_0 = bm.get_current_process_startup_info()
  local r102_1 = add_parents(r102_0)
  table.insert(r102_1, r102_0)
  local r102_2 = {}
  for r102_3, r102_4 in ipairs(r102_1) do
    local r102_5 = mp.GetProcessCommandLine(r102_4.ppid)
    if r102_5 then
      local r102_6, r102_7 = pcall(mp.GetExecutablesFromCommandLine, r102_5)
      if r102_6 and r102_7 then
        for r102_8, r102_9 in ipairs(r102_7) do
          r102_9 = mp.ContextualExpandEnvironmentVariables(r102_9)
          if r102_9 then
            local r102_10 = MpCommon.PathToWin32Path(r102_9)
            if r102_10 then
              local r102_11 = sysio.IsPathAVExcluded(r102_10, false)
              if r102_11 then
                table.insert(r102_2, r102_10)
              end
            end
          end
        end
      end
      local r102_12, r102_13 = pcall(mp.GetInlineScriptsFromCommandLine, r102_5)
      if r102_12 and r102_13 then
        for r102_14, r102_15 in ipairs(r102_13) do
          r102_15 = mp.ContextualExpandEnvironmentVariables(r102_15)
          if r102_15 then
            local r102_16 = MpCommon.PathToWin32Path(r102_15)
            if r102_16 then
              local r102_17 = sysio.IsPathAVExcluded(r102_16, false)
              if r102_17 then
                table.insert(r102_2, r102_16)
              end
            end
          end
        end
      end
    end
  end
  if next(r102_2) then
    r102_2 = table_dedup_caseinsensitive(r102_2)
    bm.add_related_string("AVExcludedEntities", safeJsonSerialize(r102_2), bm.RelatedStringBMReport)
  end
  return r102_2
end

function recursiveTriggerSig(p103_0, p103_1, p103_2, p103_3)
  bm.trigger_sig(p103_0, p103_1, p103_2)
  local r103_0, r103_1 = bm.get_process_relationships(p103_2)
  if r103_1 ~= nil and next(r103_1) ~= nil then
    local r103_2 = 1
    for r103_3, r103_4 in ipairs(r103_1) do
      if r103_4.ppid ~= nil and mp.bitand(r103_4.reason_ex, 1) == 1 and p103_3 + r103_2 < 500 then
        local r103_5, r103_6 = recursiveTriggerSig, p103_1
        local r103_7 = r103_4.ppid
        r103_6 = r103_6 .. ";" .. r103_7
        r103_5 = r103_5(p103_0, r103_6, r103_4.ppid, p103_3 + r103_2)
        r103_2 = r103_2 + r103_5
      end
    end
    return r103_2
  end
  return 1
end

function reportGenericRansomware(p104_0, p104_1)
  local r104_0 = {}
  local r104_1 = safeJsonDeserialize(p104_0)
  r104_0.gen_ransom_meta = r104_1
  r104_0.session_info = reportSessionInformation()
  p104_1 = p104_1 or false
  if p104_1 and versioning.IsSeville() then
    bm.set_detection_string(safeJsonSerialize(r104_0))
  end
  add_parents()
  if r104_1 ~= nil
    and r104_1.file_list ~= nil
    and r104_1.appended_ext ~= nil
    and r104_1.proc_info ~= nil
    and r104_1.magic_mismatch ~= nil then
    local r104_2 = bm.get_current_process_startup_info()
    r104_2 = r104_2 == nil and -2 or r104_2.ppid
    local r104_3 = "FileChain_SubSet:"
    bm.add_related_file(r104_1.cur_image_path)
    local r104_4 = bm.add_related_string
    local r104_5, r104_6 = r104_1.proc_info, r104_2
    local r104_7 = "old <" .. r104_5 .. "> new <" .. r104_6 .. ">"
    r104_5 = bm.RelatedStringBMReport
    r104_6 = nil
    r104_4("debug_proc_info", r104_7, r104_5)
    bm.add_related_string("ransom_extension", r104_1.appended_ext, bm.RelatedStringBMReport)
    bm.add_related_string("magic_mismatch", tostring(r104_1.magic_mismatch),
      bm.RelatedStringBMReport)
    local r104_8, r104_9, r104_10 = pairs(r104_1.file_list)
    for r104_11, r104_12 in r104_8, r104_9, r104_10 do
      local r104_13 = string.find
      r104_13 = r104_13(r104_12, "\\[^\\]*$") or 0
      local r104_14 = string.find(r104_12, ".", r104_13, true)
      if r104_14 ~= nil then
        local r104_15 = string.sub(r104_12, r104_13 + 1, r104_14 - 1)
        local r104_16 = r104_3
        local r104_17 = crypto.CRC32Buffer(-1, r104_15, 0, #r104_15)
        local r104_18 = r104_16 .. r104_17
        r104_16 = r104_18
        r104_17 = ";"
        r104_3 = r104_16 .. r104_17 .. string.sub(r104_12, r104_14 + 1) .. ";"
      end
    end
    bm.add_related_string("ransom_files_sub", r104_3, bm.RelatedStringBMReport)
    r104_8, r104_9 = pcall(reportBmInfo)
    if not r104_8 and r104_9 then
      bm.add_related_string("bmInfoFailReason", tostring(r104_9), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
  return mp.CLEAN
end

function isAttrBadMaceRep(p105_0)
  local function r105_0(p106_0)
    AppendToRollingQueue("MaceNoRep", p106_0, 1, 86400)
  end

  local function r105_1(p107_0)
    return IsKeyInRollingQueue("MaceNoRep", p107_0, true)
  end

  if p105_0 and (p105_0 == 28688 or p105_0 == 28674) then
    if mp.SIGATTR_LOG_SZ == 0 then
      return mp.CLEAN
    end
    reportHeaders({ "Host", "User-Agent" })
    local r105_2 = nil
    for r105_3 = mp.SIGATTR_LOG_SZ, 1, -1 do
      local r105_4 = sigattr_tail[r105_3]
      if p105_0 == 28688
        and r105_4.attribute == p105_0
        and r105_4.matched
        and r105_4.utf8p1
        and r105_4.np2 then
        r105_2 = string.format("%s:%d", r105_4.utf8p1, r105_4.np2)
        break
      end
      if p105_0 == 28674 and r105_4.attribute == p105_0 and r105_4.matched and r105_4.utf8p1 then
        r105_2 = r105_4.utf8p1
        break
      end
    end
    if r105_2 then
      if not r105_1(r105_2) and r0_2(r105_2) then
        return true
      end
      r105_0(r105_2)
      return false
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function maceSendConfig(p108_0)
  local r108_0 = GetRollingQueueKeys(p108_0)
  if r108_0 ~= nil and type(r108_0) == "table" then
    for r108_1, r108_2 in ipairs(r108_0) do
      local r108_3 = 512
      for r108_4 = 1, #r108_2, r108_3 do
        local r108_5 = string.format("mace_%d", r108_4 == 1 and r108_4 - 1 or (r108_4 - 1) / r108_3)
        local r108_6 = string.sub(r108_2, r108_4, r108_4 + r108_3 - 1)
        bm.add_related_string(r108_5, r108_6, bm.RelatedStringBMReport)
      end
      if versioning.IsSeville() then
        bm.set_detection_string(r108_2)
      end
      break
    end
  end
end

function reportRelatedBmHits()
  local r109_0 = mp.enum_mpattributesubstring("Behavior:")
  if r109_0 and #r109_0 > 0 then
    for r109_1, r109_2 in ipairs(r109_0) do
      bm.add_related_string("RelatedBMHits", r109_2, bm.RelatedStringBMReport)
    end
  end
end

function addChildrenAsThreat(p110_0)
  local r110_0 = p110_0
  if not (r110_0 and r110_0 ~= "") then
    local r110_1, r110_2 = pcall(bm.get_current_process_startup_info)
    if not (r110_1 and r110_2 and r110_2.ppid) then
      return
    end
    r110_0 = r110_2.ppid
  end
  local r110_3, r110_4, r110_5 = pcall(bm.get_process_relationships, r110_0)
  if not r110_3 then
    return
  end
  for r110_6, r110_7 in ipairs(r110_5) do
    pcall(bm.add_threat_process, r110_7.ppid)
  end
end

function takeMemorySnapshot(p111_0)
  local r111_0, r111_1 = pcall(bm.get_current_process_startup_info)
  if not (r111_0 and r111_1 and r111_1.ppid) then
    return
  end
  local r111_2 = mp.enum_mpattributesubstring("")
  local r111_3 = {}
  local r111_4 = ""
  for r111_5, r111_6 in ipairs(r111_2) do
    if not r111_3[r111_6] then
      r111_3[r111_6] = true
      r111_4 = r111_4 .. r111_6 .. ";"
    end
  end
  local r111_7 = bm.get_imagepath()
  local r111_8, r111_9 = bm.get_process_relationships()
  local r111_10, r111_11 = nil, nil
  if r111_8 then
    for r111_12, r111_13 in ipairs(r111_8) do
      local r111_14 = r111_13.image_path
      local r111_15 = r111_13.cmd_line
      local r111_16 = r111_13.reason_ex
      r111_10 = string.format("%d::%s::%s", r111_16, r111_14, r111_15)
      break
    end
  end
  if r111_9 then
    for r111_17, r111_18 in ipairs(r111_9) do
      local r111_19 = r111_18.image_path
      local r111_20 = r111_18.cmd_line
      local r111_21 = r111_18.reason_ex
      r111_11 = string.format("%d::%s::%s", r111_21, r111_19, r111_20)
      break
    end
  end
  local r111_22 = {
    v = 2, fr = MpCommon.IsFriendlyProcess(r111_1.ppid),
    pr = string.format("%s::%s", r111_7, r111_1.command_line), pa = r111_10, ch = r111_11,
    bh = r111_4, hs = p111_0
  }
  bm.add_related_string("mem_082e767d", safeJsonSerialize(r111_22), bm.RelatedStringBMReport)
end

function triggerMemoryScanOnProcessTree(p112_0, p112_1, p112_2, p112_3, p112_4)
  if bm.trigger_sig ~= nil and (p112_0 or p112_1) then
    local r112_0, r112_1 = pcall(bm.get_current_process_startup_info)
    if not r112_0 then
      return
    end
    local r112_2, r112_3, r112_4 = pcall(bm.get_process_relationships, r112_1.ppid)
    if not r112_2 then
      return
    end
    local r112_5 = "TriggerMemoryScan"
    local r112_6 = string.format("Delay:%d;Type:%s;Origin:%s;", p112_3, p112_2, p112_4)
    pcall(bm.trigger_sig, r112_5, r112_6, r112_1.ppid)
    if p112_1 then
      for r112_7, r112_8 in ipairs(r112_3) do
        pcall(bm.trigger_sig, r112_5, r112_6, r112_8.ppid)
      end
    end
    if p112_0 then
      for r112_9, r112_10 in ipairs(r112_4) do
        pcall(bm.trigger_sig, r112_5, r112_6, r112_10.ppid)
      end
    end
  end
end

function triggerMemQueryOnProcess(p113_0, p113_1, p113_2)
  local r113_0, r113_1, r113_2 = nil, "", ""
  local r113_3 = p113_2 or ""
  if p113_0 ~= nil and p113_0:sub(1, 4) == "pid:" then
    local r113_4 = "MemQueryTrigger:" .. p113_1
    r113_0 = p113_1
    local r113_5 = r113_3
    local r113_6 = "originsig:" .. r113_0 .. ";extradata:" .. r113_5
    if bm.trigger_sig == nil then
      local r113_7 = pcall
      local r113_8 = MpCommon
      r113_0 = nil
      r113_7(r113_8.BmTriggerSig, p113_0, r113_4, r113_6)
    else
      local r113_9 = pcall
      local r113_10 = bm
      r113_0 = nil
      r113_9(r113_10.trigger_sig, r113_4, r113_6, p113_0)
    end
  end
end

function setMalwareManifest(p114_0, p114_1)
  local r114_0 = "malware_manifest"
  p114_1 = p114_1 == 0 and 3600 or p114_1
  if #p114_0 > 0 then
    MpCommon.SetPersistContextNoPath(r114_0, p114_0, p114_1)
  end
end

function getMalwareManifest()
  local r115_0, r115_1 = "malware_manifest", nil
  if MpCommon.GetPersistContextCountNoPath(r115_0) > 0 then
    r115_1 = MpCommon.GetPersistContextNoPath(r115_0)
  end
  return r115_1
end

function isKnownFileExtension(p116_0, p116_1)
  if p116_0 == nil then
    return
  end
  local r116_0 = p116_0:match("%.[^/%.]+$")
  if r116_0 == nil then
    return
  end
  if p116_1 == nil or p116_1 == true then
    r116_0 = r116_0 .. '"'
  end
  local r116_1 = string.find('.cpt".gpg".enc".e"', r116_0, 1, true)
  if r116_1 then
    return false
  end
  return mp.GetExtensionClass(string.lower(r116_0)) ~= 0
end

function isMultiExtensionFileName(p117_0)
  if p117_0 == nil or p117_0 == "" then
    return false
  end
  return p117_0:match("%.[^/]-%.[^/]-$") ~= nil
end

function extractAllFileNameExtensions(p118_0)
  local r118_0 = {}
  for r118_1 in p118_0:gmatch("%.[^%.]+") do
    table.insert(r118_0, r118_1)
  end
  return r118_0, #r118_0
end

function isFileExtensionOfInterest(p119_0, p119_1)
  if p119_0 == nil then
    return false
  end
  local r119_0 = p119_0:match("%.[^/%.]+$")
  if r119_0 == nil then
    return false
  end
  if p119_1 == nil or p119_1 == true then
    r119_0 = r119_0 .. '"'
  end
  local r119_1 = mp.GetExtensionClass(string.lower(r119_0))
  if r119_1 == 4 or r119_1 == 0 then
    return false
  end
  return true
end

function GetExtensionClassEx(p120_0, p120_1)
  if p120_0 == nil then
    return
  end
  if p120_1 == nil or p120_1 == true then
    p120_0 = p120_0 .. '"'
  end
  return (mp.GetExtensionClass(p120_0))
end

function addRelatedProcess()
  local r121_0, r121_1, r121_2 = pcall(bm.get_process_relationships)
  if not r121_0 then
    return
  end
  for r121_3, r121_4 in ipairs(r121_1) do
    if r121_4.image_path ~= nil then
      bm.add_related_process(r121_4.ppid)
    end
  end
  for r121_5, r121_6 in ipairs(r121_2) do
    if r121_6.image_path ~= nil then
      bm.add_related_process(r121_6.ppid)
    end
  end
end

function IsProcessExcludedFromRansomwareAnalysis()
  local r122_0 = bm.get_current_process_startup_info()
  local r122_1 = bm.get_imagepath()
  if r122_0 ~= nil
    and r122_0.ppid ~= nil
    and r122_1 ~= nil
    and r122_0.command_line ~= nil
    and r122_0.command_line ~= "" then
    if IsExcludedByImagePath(r122_1) then
      return true
    end
    if r0_45(r122_1, r122_0.command_line) then
      return true
    end
    if isParentPackageManager(r122_0.ppid, false) then
      return true
    end
    return false
  end
  return true
end

function analyzeRansomwarePattern1()
  local r123_0 = mp.SIGATTR_LOG_SZ
  local r123_1 = {}
  local r123_2 = {}
  local r123_3 = {}
  local r123_4 = {}
  local r123_5, r123_6, r123_7, r123_8 = 150000000, 0, 0, 0
  if r123_5 < bm.GetSignatureMatchDuration() then
    return mp.CLEAN
  end
  if IsProcessExcludedFromRansomwareAnalysis() == true then
    return mp.CLEAN
  end
  local r123_9 = bm.get_imagepath()
  if r123_9 ~= nil and r123_9 ~= "" then
    for r123_10 = 1, r123_0 do
      if sigattr_tail[r123_10].attribute == 16384 then
        local r123_11 = sigattr_tail[r123_10].utf8p1
        local r123_12 = GetFileEntropy(r123_11)
        if r123_2[r123_11] == nil and r123_12 ~= nil and r123_12 >= 7 then
          r123_2[r123_11] = true
          local r123_13 = r123_11:match("%.[^/%.]+$")
          if isKnownFileExtension(r123_11) == false
            and IsRansomwareProcessImagePathExtensionExcluded(r123_9, r123_13) == false then
            bm.add_related_file(r123_11)
            if r123_13 ~= nil then
              if r123_1[r123_13] == nil then
                r123_6 = r123_6 + 1
                r123_1[r123_13] = 1
              else
                r123_1[r123_13] = r123_1[r123_13] + 1
              end
            end
            local r123_14 = r123_11:match("[^>]*[\\/$]")
            if r123_14 ~= nil then
              if r123_4[r123_14] == nil then
                r123_7 = r123_7 + 1
                r123_4[r123_14] = 1
              else
                r123_4[r123_14] = r123_4[r123_14] + 1
              end
            end
          end
        end
      end
    end
    if r123_6 == 0 then
      return mp.CLEAN
    end
    for r123_15 = 1, r123_0 do
      if sigattr_tail[r123_15].attribute == 16387 then
        local r123_16 = sigattr_tail[r123_15].utf8p1
        if r123_2[r123_16] == nil and r123_3[r123_16] == nil then
          bm.add_related_file(r123_16)
          r123_3[r123_16] = true
          local r123_17 = r123_16:match("%.[^/%.]+$")
          if isFileExtensionOfInterest(r123_16)
            and IsRansomwareProcessImagePathExtensionExcluded(r123_9, r123_17) == false then
            local r123_18 = r123_16:match("[^>]*[\\/$]")
            if r123_18 ~= nil and r123_4[r123_18] ~= nil then
              r123_8 = r123_8 + 1
              if r123_4[r123_18] == 1 then
                r123_4[r123_18] = nil
              else
                r123_4[r123_18] = r123_4[r123_18] - 1
              end
            end
          end
        end
      end
    end
    if r123_8 == 0 then
      return mp.CLEAN
    end
    local r123_19 = 0
    for r123_20, r123_21 in pairs(r123_1) do
      if r123_19 < r123_21 then
        r123_19 = r123_21
      end
    end
    if r123_6 == 1 and r123_19 >= 5 and r123_7 == 1 and r123_8 >= 5 then
      addRelatedProcess()
      reportRelatedBmHits()
      local r123_22 = safeJsonSerialize(r123_2)
      bm.add_related_string("file_metadata", r123_22, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    if r123_6 < 3 and r123_19 >= 10 and r123_7 >= 2 and r123_8 >= 3 then
      addRelatedProcess()
      reportRelatedBmHits()
      local r123_23 = safeJsonSerialize(r123_2)
      bm.add_related_string("file_metadata", r123_23, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function analyzeRansomwarePattern2(p124_0)
  local r124_0 = mp.SIGATTR_LOG_SZ
  local r124_1 = {}
  local r124_2 = {}
  local r124_3 = {}
  local r124_4, r124_5, r124_6 = 50000000, 0, 0
  if r124_4 < bm.GetSignatureMatchDuration() then
    return mp.CLEAN
  end
  if IsProcessExcludedFromRansomwareAnalysis() == true then
    return mp.CLEAN
  end
  local r124_7 = bm.get_imagepath()
  if r124_7 ~= nil and r124_7 ~= "" then
    for r124_8 = 1, r124_0 do
      if sigattr_tail[r124_8].attribute == 16386 then
        local r124_9 = sigattr_tail[r124_8].utf8p1
        local r124_10 = sigattr_tail[r124_8].utf8p2
        local r124_11 = r124_9:match("[^>]*[\\/$]")
        local r124_12 = r124_10:match("[^>]*[\\/$]")
        local r124_13 = r124_9:match("%.[^/%.]+$")
        local r124_14 = r124_10:match("%.[^/%.]+$")
        if r124_12 ~= nil
          and r124_11 ~= nil
          and r124_11 == r124_12
          and r124_13 ~= nil
          and r124_14 ~= nil
          and r124_14 ~= r124_13
          and r124_2[r124_9] == nil then
          r124_2[r124_9] = true
          if isFileExtensionOfInterest(r124_10)
            and isKnownFileExtension(r124_9) == false
            and IsRansomwareProcessImagePathExtensionExcluded(r124_7, r124_13) == false then
            local r124_15 = GetFileEntropy(r124_9)
            if r124_15 == nil then
              r124_2[r124_9] = -1
            else
              r124_2[r124_9] = r124_15
              if r124_15 >= 6 then
                bm.add_related_file(r124_9)
                if r124_13 ~= nil then
                  if r124_1[r124_13] == nil then
                    r124_5 = r124_5 + 1
                    r124_1[r124_13] = 1
                  else
                    r124_1[r124_13] = r124_1[r124_13] + 1
                  end
                end
                local r124_16 = r124_9:match("[^>]*[\\/$]")
                if r124_16 ~= nil then
                  if r124_3[r124_16] == nil then
                    r124_6 = r124_6 + 1
                    r124_3[r124_16] = 1
                  else
                    r124_3[r124_16] = r124_3[r124_16] + 1
                  end
                end
              end
            end
          end
        end
      end
    end
    if r124_5 == 0 then
      return mp.CLEAN
    end
    local r124_17 = 0
    for r124_18, r124_19 in pairs(r124_1) do
      if r124_17 < r124_19 then
        r124_17 = r124_19
      end
    end
    p124_0 = (p124_0 == nil or p124_0 < 1) and 2 or p124_0
    if r124_5 < 3 and r124_17 >= 10 and p124_0 <= r124_6 then
      addRelatedProcess()
      reportRelatedBmHits()
      local r124_20 = safeJsonSerialize(r124_2)
      bm.add_related_string("file_metadata", r124_20, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function analyzeRansomwarePattern4(p125_0)
  local r125_0 = mp.SIGATTR_LOG_SZ
  local r125_1 = {}
  local r125_2 = {}
  local r125_3 = {}
  local r125_4, r125_5, r125_6 = 150000000, 0, 0
  if r125_4 < bm.GetSignatureMatchDuration() then
    return mp.CLEAN
  end
  if IsProcessExcludedFromRansomwareAnalysis() == true then
    return mp.CLEAN
  end
  local r125_7 = bm.get_imagepath()
  if r125_7 ~= nil and r125_7 ~= "" then
    for r125_8 = 1, r125_0 do
      if sigattr_tail[r125_8].attribute == 16386 then
        local r125_9 = sigattr_tail[r125_8].utf8p1
        local r125_10 = sigattr_tail[r125_8].utf8p2
        local r125_11 = r125_9:match("[^>]*[\\/$]")
        local r125_12 = r125_10:match("[^>]*[\\/$]")
        local r125_13 = r125_9:match("%.[^/%.]+$")
        local r125_14 = r125_10:match("%.[^/%.]+$")
        if r125_12 ~= nil
          and r125_11 ~= nil
          and r125_11 == r125_12
          and r125_13 ~= nil
          and r125_14 ~= nil
          and r125_14 ~= r125_13
          and isFileExtensionOfInterest(r125_10)
          and IsRansomwareProcessImagePathExtensionExcluded(r125_7, r125_13) == false
          and r125_2[r125_9] == nil then
          local r125_15 = GetFileEntropy(r125_9)
          if r125_15 == nil then
            r125_2[r125_9] = -1
          else
            r125_2[r125_9] = r125_15
            if r125_15 >= 6 then
              bm.add_related_file(r125_9)
              if r125_1[r125_13] == nil then
                r125_5 = r125_5 + 1
                r125_1[r125_13] = 1
              else
                r125_1[r125_13] = r125_1[r125_13] + 1
              end
              if r125_3[r125_11] == nil then
                r125_6 = r125_6 + 1
                r125_3[r125_11] = 1
              else
                r125_3[r125_11] = r125_3[r125_11] + 1
              end
            end
          end
        end
      end
    end
    local r125_16 = 0
    for r125_17, r125_18 in pairs(r125_1) do
      if r125_16 < r125_18 then
        r125_16 = r125_18
      end
    end
    if r125_5 ~= 0 and (r125_6 ~= 1 or not (r125_16 < 15)) then
      p125_0 = (p125_0 == nil or p125_0 < 1) and 2 or p125_0
      if r125_5 < 3 and (r125_16 >= 15 and p125_0 <= r125_6 or r125_16 >= 20) then
        addRelatedProcess()
        reportRelatedBmHits()
        local r125_19 = safeJsonSerialize(r125_2)
        bm.add_related_string("file_metadata", r125_19, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
      return mp.CLEAN
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

local function r0_67(p126_0, p126_1, p126_2, p126_3)
  local r126_0, r126_1, r126_2 = 2, 15, 10
  local r126_3 = versioning.GetCloudBlockLevel
  r126_3 = r126_3() >= 4
  if p126_0 == "NEW_FILE_CREATED" then
    r126_0 = 3
  elseif p126_0 == "FILE_RENAMED_WITH_UNIQUE_EXTN" then
    if r126_3 then
      r126_1, r126_2 = 15, 5
    end
  elseif p126_0 == "FILE_RENAMED_WITH_KNOWN_EXTN" then
    if r126_3 then
      r126_1, r126_2 = 10, 5
    else
      r126_1, r126_2 = 20, 15
    end
  end
  if p126_1 ~= 0 and (p126_2 ~= 1 or not (p126_3 < r126_1)) then
    if p126_1 < 3
      and (r126_2 <= p126_3 and r126_0 <= p126_2
        or p126_0 ~= "NEW_FILE_CREATED" and r126_1 <= p126_3) then
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function analyzeRansomwarePattern5(p127_0, p127_1)
  if p127_0 ~= nil and p127_0 ~= "" and p127_1 ~= nil and p127_1 ~= "" then
    local r127_0 = {}
    local r127_1 = {}
    local r127_2 = {}
    local r127_3, r127_4 = 0, 0
    local r127_5 = p127_1 == "NEW_FILE_CREATED" and 10 or 5
    if MpCommon.GetPersistContextCountNoPath(p127_0) < r127_5 then
      return mp.CLEAN
    end
    local r127_6 = MpCommon.GetPersistContextNoPath(p127_0)
    if r127_6 ~= nil then
      local r127_7, r127_8, r127_9 = ipairs(r127_6)
      for r127_10, r127_11 in r127_7, r127_8, r127_9 do
        if r127_1[r127_11] == nil then
          local r127_12 = GetFileEntropy(r127_11)
          if r127_12 == nil then
            r127_1[r127_11] = -1
          else
            r127_1[r127_11] = r127_12
            if r127_12 >= 6 then
              local r127_13 = r127_11:match("%.[^/%.]+$")
              bm.add_related_file(r127_11)
              if r127_13 ~= nil then
                if r127_0[r127_13] == nil then
                  r127_3 = r127_3 + 1
                  r127_0[r127_13] = 1
                else
                  r127_0[r127_13] = r127_0[r127_13] + 1
                end
              end
              local r127_14 = r127_11:match("[^>]*[\\/$]")
              if r127_14 ~= nil then
                if r127_2[r127_14] == nil then
                  r127_4 = r127_4 + 1
                  r127_2[r127_14] = 1
                else
                  r127_2[r127_14] = r127_2[r127_14] + 1
                end
              end
            end
          end
        end
      end
    end
    local r127_15 = 0
    local r127_16, r127_17, r127_18 = pairs(r127_0)
    for r127_19, r127_20 in r127_16, r127_17, r127_18 do
      if r127_15 < r127_20 then
        r127_15 = r127_20
      end
    end
    r127_16 = r0_67(p127_1, r127_3, r127_4, r127_15)
    if r127_16 == mp.INFECTED then
      addRelatedProcess()
      reportRelatedBmHits()
      local r127_21 = safeJsonSerialize(r127_1)
      bm.add_related_string("file_metadata", r127_21, bm.RelatedStringBMReport)
      bm.add_related_string("process_context", p127_0, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function bm_AddRelatedFileFromCommandLine(p128_0, p128_1, p128_2, p128_3, p128_4)
  if p128_0 == nil or #p128_0 <= 0 then
    return
  end
  if string.lower(p128_0) == "bm" then
    local r128_0 = bm.get_current_process_startup_info().ppid
    if r128_0 ~= nil then
      p128_0 = mp.GetProcessCommandLine(r128_0)
      if not p128_0 then
        return
      end
      p128_0 = string.lower(p128_0)
    end
  end
  local r128_1 = get_filepaths_from_string(p128_0, nil, true)
  for r128_2 in p128_0:gmatch("[a-zA-Z]:\\[^%s]+") do
    table.insert(r128_1, r128_2)
  end
  for r128_3, r128_4 in p128_0:gmatch("(['\"])([a-zA-Z]:\\.-)%1") do
    table.insert(r128_1, r128_4)
  end
  if p128_3 ~= nil and mp.bitand(p128_3, 8) == 8 and string.find(p128_0, ",", 1, true) then
    local r128_5, r128_6 = string.gsub(p128_0, ",", "")
    if r128_6 <= 20 then
      for r128_7 in (string.gmatch(p128_0, "[^,]+")) do
        local r128_8 = string.gsub(r128_7, "^%s+", "")
        r128_7 = r128_8
        r128_8 = string
        r128_8 = r128_8.gsub
        r128_8 = r128_8(r128_7, "%s+$", "")
        r128_7 = r128_8
        r128_8 = table
        r128_8 = r128_8.insert
        r128_8(r128_1, r128_7)
      end
    end
  end
  if r128_1 == nil or #r128_1 <= 0 then
    return
  end
  local r128_9 = type(p128_1)
  local r128_10 = p128_2 == nil and 4 or p128_2
  local r128_11 = {}
  for r128_12, r128_13 in ipairs(r128_1) do
    if p128_3 ~= nil and mp.bitand(p128_3, 1) == 1 then
      r128_13 = mp.ContextualExpandEnvironmentVariables(r128_13)
    end
    if sysio.IsFileExists(r128_13) then
      local r128_14 = false
      if r128_9 == "table" then
        if r128_10 < string.len(r128_13) and p128_1[string.sub(r128_13, -r128_10)] then
          r128_14 = true
        end
      elseif not (r128_9 == "string"
        and (not (r128_10 < string.len(r128_13))
          or not string.find(p128_1, string.sub(r128_13, -r128_10), 1, true))) then
        r128_14 = true
      end
      local r128_15
      if r128_14 == true and p128_3 ~= nil and mp.bitand(p128_3, 16) == 16 then
        r128_15 = false
        local r128_16, r128_17 = -1, -1
        local r128_18 = MpCommon.GetPersistContext(r128_13)
        if r128_18 ~= nil then
          for r128_19, r128_20 in ipairs(r128_18) do
            local r128_21 = string.find(r128_20, "Age:", 1, true)
            if r128_21 ~= nil then
              local r128_22 = tonumber(string.match(r128_20, "^Age:([0-9]+)$"))
              if r128_22 ~= nil and r128_16 < r128_22 then
                r128_16 = r128_22
              end
            end
            local r128_23 = string.find(r128_20, "Prevalence:", 1, true)
            if r128_23 ~= nil then
              local r128_24 = tonumber(string.match(r128_20, "^Prevalence:([0-9]+)$"))
              if r128_24 ~= nil and r128_17 < r128_24 then
                r128_17 = r128_24
              end
            end
          end
        end
        if r128_16 > -1 and r128_16 <= 1 and r128_17 > -1 and r128_17 <= 100 then
          r128_15 = true
        end
      else
        r128_15 = r128_14
      end
      local r128_25
      if r128_15 == true and p128_3 ~= nil then
        if mp.bitand(p128_3, 32) == 32 or mp.bitand(p128_3, 64) == 64 then
          r128_25 = false
          if p128_4 ~= nil and type(p128_4) == "table" then
            local r128_26 = true
            local r128_27 = mp.bitand(p128_3, 64)
            r128_26 = r128_27 ~= 64 and r128_26

            function r128_27(p129_0, p129_1)
              if p129_0 ~= nil and not (#p129_0 <= 3) then
                local r129_0 = MpCommon.GetPersistContextCount(p129_0)
                if r129_0 ~= nil and not (r129_0 <= 0) then
                  if MpCommon.QueryPersistContext(p129_0, p129_1) then
                    return true
                  end
                  return false
                end
                return false
              end
              return false
            end

            local r128_28, r128_29, r128_30 = ipairs(p128_4)
            for r128_31, r128_32 in r128_28, r128_29, r128_30 do
              local r128_33 = r128_27
              r128_33 = r128_33(r128_13, r128_32)
              if r128_33 == true then
                r128_25 = true
                if r128_26 == false then
                  break
                end
              elseif r128_26 == true then
                r128_25 = false
                break
              end
            end
          end
        else
          r128_25 = r128_15
        end
      else
        r128_25 = r128_15
      end
      if r128_25 == true then
        if p128_3 == nil or mp.bitand(p128_3, 2) ~= 2 then
          if p128_3 == nil or mp.bitand(p128_3, 4) ~= 4 then
            bm.add_related_file(r128_13)
            table.insert(r128_11, r128_13)
          else
            bm.add_threat_file(r128_13)
            table.insert(r128_11, r128_13)
          end
        else
          local r128_34 = mp.IsKnownFriendlyFile(r128_13, true, true)
          if r128_34 == nil or r128_34 == false then
            local r128_35 = mp.bitand(p128_3, 4)
            if r128_35 == 4 then
              bm.add_threat_file(r128_13)
            else
              bm.add_related_file(r128_13)
            end
            r128_35 = table
            r128_35.insert(r128_11, r128_13)
          end
        end
      end
    end
  end
  if not (#r128_11 >= 1) then
    return
  end
  return r128_11
end

function GetFileEntropy(p130_0, p130_1)
  if p130_0 ~= nil and p130_0 ~= "" then
    if sysio.IsFileExists(p130_0) == false then
      return nil
    end
    local r130_0 = sysio.GetFileSize(p130_0)
    if r130_0 then
      r130_0 = r130_0 < 65536 and r130_0 or 65536
      p130_1 = p130_1 and p130_1 < r130_0 and p130_1 or r130_0
      local r130_1 = sysio.ReadFile(p130_0, 0, p130_1)
      if r130_1 == nil then
        return nil
      end
      return crypto.ComputeEntropy(r130_1)
    end
    return nil
  end
  return nil
end

function contains(p131_0, p131_1, p131_2)
  if type(p131_0) == "string" then
    p131_2 = type(p131_2) == "nil" or p131_2
    if p131_2 ~= nil and type(p131_2) ~= "boolean" then
      return false
    end
    if type(p131_1) ~= "table" and type(p131_1) ~= "string" then
      return false
    end
    local r131_0 = type(p131_1)
    p131_1 = r131_0 == "string" and { p131_1 } or p131_1
    r131_0 = pairs
    for r131_1, r131_2 in r131_0(p131_1) do
      if p131_2 then
        local r131_3 = r131_2:lower()
        r131_2 = r131_3
        local r131_4 = p131_0
        r131_3 = r131_4.lower
        r131_3 = r131_3(r131_4)
        p131_0 = r131_3
      end
      local r131_5 = string.find(p131_0, r131_2, 1, p131_2)
      if r131_5 then
        return true
      end
    end
    return false
  end
  return false
end

function containsall(p132_0, p132_1, p132_2)
  if type(p132_0) == "string" then
    if type(p132_2) == "nil" then
      p132_2 = true
    elseif type(p132_2) ~= "boolean" then
      return false
    end
    if type(p132_1) ~= "table" and type(p132_1) ~= "string" then
      return false
    end
    local r132_0 = type(p132_1)
    p132_1 = r132_0 == "string" and { p132_1 } or p132_1
    r132_0 = pairs
    for r132_1, r132_2 in r132_0(p132_1) do
      local r132_3 = p132_0
      if p132_2 then
        local r132_4 = r132_2:lower()
        r132_2 = r132_4
        local r132_5 = r132_3
        r132_4 = r132_5.lower
        r132_4 = r132_4(r132_5)
        r132_3 = r132_4
      end
      local r132_6 = string.find(r132_3, r132_2, 1, p132_2)
      if not r132_6 then
        return false
      end
    end
    return true
  end
  return false
end

function NormalizeCmdline(p133_0, p133_1)
  local r133_0 = p133_1
  if type(p133_0) == "string" and type(p133_1) == "string" then
    if p133_1 == "" then
      return r133_0
    end

    local function r133_1(p134_0)
      local r134_0, r134_1, r134_2, r134_3 = "", "", 1, 1
      while true do
        local r134_4, r134_5, r134_6 = string.find(p134_0, "%[char%]%((%d+)%)", r134_3)
        r134_3 = r134_5
        if not r134_4 then
          break
        end
        r134_4 = r134_0
        r134_0 = r134_4 .. string.char(tonumber(r134_6))
      end
      local r134_7
      if r134_0 == "" then
        r134_7 = p134_0
      else
        r134_7 = r134_0 or p134_0
      end
      return r134_7
    end

    if p133_0 == "cmd" then
      if string.find(p133_1, "^", 1, true) then
        local r133_2 = string.gsub(p133_1, "^", "")
        r133_2 = string.gsub(r133_2, "%s+", " ")
        r133_2 = string.lower(r133_2)
        r133_0 = r133_2
      end
    elseif p133_0 == "powershell" then
      local r133_3 = p133_1
      local r133_4 = false
      if string.find(r133_3, "`", 1, true) then
        r133_3, r133_4 = string.gsub(r133_3, "`", ""), true
      end
      if string.find(r133_3, '""', 1, true) then
        r133_3, r133_4 = string.gsub(r133_3, '""', ""), true
      end
      if string.find(r133_3, '"+"', 1, true) then
        r133_3, r133_4 = string.gsub(r133_3, '"%+"', ""), true
      end
      if string.find(r133_3, "','", 1, true) then
        r133_3, r133_4 = string.gsub(r133_3, "'%,'", ""), true
      end
      if string.find(r133_3, "'+'", 1, true) then
        r133_3, r133_4 = string.gsub(r133_3, "'%+'", ""), true
      end
      if string.find(r133_3, "%[char%]%(%d+%)") then
        r133_3, r133_4 = r133_1(r133_3), true
      end
      local r133_5 = string.match
      r133_5 = r133_5(r133_3, '[%-/][eE][ncodemaNCODEMA]*%s+"?%s*([A-Za-z0-9/%+=]+)')
        or string.match(r133_3, '–[eE][ncodemaNCODEMA]*%s+"?%s*([A-Za-z0-9/%+=]+)')
      if r133_5 then
        local r133_6 = MpCommon.Base64Decode(r133_5)
        if not r133_6 then
          return r133_3
        end
        r133_6 = string.gsub(r133_6, "%z", "")
        r133_6 = string.lower(r133_6)
        r133_6 = string.gsub(r133_6, "^%s+", "")
        r133_6 = string.gsub(r133_6, "%s+$", "")
        r133_6 = string.gsub(r133_6, "%s+", " ")
        r133_6 = string.gsub(r133_6, "`", "")
        r133_6 = r0_3(r133_6, { "+" })
        r133_6 = string.gsub(r133_6, " *, *", ",")
        r133_0 = r133_6
      elseif r133_4 then
        r133_0 = r133_3
      end
    end
    return r133_0
  end
  return r133_0
end

function analyzeRansomNotePattern(p135_0)
  local r135_0 = nil
  local r135_1 = mp.SIGATTR_LOG_SZ
  local r135_2 = {}
  if p135_0 == nil then
    return mp.CLEAN
  end
  local r135_3 = "ransom_note_pattern_"
  r135_0 = p135_0
  r135_3 = r135_3 .. r135_0
  local r135_4 = bm
  r135_0 = nil
  local r135_5 = r135_4.get_current_process_startup_info()
  if r135_5 == nil then
    return mp.CLEAN
  end
  local r135_6 = r135_5.ppid
  if r135_6 ~= nil and r135_6 ~= "" then
    if IsProcessExcludedFromRansomwareAnalysis() == true then
      return mp.CLEAN
    end
    for r135_7 = 1, r135_1 do
      if sigattr_tail[r135_7].attribute == 16384 then
        local r135_8 = sigattr_tail[r135_7].utf8p1
        if r135_8 == nil or r135_8 == "" then
          return mp.CLEAN
        end
        if r135_2[r135_8] == nil then
          r135_2[r135_8] = true
          if r0_4(r135_8, p135_0) ~= true then
            return mp.CLEAN
          end
          local r135_9 = r0_5
          local r135_10 = {}
          local r135_11 = r135_8
          r135_10[1] = r135_11
          r135_11 = 180
          r135_9(r135_6, r135_3, r135_10, r135_11)
        end
      end
    end
    local r135_12 = {}
    local r135_13 = r0_6(r135_6, r135_3)
    if r135_13 ~= nil then
      for r135_14, r135_15 in ipairs(r135_13) do
        bm.add_related_file(r135_15)
        local r135_16, r135_17 = r135_15:match("[^>](.-)([^\\/]-%.?([^%.\\/]*))$")
        if r135_16 ~= nil and r135_17 ~= nil then
          if not r135_12[r135_17] then
            r135_12[r135_17] = {}
          end
          local r135_18 = r135_12[r135_17]
          if not r135_18[r135_16] then
            r135_12[r135_17][r135_16] = true
          end
          local r135_19 = 0
          for r135_20 in pairs(r135_12[r135_17]) do
            r135_19 = r135_19 + 1
          end
          if r135_19 >= 5 then
            reportRelatedBmHits()
            addRelatedProcess()
            bm.add_related_string("file_metadata", r135_17, bm.RelatedStringBMReport)
            return mp.INFECTED
          end
        end
      end
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function analyzeEsxcliProcessPattern(p136_0)
  local r136_0 = {}
  local r136_1 = 60
  if p136_0 == nil then
    return mp.CLEAN
  end
  local r136_2 = "esxcli_pattern_ctx"
  if MpCommon.GetPersistContextCountNoPath(r136_2) > 0 then
    local r136_3 = MpCommon.GetPersistContextNoPath(r136_2)
    local r136_4 = 1
    if r136_3 ~= nil then
      for r136_5, r136_6 in ipairs(r136_3) do
        bm.add_related_string("escxli_cmd", r136_6, bm.RelatedStringBMReport)
        r136_4 = r136_4 + 1
        if r136_4 >= 3 then
          reportRelatedBmHits()
          addRelatedProcess()
          return mp.INFECTED
        end
      end
    end
  else
    MpCommon.SetPersistContextNoPath(r136_2, { p136_0 }, r136_1)
    bm.add_related_string("escxli_cmd", p136_0, bm.RelatedStringBMReport)
  end
  return mp.CLEAN
end

function GetFileName(p137_0, p137_1)
  if type(p137_0) ~= "string" then
    return
  end
  local r137_0 = p137_0:match("([^\\]+)$")
  if p137_1 == false then
    return r137_0
  end
  return r137_0:lower()
end

function QueryProcContext(p138_0, p138_1)
  if type(p138_0) ~= "table" then
    return
  end
  p138_1 = next(p138_1) == nil and { min = 0, max = 1 }
    or p138_1 == nil and { min = 0, max = 1 }
    or type(p138_1) ~= "table" and { min = 0, max = 1 }
    or p138_1
  if p138_1 ~= nil
    and (type(p138_1.min) ~= "number"
      or type(p138_1.max) ~= "number"
      or not (p138_1.min <= p138_1.max)) then
    return
  end
  local r138_0 = {
    outlook = { id = "EMAILCLIENT" }, thunderbird = { id = "EMAILCLIENT" },
    wlmail = { id = "EMAILCLIENT" }, edge = { id = "BROWSER" }, msedge = { id = "BROWSER" },
    iexplore = { id = "BROWSER" }, chrome = { id = "BROWSER" }, firefox = { id = "BROWSER" },
    opera = { id = "BROWSER" }, winword = { id = "OFFICE" }, excel = { id = "OFFICE" },
    powerpnt = { id = "OFFICE" }, mspub = { id = "OFFICE" }, wscript = { id = "SCRIPTENG" },
    cscript = { id = "SCRIPTENG" }, mshta = { id = "SCRIPTENG" }, powershell = { id = "SCRIPTENG" },
    pwsh = { id = "SCRIPTENG" }, java = { id = "JAVA" }, javaw = { id = "JAVA" },
    javaws = { id = "JAVA" }, msiexec = { id = "MSI" }, wmiprvse = { id = "WMI" },
    wmic = { id = "WMI" }, cmd = { id = "CMD" }, rundll32 = { id = "RUNDLL" },
    regsvr32 = { id = "REGSVR32" }, reg = { id = "REGUTIL" }, wabmig = { id = "WABMIG" }
  }
  local r138_1 = {}
  r138_1 = add_parents(nil, p138_1.max, nil)
  if next(r138_1) == nil then
    return
  end
  local r138_2 = {}
  for r138_3, r138_4 in ipairs(r138_1) do
    if r138_4.image_path ~= nil then
      local r138_5 = GetFileName(r138_4.image_path)
      local r138_6 = r138_5
      r138_5 = r138_6.gsub
      r138_6 = r138_0[r138_5(r138_6, ".exe$", "")]
      if r138_6 ~= nil and r138_6.id ~= nil then
        for r138_7, r138_8 in ipairs(p138_0) do
          if r138_8 == r138_6.id and p138_1.min <= r138_3 and p138_1.max >= r138_3 then
            r138_2[r138_3] = r138_6.id
          end
        end
      end
    end
  end
  if next(r138_2) == nil then
    return false
  end
  return r138_2
end

function isKnownRansomExtension(p139_0)
  local r139_0 = '".ccryptor".darkside".ecrypt".crypt".readme_to_restore".kimcilware".lilocked".encrypted".pysa".rhkrc".qoxaq".naixq".7rspj".redrum".grinch".thanos".21k5p".ryk".shutdown57".gnncry".itssoeasy"._locked".akira".avos".avos2".avos2j".avoslinux".avos2j".ifire".kitty".basta".blackbyte".blacksuit".cerber".cerber2".cerber3".conti".cryptolocker".coaq".cosakos".cuba".cymcrypt".dark_power".devil".dharma".eight".encryptedyourfiles".enigma".everest".fargo".foty".fs0ciety".gatz".gazprom".hack0".itlock3".itlock4".jyos".karma".kigatsu".kitz".l0cked".lockbit".locky".mallox".malox".medusa".met@n".neqp".niwm".nokonoko".nokoyawa".pandora".play".proton".qotr".quantum".ranzylocked".rook".royal".royal_w".royal_u".rsnslocked".shino".thor".tury".venus".v-society".weon".wikon".wncry".wncryt".zatp".zepto".slnya"._locked".akira".avdn".avos".avos2".babuk2".basta".blackbyte".blacksuit".babyk".cerber".cerber2".cerber3".ciop".c_i0p".cryptolocker".coaq".cosakos".cuba".cymcrypt".dark_power".devil".dharma".eight".encryptedyourfiles".enigma".everest".fargo".foty".fs0ciety".gatz".gazprom".hack0".itlock3".itlock4".jyos".karma".kigatsu".kitz".l0cked".lockbit".locky".mallox".malox".medusa".met@n".neqp".niwm".nokonoko".nokoyawa".pandora".play".proton".qotr".quantum".ranzylocked".rook".royal".royal_w".rsnslocked".shino".thor".tury".venus".v-society".weon".wikon".wncry".wncryt".zatp".zepto".rhysida".nukrypt".__nist_k571__".73i87a".7h9r".8base".8lock8".___xratteamlucked".__airacropencrypted!"._airacropencrypted".a5zfn".abyss".aes256".aesir".alcatraz".amba".angelamerkel".angleware".antihacker2017".ap19".barrax".bart".better_call_saul".bianlian".bitstak".blackbit".blackbytent".blackrock".bleepyourfiles".bloc".blocatto".bluesky".braincrypt".breaking_bad".bript".btc-help-you".btcbtcbtc".btcware".cccrrrppp".chifrator@qq_com".ci0p".cifgksaffsfyghd".cl0p".clop".comrade".coverton".crab".crashed".crime".crinf".criptiko".criptokod".cripttt".crjoker".crptrgr".crptxxx".crrrt".cryeye".cryp1".crypt12".crypt38".crypte".crypted".crypted_file".crypto".cryptoshield".cryptotorlocker2015!".cryptowall".cryptz".crypz".crysis".cts0".cts1".cts2".cts3".cts4".cts5".cts6".cts7".cts8".cts9".cyber".czvxce".d0nut".d4nk".da_vinci_code".dagoned".dale".damage".darkbit".darkness".dcrypt".decrypt2017".ded".deria".disappeared".domino".doomed".dxxd".dyatel@qq_com".edgel".eking".elbie".encedrsa".enciphered".encmywork".encoderpass".encrypted_by_lltp".encrypted_by_lltpp".encryptedaes".encryptedrsa".evillock".exotic".fantom".fargo3".faust".fear".fenixiloveyou!!".file0locked".fileiscryptedhard".filock".firecrypt".flocked".fog".frtrss".fuck".fucked".fuckyourdata".fun".gaza".gefickt".genesis15".gruzin@qq_com".h3ll".ha3".hannah".hb15".helpdecrypt@ukr.net".helpmeencedfiles".herbst".hnumkhotep".hush".iaufkakfhsaraf".ifuckedyou".inc".infected".isis".iwanthelpuuu".justbtcwillhelpyou".kencf".keyh0les".keyz".killedxxx".kimcilware".kirked".korrektor".kostya".kr3".kraken".kratos".lambda_l0cked".lcked".lechiffre".legion".lesli".letmetrydecfiles".licked".limpopo".lock93".locked-by-mafia".locklock".lol!".lorenz.sz40".lovewindows".madebyadam".magic".makop".maktub".maya".merry".micro".mole".mrcr1".nalog@qq_com".nemo-hacks.at.sigaint.org".nevada".no_more_ransom".nochance".noproblemwedecfiles".notfoundrans".nuclear55".odcodc".odin".omg!".onion".only-we_can_help_you".oops".openforyou@india.com".oplata@qq_com".oshit".osiris".otherinformation".p5tkjw".padcrypt".paybtcs".paym".paymrss".payms".paymst".paymts".payransom".payrms".payrmts".pr0tect".paytounlock".payuranson".pegs".pizda@qq_com".poar2w".poop".porno".potato".powerfulldecrypt".pubg".purge".puuuk".radamant".rare1".razy".rdmk".redkrypt".rekt".relock@qq_com".remind".revenge".rmcm1".rnsmwr".rokku".rsplited".sage".sanction".securecrypted".serpent".sexy".shit".sifreli".silent".snake".spora".stn".surprise".sz40".tent".thetrumplockerf".thetrumplockerfp".theworldisyours".threeamtime".tkoinprz".toxcrypt".troyancoder@qq_com".trun".tzu".uk-dealer@sigaint.org".unavailable".unlockvt@india.com".v-s0ciety".v1ceso0ciety".vbransom".velikasrbija".vendetta".vendetta2".venusf".venusp".versiegelt".vforvendetta".vicesociety".vindows".vscrypt".vsociety".vxlock".wallet".wcry".weareyourfriends".weencedufiles".wflx".whereisyourfiles".wisz".yourransom".z81928819".safepay".zc3791".zcrypt".zino".zorro".zxz".zyklon".8baselocked".hunter".lynx".lockedttx".x2anylock".dlock".nilson".int3r1ock".nitrogen".4rc3twm".encrypted.lock"'
  if p139_0 ~= nil and p139_0 ~= "" then
    if string.sub(p139_0, 1, 1) == "." then
      p139_0 = '"' .. p139_0 .. '"'
      if string.find(r139_0, p139_0, 1, true) then
        return true
      end
      return false
    end
    return false
  end
  return false
end

function IsPathIncludedLinuxRansomCheck(p140_0)
  if p140_0 ~= nil and p140_0 ~= "" then
    local r140_0 = {
      "/var/spool/exim4/", "/var/log/exim/", "/etc/apache2/", "/var/log/apache2/", "/var/www/",
      "/data/www/", "/etc/nginx/", "public_html/", "/srv/www/", "/etc/httpd/", "/srv/http/",
      "/var/lib/redis/", "/var/opt/redislabs/", "/data/db/", "/var/db/", "/.git/", "/.svn/",
      "/usr/share/nginx", "/vmfs/volumes/"
    }
    for r140_1, r140_2 in pairs(r140_0) do
      if r140_2 ~= nil and string.find(p140_0, r140_2, 1, true) then
        return true
      end
    end
    return false
  end
  return false
end

function reportTimingData()
  local r141_0 = {}
  local r141_1 = bm.get_current_process_startup_info()
  r141_0.current_time = MpCommon.GetCurrentTimeT()
  local r141_2, r141_3 = string.match(r141_1.ppid, "pid:(%w+),ProcessStart:(%w+)")
  local r141_4 = bm.get_imagepath()
  local r141_5
  if r141_4 == nil then
    r141_5 = nil
  else
    local r141_6 = r141_4:lower()
    local r141_7, r141_8 = pcall(MpCommon.PathToWin32Path, r141_6)
    r141_6 = r141_8
    if r141_7 and r141_6 ~= nil then
      local r141_9, r141_10 = pcall(sysio.GetFileLastWriteTime, r141_6)
      r141_5 = r141_10
      if r141_9 and r141_5 then
        r141_5 = r141_5 / 10000000 - 11644473600
      end
    else
      r141_5 = nil
    end
  end
  r141_0.pid = r141_2
  r141_0.last_write_time = r141_5
  r141_0.startTime = tonumber(r141_3) / 10000000 - 11644473600
  local r141_11 = r141_0.current_time
  local r141_12 = r141_0.startTime
  r141_0.time_delta = r141_11 - r141_12
  r141_11 = bm.get_sig_count
  r141_12 = nil
  r141_11 = r141_11()
  r141_0.sig_count = r141_11
  r141_11 = bm
  r141_11 = r141_11.add_related_string
  r141_11("timing", safeJsonSerialize(r141_0), bm.RelatedStringBMReport)
  return r141_0
end

function IsExcludedByImagePathMacOS(p142_0)
  if p142_0 ~= nil and p142_0 ~= "" then
    local r142_0 = p142_0:lower()
    local r142_1 = { "/usr/libexec/plistbuddy", "/usr/sbin/sshd" }
    for r142_2, r142_3 in pairs(r142_1) do
      if r142_3 ~= nil and string.find(r142_0, r142_3, 1, true) == 1 then
        return false
      end
    end
    local r142_4 = {
      "/system/", "/library/apple/", "/usr/local/jamf/bin/jamf",
      "/library/application support/microsoft/", "/sbin/launchd", "/usr/libexec/", "/usr/sbin/",
      "/sbin/", "/library/developer/privateframeworks/",
      "/private/var/db/com.apple.xpc.roleaccountd.staging",
      "/applications/google chrome.app/contents/macos/google chrome",
      "/opt/homebrew/library/homebrew", "/applications/company portal.app/",
      "/applications/brave browser.app/contents/macos/", "/usr/local/libexec/amazon-ena-ethernet",
      "/applications/utilities/adobe creative cloud experience/",
      "/library/intune/microsoft intune agent.app/", "/applications/microsoft defender.app/",
      "/applications/microsoft powerpoint.app/", "/opt/aws/ssm/bin/amazon-ssm-agent",
      "/opt/aws/ssm/bin/ssm-agent-worker", "/opt/aws/ssm/bin/ssm-document-worker",
      "/opt/aws/ssm/update/amazon-ssm-agent-updater", "/private/var/log/amazon/ssm/",
      "/usr/local/libexec/ec2-macos-init", "/applications/globalprotect.app/contents/resources",
      "/applications/onedrive.app/contents/standaloneupdater.app/contents/macos/onedrivestandaloneupdater",
      "/library/application support/adobe/adobegcclient/adobegcclient.app/contents/macos/adobegcclient",
      "/library/application support/adobe/adobe desktop common/lcc/adobe_licensing_helper.app/contents/macos/adobe_licensing_helper"
    }
    for r142_5, r142_6 in pairs(r142_4) do
      if r142_6 ~= nil and string.find(r142_0, r142_6, 1, true) == 1 then
        return true
      end
    end
    return false
  end
  return true
end

function IsAdhocMacOSExcluded(p143_0)
  if p143_0 ~= nil and p143_0 ~= "" then
    if IsExcludedByImagePathMacOS(p143_0) then
      return true
    end
    if string.find(p143_0, ".dylib", -6, true)
      or string.find(p143_0, ".so", -3, true)
      or string.find(p143_0, "__python_generated_allocator_preload", 1, true)
      or string.find(p143_0, "/private/tmp/strip%.[^/]+$", 1, false)
      or string.find(p143_0, "/private/tmp/bitcode_strip%.[^/]+$", 1, false)
      or string.find(p143_0, "PPRiskMagnes.framework/PPRiskMagnes$", 1, false)
      or string.find(p143_0, "/private/tmp/_MEI.*/Python3$", 1, false)
      or string.find(p143_0, "/private/tmp/_MEI.*[^/]+/Python$", 1, false)
      or string.find(p143_0, "/private/tmp/br%w%w%w%w%w%w$", 1, false)
      or string.find(p143_0, "/private/tmp/PKInstallSandbox.*/tmp/br%w%w%w%w%w%w$", 1, false)
      or string.find(p143_0, "/private/tmp/mcs/runner", 1, true)
      or string.find(p143_0, "/private/tmp/mcs/assets/", 1, true)
      or string.find(p143_0, ".o", -2, true)
      or string.find(p143_0, "/private/tmp/PKInstallSandbox[^/]+/tmp/qlist$", 1, false)
      or string.find(p143_0, "/private/tmp/oe-kandji/miniconda/.*/appkit_launcher_x86_64$", 1, false)
      or string.find(p143_0, "/target/debug/build/.*/build-script-build$", 1, false)
      or string.find(p143_0, "/private/tmp/monorepo/bazel_disk_cache/", 1, true)
      or string.find(p143_0, "/private/tmp/.cache/bazel/", 1, true)
      or string.find(p143_0, "conftest.dSYM/Contents/Resources/DWARF/conftest", 1, true)
      or string.find(p143_0, ".pcm", -4, true)
      or string.find(p143_0, "/bazel_disk_cache/tmp/", 1, true)
      or string.find(p143_0, "/private/tmp/build-cache/tmp/", 1, true)
      or string.find(p143_0, "/private/tmp/bazel-sandbox/", 1, true)
      or string.find(p143_0, "/private/tmp/homebrew-unpack/", 1, true)
      or string.find(p143_0, "/private/tmp/bazel-sandbox.[^/]+/darwin-sandbox", 1, false)
      or string.find(p143_0, "/private/tmp/AV%-%d+%-%d+%-%d+", 1, false)
      or string.find(p143_0, "/Users/[^/]+/Epic Games/[^/]+/.egstore/", 1, false)
      or string.find(p143_0, "/private/tmp/fbcode_.*/CMakeFiles/CMakeTmp/", 1, false)
      or string.find(p143_0, "/private/tmp/rustc[^/]+/lib.rmeta$", 1, false)
      or string.find(p143_0, "^/private/var/folders/.*/ilastik-[^/]+/Contents/ilastik-release/bin/",
        1, false)
      or string.find(p143_0, "/Volumes/SSD/JUser/.*/Intermediate/Build/IOS", 1, false)
      or string.find(p143_0, "/Users/[^/]+/.*/%.egstore/bps/", 1, false)
      or string.find(p143_0, "/private/tmp/deviceConnect-Services-", 1, true) then
      return true
    end
    return false
  end
  return true
end

function IsPersistenceExcludedMacOS(p144_0, p144_1, p144_2)
  if p144_0 ~= nil and p144_0 ~= "" and p144_1 ~= nil and p144_1 ~= "" then
    local r144_0 = {
      ["com.nordvpn.macos.helper.plist"] = "/Library/PrivilegedHelperTools/com.nordvpn.macos.helper",
      ["com.docker.socket.plist"] = "/Library/PrivilegedHelperTools/com.docker.socket",
      ["com.docker.vmnetd.plist"] = "/Library/PrivilegedHelperTools/com.docker.vmnetd",
      ["com.perimeter81d.plist"] = "/Library/PrivilegedHelperTools/com.perimeter81d.app/Contents/MacOS/com.perimeter81d",
      ["us.zoom.ZoomDaemon.plist"] = "/Library/PrivilegedHelperTools/us.zoom.ZoomDaemon",
      ["us.zoom.rooms.daemon.plist"] = "/Library/PrivilegedHelperTools/us.zoom.ZoomRoomsDaemon",
      ["com.github.facebook.watchman.plist"] = "/usr/local/bin/watchman",
      ["com.eagleyun.sase.helper.plist"] = "/Library/PrivilegedHelperTools/com.eagleyun.sase.helper",
      ["com.jumpcloud.JumpCloudGoHelper.plist"] = "/Library/PrivilegedHelperTools/com.jumpcloud.JumpCloudGoHelper",
      ["com.merck.adminremove.plist"] = "/usr/local/bin/jamf",
      ["com.microsoft.wdav.schedquickscan.plist"] = "/usr/local/bin/mdatp",
      ["com.xiaohongshu.REDpassDaemon.plist"] = "/usr/local/bin/REDpass/REDpassDaemon",
      ["com.school.limitbw.plist"] = "/usr/local/bin/limit_bw.sh",
      ["com.teamviewer.Helper.plist"] = "/Library/PrivilegedHelperTools/com.teamviewer.Helper",
      ["com.teamviewer.UninstallerHelper.plist"] = "/Library/PrivilegedHelperTools/com.teamviewer.UninstallerHelper",
      ["com.microsoft.wdav.schedfullscan.plist"] = "/usr/local/bin/mdatp",
      ["com.zscaler.preloginui.plist"] = "/Applications/Zscaler/Zscaler.app/Contents/PlugIns/ZscalerService",
      ["com.omnissa.horizon.CDSHelper.plist"] = "/Library/PrivilegedHelperTools/com.omnissa.horizon.CDSHelper",
      ["org.911cellular.cpb.plist"] = "/Library/cpb/911cellular.cpblauncher.sh",
      ["corp.sap.privileges.helper.plist"] = "/Library/PrivilegedHelperTools/corp.sap.privileges.helper",
      ["com.absolute.ctesservice.plist"] = "/Library/.rpcnet/Ctes",
      ["com.github.grahampugh.erase-install.remove.plist"] = "/Library/LaunchDaemons/com.github.grahampugh.erase-install.remove.plist",
      ["com.perimeter81.osx.HelperTool.plist"] = "/Library/PrivilegedHelperTools/com.perimeter81.osx.HelperTool",
      ["com.mcafee.agentMonitor.helper.plist"] = "/Library/PrivilegedHelperTools/com.trellix.agentMonitor.helper",
      ["com.vmware.IDHelper.plist"] = "/Library/PrivilegedHelperTools/com.vmware.IDHelper",
      ["io.vicarius.Topia.plist"] = "/Library/PrivilegedHelperTools/topiad",
      ["com.company.zscalermonitor.plist"] = "/Library/Scripts/zscaler_monitor.sh",
      ["com.company.bluetooth.enforce.plist"] = "/usr/local/bin/bluetooth_enforce.sh",
      ["com.company.synchosts.plist"] = "/usr/local/bin/sync_hosts.sh",
      ["com.addigy.agent.plist"] = "/Library/Addigy/go-agent",
      ["com.rsa.menulet.plist"] = "/Library/Application Support/RSA MFA Agent/Menulet/MFA Agent.app/Contents/MacOS/MFA Agent",
      ["com.epsecurity.bdconnectorservice.plist"] = "/Library/Bitdefender/AVP/product/bin/BDCoreIssues",
      ["com.heimdalSecurity.HM-service-check.plist"] = "/Library/HeimdalSecurity/HM-service-check.sh",
      ["com.apple.fielddiagnostics.appleserviceutility.updaterXPCService.plist"] = "/Library/PrivilegedHelperTools/com.apple.fielddiagnostics.appleserviceutility.updaterd",
      ["com.heimdalsecurity.heimdalAgent.cmdHelper.plist"] = "/Library/PrivilegedHelperTools/com.heimdalsecurity.heimdalAgent.cmdHelper",
      ["com.mspanywhere.agent.agent-N-central.plist"] = "/Library/PrivilegedHelperTools/MSP Anywhere Agent N-central.app/Contents/MacOS/MSP Anywhere Agent",
      ["com.bgrove.activtrak.daemon.plist"] = "/Library/PrivilegedHelperTools/svctcom",
      ["com.mspanywhere.agent.agent-dameware.plist"] = "/Library/PrivilegedHelperTools/Take Control Agent dameware.app/Contents/MacOS/Take Control Agent",
      ["com.login.plist"] = "/Users/Shared/UOS/Login/login.sh",
      ["com.company.appleidlogger.plist"] = "/usr/local/bin/AppleIDLogger.sh",
      ["com.company.bluetooth.enforce.agent.plist"] = "/usr/local/bin/bluetooth_enforce.sh",
      ["com.gcc.wifivpn.enforcer.plist"] = "/usr/local/bin/en0lockdown.swift",
      ["com.tresorit.pfctl.plist"] = "/usr/local/bin/firewall.sh",
      ["com.ntu.jamfconnect.postlogin.plist"] = "/usr/local/bin/jamfconnect_postlogin.sh",
      ["edu.umbc.wifi.enforcer.plist"] = "/usr/local/bin/umbc_wifi_enforcer.sh",
      ["com.company.maclocationlogger.plist"] = "/usr/local/bin/mac_location_logger.sh",
      ["com.addigy.user-manager.promotion.jaemmy.alcance.plist"] = "/Library/Addigy/user-manager",
      ["pc-edgenode-service.plist"] = "/Library/PaperCut Hive/pc-edgenode-service",
      ["com.jamf.jamfsde.helper.plist"] = "/Library/PrivilegedHelperTools/com.jamf.jamfsde.helper"
    }
    local r144_1 = {
      ["io.osquery.agent.plist"] = "/private/tmp/mcs/runner",
      ["gitlab-runner.plist"] = "/usr/local/bin/gitlab-runner"
    }

    local function r144_2(p145_0, p145_1, p145_2)
      for r145_0, r145_1 in pairs(p145_0) do
        if r145_0 ~= nil
          and r145_0 ~= ""
          and r145_1 ~= nil
          and r145_1 ~= ""
          and r145_0 == p145_1
          and r145_1 == p145_2 then
          return true
        end
      end
      return false
    end

    do
      local r144_3 = false
    end
    local r144_4
    if p144_2 then
      r144_4 = r144_2(r144_0, p144_0, p144_1)
    else
      r144_4 = r144_2(r144_1, p144_0, p144_1)
    end
    r144_4 = (p144_1:find("/Library/PrivilegedHelperTools/com.zuludesk.script", 1, true)
      or p144_1:find("/Library/PrivilegedHelperTools/scshost.app/Contents/MacOS/scshost", 1, true)
      or p144_1:find("/Library/Telegraf/telegraf", 1, true)
      or p144_1:find("/Library/Bitdefender/bdconnectorservice", 1, true)
      or p144_1:find("/Library/PrivilegedHelperTools/ZscalerPreLogin.app/Contents/MacOS/ZscalerPreLogin",
        1, true))
      and true
      or r144_4
    return r144_4
  end
  return true
end

function IsExcludedByCmdlineMacOS(p146_0)
  if p146_0 ~= nil and p146_0 ~= "" then
    local r146_0 = p146_0:lower()
    local r146_1 = {
      "/applications/visual studio code[^/]+/contents/macos/electron", "googleupdater %-%-install",
      "googleupdater %-%-server", "/jamf/jamf%.app/", "/library/application support/microsoft/",
      "/library/preferences/com.microsoft.autoupdate2.plist", "scripts/com.microsoft.edgemac",
      "/applications/google chrome.app/contents/macos/google chrome", "mdatp-epp-mitre-setup.sh",
      "mdatp-edr-mitre-setup.sh", "launchctl load /library/launchdaemons/com.microsoft.fresno.plist",
      "/library/application support/adobe/com.adobe.armdchelper/adobe acrobat updater.app/",
      "/opt/aws/ssm/data/", "/usr/local/libexec/amazon-ena-ethernet", "/usr/sbin/periodic",
      "microsoftdefenderatponboardingmacos.sh",
      "/scripts/com.microsoft.package.microsoft_autoupdate.app",
      "/library/application support/jamf/tmp/"
    }
    for r146_2, r146_3 in ipairs(r146_1) do
      if r146_0:find(r146_3) then
        return true
      end
    end
    return false
  end
  return true
end

function SuspMacPathsToMonitor(p147_0, p147_1)
  if p147_0 ~= nil and p147_0 ~= "" then
    local r147_0 = string.lower(p147_0)
    p147_0 = r147_0
    r147_0 = {
      "/private/tmp/", "/users/shared/", "/private/var/folders/[^/]+/[^/]+/t/.*", "/library/caches/",
      "/users/[^/]+/library/metadata/", "/applications/celastradepro.app/",
      "/applications/jmttrader.app/", "/applications/celastradepro.app/", "/library/jmttrader",
      "/applications/unioncryptotrader.app", "/library/unioncrypto/",
      "/users/[^/]+/library/user photos/", "/users/[^/]+/library/wifipreferences/",
      "/users/[^/]+/library/fonts/", "/users/[^/]+/library/saved application state/",
      "/volumes/mirotalk/mirotalk.app", "/library/privilegedhelpertools/", "/usr/local/bin/",
      "/users/[^/]+/_log"
    }
    for r147_1, r147_2 in ipairs(r147_0) do
      local r147_3 = string.find(p147_0, r147_2)
      if r147_3 ~= nil and r147_3 > 0 then
        if p147_1 and r147_3 == 1 then
          return true
        end
        if p147_1 and r147_3 ~= 1 then
          return false
        end
        return true
      end
    end
    return false
  end
  return false
end

function IsExcludedByImagePath(p148_0)
  if p148_0 ~= nil and p148_0 ~= "" then
    local r148_0 = p148_0:lower()
    local r148_1 = {
      "/opt/microsoft/omsagent/ruby/bin/ruby",
      "/opt/microsoft/dependency-agent/bin/microsoft-dependency-agent", "/usr/bin/dpkg",
      "/usr/sbin/grub-install", "/usr/sbin/grub2-install", "/opt/microsoft/mdatp/sbin/wdavdaemon",
      "/opt/tanium/taniumclient/taniumclient", "/opt/tanium/taniumclient/taniumcx",
      "/opt/tanium/taniumclient/tools/epi/taniumendpointindex", "/usr/bin/svn", "/usr/bin/rpm",
      "/bin/rpm", "/bin/yum", "/usr/bin/yum", "/usr/sbin/logrotate", "/usr/bin/unzip",
      "/usr/bin/git", "/usr/lib/git-core/git", "/usr/bin/mandb", "/usr/lib/man-db/mandb",
      "/usr/bin/ccache", "/usr/bin/azcopy", "/usr/bin/scp", "/usr/bin/cp", "/usr/bin/mv",
      "/usr/bin/touch", "/bin/cp", "/bin/mv", "/bin/touch", "/sbin/auditd", "/usr/sbin/shibd",
      "/usr/openv/var/tmp/telemetry", "/opt/rapid7/ir_agent/components/insight_agent",
      "/opt/rapid7/ir_agent/ir_agent", "/usr/sbin/esensor", "/usr/bin/apt-get", "/usr/bin/apt",
      "/opt/splunk/bin/splunkd", "/opt/splunk/bin/splunk-optimize", "/opt/splunk/bin/mongod",
      "/opt/google/chrome/chrome", "/usr/bin/vim", "/opt/besclient/bin/besclient",
      "/opt/nessus/sbin/nessusd", "/opt/tableau/tableau_server/packages",
      "/var/ossec/bin/ossec-syscheckd", "/opt/tivoli/tsm/client/ba/bin/dsmc", "/usr/bin/containerd",
      "/opt/jc/bin/jumpcloud-agent", "/usr/bin/rubrik/backup_agent_main",
      "/opt/microsoft/omsagent/plugin/omsbaseline", "/usr/bin/zypper", "/usr/share/code/code",
      "/snap/code/97/usr/share/code/code", "/usr/bin/docker-registry", "/opt/kube/bin/etcd",
      "/opt/vrtsralus/bin/beremote", "/usr/sbin/useradd", "/usr/bin/xclient",
      "/usr/nx/bin/nxserver.bin", "/usr/bin/newrelic-infra", "/opt/logrhythm/scsm/bin/scsmd",
      "/usr/local/bin/azsecd", "/usr/bin/xbstream", "/opt/bitdefender/bin/bdupdated",
      "/usr/sbin/cupsd", "/opt/gitlab/embedded/bin/svlogd",
      "/opt/illumio_ven/bin/venPlatformHandler", "/opt/ds_agent/ds_agent", "/usr/bin/dockerd",
      "/usr/share/grafana/bin/grafana-server", "/opt/jp1ajs2/bin/ajsschd",
      "/opt/jp1ajs2/bin/ajsflowd", "/opt/kaspersky/klnagent64/sbin/klnagent", "/usr/bin/doxygen",
      "/opt/mf/bpm/jre/bin/bpm", "/opt/generalstorage/dsmisi/bin/dsmisi", "/opt/firefox/updater",
      "/opt/resolve/bin/resolve", "/opt/fireeye/bin/xagt", "/opt/couchbase/bin/memcached",
      "/usr/local/nagios/bin/npcd", "/usr/lib/hadoop-yarn/bin/container-executor"
    }
    for r148_2, r148_3 in pairs(r148_1) do
      if r148_3 ~= nil and string.find(r148_0, r148_3, 1, true) == 1 then
        return true
      end
    end
    return false
  end
  return false
end

function IsChmodMacOSExcluded(p149_0)
  if p149_0 ~= nil and p149_0 ~= "" then
    if IsExcludedByImagePathMacOS(p149_0) then
      return true
    end
    if string.find(p149_0, "/Library/Caches/com.microsoft.autoupdate.helper/Clones.noindex", 1, true)
      or string.find(p149_0, "/private/var/root/crypt_output.plist", 1, true)
      or string.find(p149_0, "/Library/Managed Installs/manifests/SelfServeManifest", 1, true)
      or string.find(p149_0, "/Library/Caches/EFI/locale.plist", 1, true)
      or string.find(p149_0, "/Library/PrivilegedHelperTools/us.zoom.ZoomDaemon.tmp", 1, true)
      or string.find(p149_0, "/usr/libexec/cups/backend/cirrosprinter", 1, true)
      or string.find(p149_0,
        "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/manifests/device_manifest.plist.download",
        1, true)
      or string.find(p149_0,
        "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/catalogs/device_catalog.plist.download",
        1, true)
      or string.find(p149_0,
        "/Library/Application Support/AirWatch/Data/Munki/Managed Installs/InstallInfo.plist", 1,
        true)
      or string.find(p149_0,
        "/Library/Caches/com.microsoft.autoupdate.helper/Clones.noindex/Microsoft [^/]+.app/Contents/_CodeSignature/CodeResources",
        1, false)
      or string.find(p149_0,
        "/Users/[^/]+/Library/Containers/com.microsoft.[^/]+/Data/Library/Cookies", 1, false)
      or string.find(p149_0,
        "/Users/[^/]+/Library/Containers/com.microsoft.[^/]+/Data/Library/Application Support/think-cell",
        1, false)
      or string.find(p149_0,
        "/Users/[^/]+/Library/Containers/com.microsoft.[^/]+/Data/Library/Saved Application State/com.microsoft.[^/]+.savedState",
        1, false)
      or string.find(p149_0,
        "/Users/[^/]+/Library/Saved Application State/com.google.Chrome.app.[^/]+.savedState", 1,
        false)
      or string.find(p149_0,
        "/Users/[^/]+/Library/Saved Application State/com.google.Chrome.app.[^/]+.savedState", 1,
        false)
      or string.find(p149_0, "/Library/Managed Installs/UpdateNotificationTracking.plist", 1, true)
      or string.find(p149_0, "/private/tmp/boost_interprocess", 1, true)
      or string.find(p149_0, "/Library/Logs/Netskope", 1, true)
      or string.find(p149_0, "/Library/Application Support/Zscaler", 1, true)
      or string.find(p149_0, "/Library/Application Support/Google", 1, true)
      or string.find(p149_0, "/Library/Logs/Microsoft/OneDrive", 1, true)
      or string.find(p149_0, "/private/tmp/com.adobe.AcrobatRefreshManager", 1, true)
      or string.find(p149_0, "/Library/ManageEngine/UEMS_Agent/data/dupserverinfo.plist", 1, true)
      or string.find(p149_0, "/usr/local/munkireport/scripts/cache/firewall.plist", 1, true)
      or string.find(p149_0,
        "/Library/Application Support/Adobe/Acrobat/DC/Preferences/cumuPatch.plist", 1, true)
      or string.find(p149_0,
        "/Library/Application Support/Adobe/Reader/DC/WebResources/Resource.+/OWP$", 1, false)
      or string.find(p149_0, "/Library/Application Support/JAMF/tmp.+", 1, false)
      or string.find(p149_0, "/private/tmp/munki-", 1, true)
      or string.find(p149_0,
        "/private/var/folders/zz/zyxvpxvq6csfxvn_n0000000000000/T/DUR[^/]+.json", 1, false)
      or string.find(p149_0, "/private/tmp/nsbranding/enroll.conf", 1, true)
      or string.find(p149_0, "/private/tmp/ip.py", 1, true)
      or string.find(p149_0, "/private/tmp/com.adobe.acrobat.updater", 1, true)
      or string.find(p149_0, "/Users/Shared/SplashtopStreamer", 1, true)
      or string.find(p149_0, "/Library/LaunchAgents/com.github.macadmins.Nudge.plist", 1, true) then
      return true
    end
    return false
  end
  return true
end

function IsExcludedByImagePathFileExtension(p150_0, p150_1)
  if p150_0 ~= nil
    and p150_0 ~= ""
    and p150_1 ~= nil
    and p150_1 ~= ""
    and string.sub(p150_1, 1, 1) == "." then
    if string.find(p150_0, "/gpg", 1, true) and string.find(p150_1, ".gpg", 1, true) ~= 1 then
      return true
    end
    if string.find(p150_1, ".gpg", 1, true) == 1 and not string.find(p150_0, "/gpg", 1, true) then
      return true
    end
    p150_1 = p150_1 .. '"'
    local r150_0 = {
      ["/usr/local/bin/cmake"] = '.cmake".make".marks"', ["/usr/bin/cmake"] = '.cmake".make".marks"',
      ["/usr/bin/influxd"] = '.tsm".wal"', ["/opt/besclient/bin/besclient"] = '.qid"',
      ["/usr/lib/systemd/systemd"] = '.service".conf".scope".slice"',
      ["/lib/systemd/systemd"] = '.service".conf".scope".slice"',
      ["/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"] = '.deleted".cql".snapshot"',
      ["/usr/lib/jvm/java-11-openjdk-amd64/bin/java"] = '.instance".target"',
      ["/usr/bin/python"] = '.mo".cocci"',
      ["/usr/libexec/platform-python"] = '.mo".cmake".solv".cocci".catalog".service".erb"',
      ["/usr/local/bin/node"] = '.__ivy_ngcc_bak".flow"',
      ["/usr/bin/node"] = '.__ivy_ngcc_bak".graph"',
      ["/usr/lib/firefox-esr/firefox-esr"] = '.final".vlpset".sbstore"',
      ["/usr/lib/firefox/firefox"] = '.final".vlpset".sbstore"',
      ["/usr/lib64/firefox/firefox"] = '.final".vlpset".sbstore"',
      ["/home/vsts/miniconda/bin/python"] = '.c~"',
      ["/home/vsts/miniconda/envs/test_e2e/bin/python"] = '.c~".pyc"',
      ["/usr/lib/systemd/system-generators/systemd-fstab-generator"] = '.mount"',
      ["/usr/bin/containerd"] = '.del-status"', ["/usr/share/teams/teams"] = '.cache-6".cache-7"',
      ["/usr/bin/x86_64-linux-gnu-gcov-7"] = '.gcov"', ["/usr/bin/snap"] = '.cmake".make".marks"',
      ["/usr/java/jdk"] = '.jar"', ["/usr/sbin/adclient"] = '.pol"',
      ["/opt/atlassian/jira/jre/bin/java"] = '.location".properties".nmea"',
      ["/opt/splunk/bin/splunkd"] = '.manifest_values_dirty"',
      ["/opt/splunk/bin/splunk-optimize"] = '.merge"', ["/opt/splunk/bin/python"] = '.ckpt"',
      ["/usr/sbin/atopacctd"] = '.paf"', ["/usr/sbin/hardlink"] = '.$$$___cleanit___$$$"',
      ["/usr/lib/systemd/user-generators/systemd-xdg-autostart-generator"] = '.service"',
      ["/opt/ds_agent/ds_am"] = '.len".retry"', ["/opt/gitlab/embedded/bin/git"] = '.salt"',
      ["/opt/gitlab/embedded/bin/ruby"] = '.erb"', ["/usr/bin/vim"] = '.sh~".sql~"',
      ["/usr/bin/ruby"] = '.ri"', ["/usr/libexec/openssh/sftp-server"] = '.j2"',
      ["/usr/bin/qtcreator"] = '.~"', ["/usr/bin/containerd-shim-runc-v2"] = '.address"',
      ["/var/cfengine/bin/cf-agent"] = '.cfnew".cfedited"',
      ["/var/cfengine/sbin/cfexecd"] = '.cfnew".cfedited"', ["/opt/splunk/bin/mongod"] = '.ns"',
      ["/opt/kube/bin/etcd"] = '.snap"', ["/opt/fireeye/bin/xagt"] = '.xmd"',
      ["/usr/bin/nautilus"] = '.trashinfo"', ["/opt/Insomnia/insomnia"] = '.db~"'
    }
    for r150_1, r150_2 in pairs(r150_0) do
      if r150_1 ~= nil
        and r150_1 ~= ""
        and string.find(p150_0, r150_1, 1, true) == 1
        and r150_2 ~= nil
        and r150_2 ~= ""
        and string.find(r150_2, p150_1, 1, true) then
        return true
      end
    end
    local r150_3 = {
      ["/usr/local/bin/cmake"] = '.cmake".make".marks"', ["/bin/make"] = '.mk"',
      ["/bin/clang"] = '.shd".xxxxxx".gcno"', ["/bin/python"] = '.c~"',
      ["/usr/bin/cmake"] = '.cmake".make".marks".in"',
      ["/bin/java"] = '.sz".deleted".nmea".cql".snapshot".cachedfile".timeindex".class".i1".original".tmp".bak~"'
        .. '.durbo".xml~".etag".instance".location".properties".feature".fw".msg5".fslck".parquet".erf-p"',
      ["/usr/bin/fc-cache"] = '.cache-6".cache-7"',
      ["/usr/bin/node"] = '.__ivy_ngcc_bak".graph".lcl"',
      ["/aem65/aemauthor/crx-quickstart"] = '._01_"', ["/usr/sbin/grub-install"] = '.mod".mod-"',
      ["/usr/share/code/code"] = '.vsixmanifest".template".__ivy_ngcc_bak"',
      ["/bin/adrci"] = '.ams"', ["/bin/rsession"] = '.snapshot"',
      ["/bin/node"] = '.__ivy_ngcc_bak".graph"', ["/steam"] = '.old"',
      ["/usr/bin/nvim"] = '.wiki".go~"', ["/bin/postgres"] = '.done"', ["/bin/iccarm"] = '.xxxxxx"',
      ["/sqllib/adm/db2sysc"] = '.log".tda"',
      ["/usr/sbin/php-fpm"] = '.bup".html_old".html_gzip_old"',
      ["/opt/mqsi/iib-10.0.0.26/server/bin/DataFlowEngine"] = '.rmv"', ["/bin/gcc"] = '.xxxxxx"',
      ["/usr/bin/ccache"] = '.xxxxxx"', ["/opt/firefox/firefox-bin"] = '.moz-backup"'
    }
    for r150_4, r150_5 in pairs(r150_3) do
      if string.find(p150_0, r150_4, 1, true) and string.find(r150_5, p150_1, 1, true) then
        return true
      end
    end
    return false
  end
  return false
end

function IsExcludedByImagePathFileExtensionRegEx(p151_0, p151_1)
  if p151_0 ~= nil
    and p151_0 ~= ""
    and p151_1 ~= nil
    and p151_1 ~= ""
    and string.sub(p151_1, 1, 1) == "." then
    p151_1 = p151_1 .. '"'
    local r151_0 = {
      ["/opt/cmake%-(.+)/bin/cmake"] = '.cmake".make".marks"',
      ["/snap/cmake/(%d+)/bin/cmake"] = '.cmake".make".marks"',
      ["/snap/snapd/(%d+)/usr/bin/snap"] = '.cmake".make".marks"',
      ["/usr/lib/jvm/java%-(.+)%-openjdk%-(.*)/(%w+)/bin/java"] = '.deleted".ndjson".nmea".target".jmm".dbtmp".fnt".1".class"',
      ["/snap/core/(%d+)/lib/x86_64%-linux%-gnu/(.*)"] = '.cache-6".cache-7"',
      ["/snap/firefox/(%d+)/usr/lib/firefox/firefox"] = '.final"',
      ["/snap/postman/(%d+)/usr/share/postman/postman"] = '.cache-6".cache-7"',
      ["/snap/teams-for-linux/(%d+)/teams-for-linux"] = '.cache-6".cache-7"',
      ["/snap/notepad-plus-plus/(%d+)/gnome-platform/usr/bin/fc-cache"] = '.cache-6".cache-7"',
      ["/opt/tableau/tableau_server/packages/pgsql%.(%d+)%.(%d+)%.(%d+)%.(%d+)/bin/postgres"] = '.done".ftl"',
      ["/opt/tableau/tableau_server/packages/apigateway%.(%d+)%.(%d+)%.(%d+)%.(%d+)/run-apigateway"] = '.done".ftl"'
    }
    for r151_1, r151_2 in pairs(r151_0) do
      if r151_1 ~= nil
        and r151_1 ~= ""
        and string.find(p151_0, r151_1) == 1
        and r151_2 ~= nil
        and r151_2 ~= ""
        and string.find(r151_2, p151_1, 1, true) then
        return true
      end
    end
    return false
  end
  return false
end

function IsExcludedByImagePathFileExtensionSuffix(p152_0, p152_1)
  if p152_0 ~= nil
    and p152_0 ~= ""
    and p152_1 ~= nil
    and p152_1 ~= ""
    and string.sub(p152_1, 1, 1) ~= "." then
    p152_1 = '"' .. p152_1 .. '"'
    local r152_0 = { ["/usr/bin/qtcreator"] = '"~"' }
    for r152_1, r152_2 in pairs(r152_0) do
      if r152_1 ~= nil
        and r152_1 ~= ""
        and string.find(p152_0, r152_1, 1, true) == 1
        and r152_2 ~= nil
        and r152_2 ~= ""
        and string.find(r152_2, p152_1, 1, true) then
        return true
      end
    end
    return false
  end
  return false
end

function IsRansomwareProcessImagePathExtensionExcluded(p153_0, p153_1)
  if p153_0 ~= nil
    and p153_0 ~= ""
    and p153_1 ~= nil
    and p153_1 ~= ""
    and string.sub(p153_1, 1, 1) == "." then
    local r153_0 = p153_0:lower()
    return IsExcludedByImagePathFileExtension(r153_0, p153_1)
      or IsExcludedByImagePathFileExtensionRegEx(r153_0, p153_1)
  end
  return false
end

function CheckFileExtnIncludeProcessId(p154_0, p154_1)
  if p154_0 ~= nil
    and p154_0 ~= ""
    and p154_1 ~= nil
    and p154_1 ~= ""
    and string.sub(p154_1, 1, 1) == "." then
    local r154_0, r154_1 = string.match(p154_0, "pid:(%w+),ProcessStart:(%w+)")
    if r154_0 ~= nil and r154_0 ~= "" then
      if string.find(p154_1, r154_0, 1, true) == 2
        or string.find(p154_1, ".log" .. r154_0, 1, true) == 1 then
        return true
      end
      return false
    end
    return false
  end
  return false
end

function IsStringInTable(p155_0, p155_1)
  if p155_0 ~= nil and #p155_0 ~= 0 and p155_1 ~= nil and p155_1 ~= "" then
    for r155_0, r155_1 in pairs(p155_0) do
      if p155_1 == r155_1 then
        return true
      end
    end
    return false
  end
  return false
end

function checkParentCmdline(p156_0, p156_1, p156_2)
  if p156_2 ~= 0 and p156_0 ~= nil and p156_1 ~= nil and type(p156_1) == "table" then
    local r156_0 = mp.GetParentProcInfo(p156_0)
    if r156_0 == nil then
      return false
    end
    local r156_1 = mp.GetProcessCommandLine(r156_0.ppid)
    if r156_0.image_path ~= nil and r156_0.image_path ~= "" and r156_1 ~= nil and r156_1 ~= "" then
      for r156_2, r156_3 in ipairs(p156_1) do
        if string.find(r156_0.image_path, r156_3[1], 1, true)
          and string.find(r156_1, r156_3[2], 1, true) then
          return true
        end
      end
    end
    return checkParentCmdline(r156_0.ppid, p156_1, p156_2 - 1)
  end
  return false
end

function checkParentCmdlineCaseInsensitive(p157_0, p157_1, p157_2, p157_3)
  if p157_1 and type(p157_1) == "table" then
    p157_3 = p157_3 or true
    if type(p157_3) == "boolean" then
      for r157_0, r157_1 in ipairs(p157_1) do
        r157_1[1] = string.lower(r157_1[1])
        r157_1[2] = string.lower(r157_1[2])
      end

      local function r157_2(p158_0, p158_1, p158_2, p158_3)
        if p158_2 ~= 0 and p158_0 ~= nil and p158_1 ~= nil and type(p158_1) == "table" then
          local r158_0 = mp.GetParentProcInfo(p158_0)
          if r158_0 == nil then
            return false
          end
          local r158_1 = mp.GetProcessCommandLine(r158_0.ppid)
          if r158_0.image_path and r158_0.image_path ~= "" and r158_1 and r158_1 ~= "" then
            for r158_2, r158_3 in ipairs(p158_1) do
              local r158_4 = string.find(string.lower(r158_0.image_path), r158_3[1], 1, p158_3)
              if r158_4 and string.find(string.lower(r158_1), r158_3[2], 1, p158_3) then
                local r158_5 = r158_0.image_path
                local r158_6 = r158_1
                return true, r158_5, r158_6, r158_0.ppid
              end
            end
          end
          return r157_2(r158_0.ppid, p158_1, p158_2 - 1)
        end
        return false
      end

      return r157_2(p157_0, p157_1, p157_2, p157_3)
    end
    return false
  end
  return false
end

function isParentPackageManager(p159_0, p159_1)
  if p159_0 == nil then
    return false
  end
  local r159_0 = r0_7()
  if r159_0 ~= nil and type(r159_0) == "table" then
    if p159_1 then
      local r159_1 = nil
      if bm then
        r159_1 = bm.get_imagepath()
      else
        r159_1 = MpCommon.GetImagePathFromPid(p159_0)
      end
      local r159_2 = mp.GetProcessCommandLine(p159_0)
      if (r159_2 == nil or r159_2 == "") and bm then
        local r159_3 = bm.get_current_process_startup_info()
        if r159_3 ~= nil then
          r159_2 = r159_3.command_line
        end
      end
      if r159_1 == nil or r159_1 == "" then
        local r159_4 = "Failed to fetch process details for " .. p159_0
        bm.add_related_string("error", r159_4, bm.RelatedStringBMReport)
        return false
      end
      for r159_5, r159_6 in ipairs(r159_0) do
        local r159_7 = r159_6[1]
        local r159_8 = r159_6[2]
        local r159_9
        if r159_7 == "" then
          r159_9 = true
        else
          r159_9 = string.find(r159_1, r159_7, 1, true)
        end
        local r159_10 = r159_8 == ""
          or r159_2 ~= nil and r159_2 ~= "" and string.find(r159_2, r159_8, 1, true)
        if r159_9 and r159_10 then
          return true
        end
      end
      if string.find(r159_1, "/python", 1, true)
        or string.find(r159_1, "/bash", 1, true)
        or string.find(r159_1, "/bin/sh", 1, true) then
        if string.find(r159_2, "BECOME-SUCCESS", 1, true)
          and string.find(r159_2, "/usr/bin/python", 1, true) then
          return true
        end
        local r159_11 = mp.GetParentProcInfo(p159_0)
        if r159_11 ~= nil then
          local r159_12 = mp.GetProcessCommandLine(r159_11.ppid)
          if r159_12 ~= nil
            and r159_12 ~= ""
            and string.find(r159_12, "BECOME-SUCCESS", 1, true)
            and string.find(r159_12, "/usr/bin/python", 1, true)
            and string.find(r159_11.image_path or "", "/sudo", 1, true) then
            return true
          end
        end
      end
    end
    return checkParentCmdline(p159_0, r159_0, 3)
  end
  return false
end

function ipv4ToInt(p160_0)
  local r160_0 = 0
  if p160_0 then
    local r160_1 = { string.match(p160_0, "(%d+)%.(%d+)%.(%d+)%.(%d+)") }
    local r160_2 = { 24, 16, 8, 0 }
    for r160_3 = 1, 4 do
      local r160_4 = tonumber
      local r160_5 = r160_1[r160_3]
      r160_4 = r160_4(r160_5 or 256)
      if r160_4 > 255 then
        return nil
      end
      r160_0 = r160_0 + mp.shl32(r160_4, r160_2[r160_3])
    end
    return r160_0
  end
  return nil
end

function ipv4IsPrivateRange(p161_0)
  local r161_0 = { { 167772160, 8 }, { 2886729728, 12 }, { 3232235520, 16 }, { 3758096384, 4 } }
  p161_0 = ipv4ToInt(p161_0)
  if p161_0 then
    for r161_1, r161_2 in pairs(r161_0) do
      local r161_3 = mp.shl32(4294967295, 32 - r161_2[2])
      if r161_2[1] == mp.bitand(p161_0, r161_3) then
        return true
      end
    end
    return false
  end
  return false
end

function isPublicIP(p162_0)
  return getIpAddressClass(p162_0) == 3
end

function isPrivateIP(p163_0)
  return getIpAddressClass(p163_0) == 1
end

function isIPInNetmaskRange(p164_0, p164_1, p164_2)
  return r0_56(p164_1, p164_0) <= 32 - p164_2
end

function getIpAddressClass(p165_0)
  local r165_0 = 1
  local r165_1, r165_2 = 3, 4
  local r165_3 = 7
  local r165_4 = r0_10(p165_0)
  if #r165_4 == 0 then
    return 8
  end
  if r165_4[1] == 10 then
    return r165_0
  end
  if r165_4[1] == 192 then
    if r165_4[2] == 168 then
      return r165_0
    end
    if r165_4[2] == 0 then
      if r165_4[3] == 0 then
        return r165_0
      end
      if r165_4[3] == 2 then
        return r165_3
      end
    elseif r165_4[2] == 51 then
      return r165_3
    end
    return r165_1
  end
  if r165_4[1] == 172 and r165_4[2] >= 16 and r165_4[2] <= 31 then
    return r165_0
  end
  if r165_4[1] == 127 then
    return 2
  end
  if r165_4[1] == 128 then
    return r165_2
  end
  if r165_4[1] == 191 and r165_4[2] == 255 then
    return r165_2
  end
  if r165_4[1] == 233 and r165_4[2] == 255 then
    return r165_2
  end
  if r165_4[1] == 169 and r165_4[2] == 254 then
    return 5
  end
  if r165_4[1] == 198 then
    if r165_4[2] == 18 or r165_4[2] == 19 or r165_4[2] == 51 and r165_4[3] == 100 then
      return r165_0
    end
    return r165_1
  end
  if r165_4[1] == 203 and r165_4[2] == 0 and r165_4[3] == 113 then
    return r165_3
  end
  if r165_4[1] == 100 and r165_4[2] >= 64 and r165_4[2] < 128 then
    return 6
  end
  if r165_4[1] == 0 then
    return r165_2
  end
  if p165_0 == "255.255.255.255" then
    return r165_2
  end
  return r165_1
end

function updateDomainInfo()
  local r166_0 = nil
  local r166_1 = ""
  local r166_2 = {}
  local r166_3 = {}
  local r166_4 = 2

  local function r166_5(p167_0, p167_1, p167_2)
    local r167_0 = sysio.GetRegValueAsString(p167_0, p167_1)
    if r167_0 then
      r167_0 = r167_0:lower()
      if r166_2[r167_0] then
        r166_2[r167_0] = mp.bitor(p167_2, r166_2[r167_0])
      else
        r166_2[r167_0] = p167_2
      end
    end
  end

  pcall(MpCommon.RollingQueueErase, "domainInfo")
  local r166_6 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\iphlpsvc\\Parameters\\ADHarvest")
  if r166_6 then
    local r166_7 = r166_5
    r166_7(r166_6, "LastFetchDomain", 1)
  end
  local r166_8 = sysio.RegOpenKey("HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Connections")
  if r166_8 then
    local r166_9 = r166_5
    r166_9(r166_8, "DefaultConnectionSettings", 32768)
  end
  local r166_10 = sysio.RegOpenKey("HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters")
  if r166_10 then
    local r166_11 = sysio.GetRegValueAsString(r166_10, "HostName")
    r166_1 = r166_11
    r166_1 = r166_1 and r166_1:lower() or ""
    r166_11 = #r166_1
    if r166_11 > 0 then
      AppendToRollingQueue("domainInfo", "TCP-hostname", r166_1, 604800, 100)
    end
    r166_11 = r166_5
    r166_11(r166_10, "Domain", r166_4)
    r166_11 = r166_5
    r166_11(r166_10, "ICSDomain", 4)
    r166_11 = sysio
    local r166_12 = r166_11.GetRegValueAsString(r166_10, "SearchList")
    if r166_12 then
      local r166_13 = r166_12:lower()
      local r166_14 = split(r166_13, ",")
      r166_13 = r166_14
      local r166_15, r166_16
      r166_14, r166_15, r166_16 = ipairs(r166_13)
      for r166_17, r166_18 in r166_14, r166_15, r166_16 do
        if not r166_3[r166_18] then
          r166_3[r166_18] = 1
          AppendToRollingQueue("TCP-searchList", r166_18, 1, 604800, 100)
        end
      end
    end
  end
  r166_0 = nil
  local r166_19 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\Interfaces"
  local r166_20 = sysio.RegOpenKey(r166_19)
  if r166_20 then
    local r166_21 = sysio.RegEnumKeys(r166_20)
    if r166_21 then
      for r166_22, r166_23 in ipairs(r166_21) do
        local r166_24 = sysio.RegOpenKey(string.format("%s\\%s", r166_19, r166_23))
        if r166_24 then
          local r166_25 = r166_5
          r166_25(r166_24, "Domain", r166_4)
          r166_25 = r166_5
          r166_25(r166_24, "DhcpDomain", 8)
          r166_25 = r166_5
          r166_25(r166_24, "DefaultGateway", 16)
          r166_25 = r166_5
          r166_25(r166_24, "DhcpDefaultGateway", 32)
          r166_25 = r166_5
          r166_25(r166_24, "IPAddress", 64)
          r166_25 = r166_5
          r166_25(r166_24, "DhcpIPAddress", 128)
          r166_25 = r166_5
          r166_25(r166_24, "SubnetMask", 256)
          r166_25 = r166_5
          r166_25(r166_24, "DhcpSubnetMask", 512)
          r166_25 = r166_5
          r166_25(r166_24, "NameServer", 1024)
          r166_25 = r166_5
          r166_25(r166_24, "DhcpNameServer", 2048)
        end
      end
    end
  end
  r166_19 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters\\DNSRegisteredAdapters"
  local r166_26 = sysio.RegOpenKey(r166_19)
  r166_20 = r166_26
  if r166_20 then
    local r166_27 = sysio.RegEnumKeys(r166_20)
    if r166_27 then
      for r166_28, r166_29 in ipairs(r166_27) do
        local r166_30 = sysio.RegOpenKey(string.format("%s\\%s", r166_19, r166_29))
        if r166_30 then
          local r166_31 = r166_5
          r166_31(r166_30, "AdapterDomainName", 4096)
          r166_31 = r166_5
          r166_31(r166_30, "Hostname", 8192)
          r166_31 = r166_5
          r166_31(r166_30, "PrimaryDomainName", 16384)
        end
      end
    end
  end
  r166_19 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\Tcpip6\\Parameters\\Interfaces"
  local r166_32 = sysio.RegOpenKey(r166_19)
  r166_20 = r166_32
  if r166_20 then
    local r166_33 = sysio.RegEnumKeys(r166_20)
    if r166_33 then
      for r166_34, r166_35 in ipairs(r166_33) do
        local r166_36 = sysio.RegOpenKey(string.format("%s\\%s", r166_19, r166_35))
        if r166_36 then
          local r166_37 = sysio.GetRegValueAsString(r166_36, "Dhcpv6DomainSearchList")
          if r166_37 then
            r166_37 = r166_37:lower()
            if not r166_3[r166_37] then
              r166_3[r166_37] = 1
              AppendToRollingQueue("TCP-searchList", r166_37, 1, 604800, 100)
            end
          end
        end
      end
    end
  end
  local r166_38, r166_39, r166_40 = pairs(r166_2)
  for r166_41, r166_42 in r166_38, r166_39, r166_40 do
    AppendToRollingQueue("domainInfo", r166_41, r166_42, 604800, 100)
  end
  return r166_1, r166_2, r166_3
end

function isValidLocalDomain(p168_0)
  p168_0 = p168_0:lower()
  local r168_0 = IsKeyValuePairInRollingQueue("domainInfo", "TCP-hostname", p168_0)
  if r168_0 then
    return 1
  end
  if not IsKeyInRollingQueue("domainInfo", p168_0)
    and 0 == (GetRollingQueueCount("domainInfo") or 0) then
    local r168_1, r168_2 = updateDomainInfo()
    if r168_1 == p168_0 then
      return 1
    end
    if r168_2[p168_0] then
      return 2
    end
  end
  return 0
end

function parseLogonEvent(p169_0)
  local r169_0 = split(p169_0.utf8p2, ";")
  local r169_1 = {}

  local function r169_2(p170_0, p170_1)
    local r170_0
    if p170_0 == "TN" or p170_0 == "Wsn" then
      local r170_1 = (p170_0 == "TN" or p170_0 == "Wsn" or p170_0 == "TDN" or p170_0 == "Ip")
        and tostring(p170_1)
      r170_0 = r170_1 or p170_1
    else
      local r170_2 = type(p170_1) == "string" and p170_1:lower()
      if r170_2 then
        r170_0 = r170_2
      else
        local r170_3 = (p170_0 == "TN" or p170_0 == "Wsn" or p170_0 == "TDN" or p170_0 == "Ip")
          and tostring(p170_1)
        r170_0 = r170_3 or p170_1
      end
    end
    return r170_0
  end

  if r169_0 then
    for r169_3, r169_4 in ipairs(r169_0) do
      local r169_5, r169_6 = pcall(kvsplit, r169_4, ":", r169_1, r169_2)
      if not r169_5 then
        error(r169_6 .. p169_0.utf8p2)
      end
    end
  end
  r169_0 = split(p169_0.utf8p1, ";")
  if r169_0 then
    for r169_7, r169_8 in ipairs(r169_0) do
      local r169_9, r169_10 = pcall(kvsplit, r169_8, ":", r169_1, r169_2)
      if not r169_9 then
        error(r169_10 .. p169_0.utf8p1)
      end
    end
  end
  if r169_1.TDN and r169_1.TDN ~= "" then
    r169_1.TFUN = r169_1.TDN:lower() .. "\\" .. r169_1.TN:lower()
  else
    r169_1.TFUN = r169_1.TN:lower()
  end
  if r0_14(r169_1) then
    r169_1.Ip = "LT:2"
  end
  return r169_1
end

function processPasswordChangeEvent(p171_0)
  local r171_0 = MpCommon.GetCurrentTimeT()
  MpCommon.OverwritePersistContextNoPath("RDP-PWC-" .. p171_0.TN,
    { r171_0 .. "_" .. p171_0.SDN .. "_" .. p171_0.SUN }, 315360000)
end

function isIPInExclusionList(p172_0, p172_1, p172_2)
  p172_1 = p172_1 or {}
  local r172_0 = {}
  if p172_2 then
    r172_0 = r0_51()
  end
  local r172_1 = convert_to_hashtable(p172_1, r172_0)
  if r172_1 then
    for r172_2 in pairs(r172_1) do
      local r172_3 = split(r172_2, "/")
      local r172_4 = r172_3[1]
      local r172_5 = r172_3[2]
      if r172_5 then
        local r172_6, r172_7 = pcall(isIPInNetmaskRange, p172_0, r172_4, r172_5)
        if r172_6 and r172_7 then
          return true
        end
      elseif r172_2 == p172_0 then
        return true
      end
    end
  end
  return false
end

function addDefenderIPExclusion(p173_0)
  local r173_0 = GetRollingQueueKeyValue("DefenderExclusion", "IpAddresses")
  if r173_0 then
    r173_0 = r173_0 .. "," .. p173_0
  else
    r173_0 = p173_0
  end
  AppendToRollingQueue("DefenderExclusion", "IpAddresses", r173_0, 3600, 2)
end

function removeDefenderIPExclusion(p174_0)
  local r174_0 = GetRollingQueueKeyValue("DefenderExclusion", "IpAddresses")
  if r174_0 then
    local r174_1 = split(r174_0, ",")
    local r174_2 = ""
    for r174_3, r174_4 in pairs(r174_1) do
      if r174_4 ~= p174_0 then
        local r174_5 = r174_2
        r174_2 = r174_5 .. "," .. r174_4
      end
    end
    AppendToRollingQueue("DefenderExclusion", "IpAddresses", r174_2, 3600, 2)
  end
end

function checkLogonSuccessEvent(p175_0)
  local r175_0 = parseLogonEvent(p175_0)
  local r175_1 = getIpAddressClass(r175_0.Ip)
  if r175_1 == 2 or r175_1 == 8 then
    return
  end
  if GetRollingQueueCount("RDP-Ip-Successful-Counter") >= 1000 then
    return
  end
  local r175_2 = r0_29()
  if r175_2.status == 4 then
    return
  end
  if IsKeyInRollingQueue("BruteForceProtection-Cloud-Config", "signature_disable") then
    return
  end
  local r175_3 = true
  r175_3 = not r0_12() and r175_3
  r0_28()
  if r0_15(r175_0) then
    r0_58(r175_0, true, r175_3)
    local r175_4, r175_5 = r0_33(r175_0)
    local r175_6 = tonumber(GetRollingQueueKeyValue("RDP-Ip-Successful-Counter", r175_0.Ip))
    r175_6 = not (r175_6 == 1 or GetRollingQueueKeyValue("BruteForceCloudQueryHistory", r175_0.Ip))
      and 1
      or r175_6
    if mp.bitand(r175_4, 1) == 1 or r175_6 == 1 then
      local r175_7 = r0_54(r175_5, r175_0, r175_3)
      r175_7.ip_address_class = r175_1
      if r175_1 == 1 and r175_2.block_local_ip == false then
        return
      end
      if r175_1 ~= 3 then
        r175_7.TAG = "NOLOOKUP"
      end
      if GetRollingQueueKeyValue("SuccessCloudCallProcessingQueue", r175_0.Ip) == "1" then
        r0_27("BF-HighVolumeRequest", r175_0.Ip, 1, 86400, 1000)
        return
      end
      AppendToRollingQueue("SuccessCloudCallProcessingQueue", r175_0.Ip, 1, 300, 1000)
      AppendToRollingQueue("BruteForceCloudQueryHistory", r175_0.Ip, 0, 604800, 1000)
      r175_7.CONTEXT_SOURCE = "LBFS"
      local r175_8 = SafeGetUrlReputation({ r175_0.Ip }, r175_7, false, 4000, false)
      local r175_9, r175_10, r175_11, r175_12, r175_13 = nil, nil, nil, nil, nil
      if r175_8.urls[r175_0.Ip] then
        r175_9 = r175_8.urls[r175_0.Ip].determination
        r175_10 = r175_8.urls[r175_0.Ip].confidence
        r175_11 = r175_8.urls[r175_0.Ip].context.source
        local r175_14 = r175_8.urls
        r175_14 = r175_14[r175_0.Ip].context
        local r175_15 = r175_14.signature_disable_ttl
        r175_14 = r175_8.urls
        r175_14 = r175_14[r175_0.Ip].context
        local r175_16 = r175_14.clean_bf_resources
        if r175_15 then
          AppendToRollingQueue("BruteForceProtection-Cloud-Config", "signature_disable", r175_15,
            tonumber(r175_15))
        end
        if r175_16 then
          r0_38()
          return
        end
      elseif r175_8.error == 3 then
        r0_27("BF-FailedCloudCalls", "Counter", 1, 86400, 10)
        AppendToRollingQueue("BF-FailedCloudCalls", "LastError", r175_8.err_msg, 86400, 10)
      end
      AppendToRollingQueue("SuccessCloudCallProcessingQueue", r175_0.Ip, 0, 1, 1000)
      if r175_9 == 2 and r175_11 == "BruteforceReputationLookup" and r175_10 >= 70 then
        local r175_17 = {
          IP = r175_0.Ip, WorkStationName = r175_0.Wsn, CONTEXT_SOURCE = "LBFS",
          Username = r175_0.TN, DomainName = r175_0.TDN
        }
        local r175_18 = nil
        local r175_19 = { 180, 900, 3600, 21600, 86400, 604800 }
        local r175_20 = r0_27("RDP_blocked_IP", r175_0.Ip, 1, 604800, 1000)
        r175_20 = math_min(5, r175_20)
        if r175_10 == 100 then
          r175_18 = math_max(r175_19[r175_20], r175_19[3])
        else
          r175_18 = r175_19[r175_20]
        end
        if r175_2.MaxTimeout and r175_2.MaxTimeout ~= 0 then
          r175_18 = math_min(r175_2.MaxTimeout, r175_18)
        end
        if r175_2.AggressiveLevel == 0 and r175_10 == 100
          or r175_2.AggressiveLevel == 1 and r175_10 >= 70
          or r175_2.AggressiveLevel == 2 then
          if r175_2.status == 1 then
            r175_17.FirewallRuleId = MpCommon.AddBlockingFirewallRule(r175_0.Ip, r175_18, true)
            r175_17.BlockingTimeout = r175_18
          end
          bm.trigger_sig("BruteForceDetectionAdditionalInfo", safeJsonSerialize(r175_17))
        end
        AppendToRollingQueue("RDP-Ip-Successful-Counter", r175_0.Ip, 0, 604800, 1000, 1)
        AppendToRollingQueue("RDP-WSN-Successful-Counter", r175_0.Ip, 0, 604800, 1000, 1)
      elseif r175_5.IpScore and r175_5.IpScore > 0 then
        AppendToRollingQueue("RDP_Ip", r175_0.Ip, 0, 604800, 1000, 1)
        AppendToRollingQueue("RDP_Usr", r175_0.TFUN, 0, 604800, 1000, 1)
        AppendToRollingQueue("RDP_blocked_IP", r175_0.Ip, 0, 604800, 1000, 1)
      end
    end
  end
end

function checkLogonFailureEvent(p176_0)
  local function r176_0(p177_0, ...)
    local r177_1 = { pcall(p177_0, ...) }
    if not r177_1[1] then
      error(r177_1[2])
    end
    return table_unpack(r177_1, 2)
  end

  local r176_1 = r176_0(parseLogonEvent, p176_0)
  local r176_2 = r176_0
  r176_2 = r176_2(getIpAddressClass, r176_1.Ip)
  if r176_2 == 2 or r176_2 == 8 then
    return
  end
  if GetRollingQueueCount("RDP-Ip-Successful-Counter") >= 1000
    or GetRollingQueueCount("FW-IPs-Extended") >= 1000 then
    return
  end
  local r176_3 = r176_0(r0_29)
  if r176_3.status == 4 then
    return
  end
  if IsKeyInRollingQueue("BruteForceProtection-Cloud-Config", "signature_disable") then
    return
  end
  local r176_4 = true
  r176_4 = not r176_0(r0_12) and r176_4
  r0_28()
  if (r176_3.status == 0 or r176_3.status == 2) and r0_35(r176_1.Ip) then
    return
  end
  if r0_15(r176_1) then
    if r176_2 ~= 1 and r0_25(r176_1.Ip) then
      return
    end
    if r176_0(isIPInExclusionList, r176_1.Ip, r176_3.ip_exclusion_list, true) then
      return
    end
    r176_0(r0_58, r176_1, false, r176_4)
    local r176_5, r176_6 = r0_63(r176_1)
    if r176_3.learning_mode and not r0_28() then
      return
    end
    if GetRollingQueueKeyValue("CloudCallProcessingQueue", r176_1.Ip) == "1" then
      r0_27("BF-HighVolumeRequest", r176_1.Ip, 1, 86400, 1000)
      return
    end
    local r176_7, r176_8, r176_9 = nil, nil, nil
    if mp.bitand(r176_5, 1) == 1 then
      local r176_10 = r176_0(r0_54, r176_6, r176_1, r176_4)
      local r176_11 = r176_0
      r176_11 = r176_11(safeJsonSerialize, r176_3)
      r176_10.config = r176_11
      r176_10.ip_address_class = r176_2
      r176_11 = r176_3.block_local_ip
      local r176_12, r176_13, r176_14
      if r176_11 or r176_2 ~= 1 then
        AppendToRollingQueue("CloudCallProcessingQueue", r176_1.Ip, 1, 300, 1000)
        r176_10.CONTEXT_SOURCE = "LBFF"
        if r176_2 ~= 3 then
          r176_10.TAG = "NOLOOKUP"
        end
        local r176_15 = SafeGetUrlReputation
        local r176_16 = {}
        local r176_17 = r176_1.Ip
        r176_16[1] = r176_17
        r176_17 = r176_10
        local r176_18 = r176_15(r176_16, r176_17, false, 4000, false)
        r176_15 = r176_18.urls
        if r176_15[r176_1.Ip] then
          local r176_19 = r176_18.urls[r176_1.Ip]
          r176_12 = r176_19.determination
          r176_19 = r176_18.urls[r176_1.Ip]
          r176_13 = r176_19.confidence
          r176_19 = r176_18.urls
          r176_19 = r176_19[r176_1.Ip].context
          r176_14 = r176_19.source
          r176_19 = r176_18.urls
          r176_19 = r176_19[r176_1.Ip].context
          local r176_20 = r176_19.signature_disable_ttl
          r176_19 = r176_18.urls
          r176_19 = r176_19[r176_1.Ip].context
          local r176_21 = r176_19.clean_bf_resources
          if r176_20 then
            AppendToRollingQueue("BruteForceProtection-Cloud-Config", "signature_disable", r176_20,
              tonumber(r176_20))
          end
          if r176_21 then
            local r176_22 = r176_0
            r176_22(r0_38)
            return
          end
        elseif r176_18.error == 3 then
          r0_27("BF-FailedCloudCalls", "Counter", 1, 86400, 10)
          AppendToRollingQueue("BF-FailedCloudCalls", "LastError", r176_18.err_msg, 86400, 10)
          r176_12, r176_13, r176_14 = r176_7, r176_8, r176_9
        else
          r176_12, r176_13, r176_14 = r176_7, r176_8, r176_9
        end
      else
        r176_12, r176_13, r176_14 = r176_7, r176_8, r176_9
      end
      if r176_12 == 1 and r176_14 == "BruteforceReputationLookup" then
        AppendToRollingQueue("RDP_Ip", r176_1.Ip, 0, 604800, 1000, 1)
        AppendToRollingQueue("RDP_Usr", r176_1.TFUN, 0, 604800, 1000, 1)
        AppendToRollingQueue("RDP_blocked_IP", r176_1.Ip, 0, 604800, 1000, 1)
      else
        local r176_23 = nil
        local r176_24 = { 180, 900, 3600, 21600, 86400, 604800 }
        local r176_25 = r0_27("RDP_blocked_IP", r176_1.Ip, 1, 604800, 1000)
        local r176_26 = math_min(5, r176_25)
        r176_25 = r176_26
        if r176_13 == 100 then
          r176_23 = math_max(r176_24[r176_25], r176_24[3])
        else
          r176_23 = r176_24[r176_25]
        end
        r176_26 = r176_3.MaxTimeout
        if r176_26 and r176_3.MaxTimeout ~= 0 then
          r176_23 = math_min(r176_3.MaxTimeout, r176_23)
        end
        if r176_2 == 1 and not r176_3.block_local_ip then
          local r176_27 = GetRollingQueueKeyValue("domainInfo", r176_1.Ip)
          local r176_28
          if r176_27 and mp.bitand(r176_27, 48) ~= 0 then
            r176_28 = true
          else
            r176_28 = false
          end
          if not r176_28 then
            return
          end
          local r176_29 = versioning.IsSampled(20000, true, true, true)
          if r176_29 then
            r176_10.CONTEXT_SOURCE = "LBFF"
            r176_10.TAG = "NOLOOKUP"
            local r176_30 = SafeGetUrlReputation
            local r176_31 = {}
            local r176_32 = r176_1.Ip
            r176_31[1] = r176_32
            r176_32 = r176_10
            local r176_33 = r176_30(r176_31, r176_32, false, 2000, false)
            r176_30 = r176_33.urls
            if r176_30[r176_1.Ip] then
              local r176_34 = r176_33.urls[r176_1.Ip]
              local r176_35 = r176_34.determination
              r176_34 = r176_33.urls[r176_1.Ip]
              r176_13 = r176_34.confidence
              r176_34 = r176_33.urls
              r176_34 = r176_34[r176_1.Ip].context
              local r176_36 = r176_34.source
              r176_34 = r176_33.urls
              r176_34 = r176_34[r176_1.Ip].context
              local r176_37 = r176_34.signature_disable_ttl
              r176_34 = r176_33.urls
              r176_34 = r176_34[r176_1.Ip].context
              local r176_38 = r176_34.clean_bf_resources
              if r176_37 then
                AppendToRollingQueue("BruteForceProtection-Cloud-Config", "signature_disable",
                  r176_37, tonumber(r176_37))
              end
              if r176_38 then
                r0_38()
                return
              end
            elseif r176_33.error == 3 then
              r0_27("BF-FailedCloudCalls", "Counter", 1, 86400, 10)
              AppendToRollingQueue("BF-FailedCloudCalls", "LastError", r176_33.err_msg, 86400, 10)
            end
          end
        end
        if r176_3.AggressiveLevel == 0 and r176_13 == 100
          or r176_3.AggressiveLevel == 1 and r176_13 >= 70
          or r176_3.AggressiveLevel == 2 then
          local r176_39 = {}
          r176_39.IP = r176_1.Ip
          r176_39.WorkStationName = r176_1.Wsn
          r176_39.CONTEXT_SOURCE = "LBFF"
          local r176_40 = r176_1.TN
          r176_39.Username = r176_40
          r176_40 = r176_1.TDN
          r176_39.DomainName = r176_40
          r176_40 = r176_3.status
          if r176_40 == 1 then
            local r176_41 = MpCommon.AddBlockingFirewallRule(r176_1.Ip, r176_23, true)
            r176_39.FirewallRuleId = r176_41
            r176_39.BlockingTimeout = r176_23
          end
          bm.trigger_sig("BruteForceDetectionAdditionalInfo", safeJsonSerialize(r176_39))
        end
        r0_34(r176_1.Ip, r176_23)
        AppendToRollingQueue("CloudCallProcessingQueue", r176_1.Ip, 0, 1, 1000)
      end
    elseif r176_2 ~= 1 and versioning.IsSampled(100, false, true, true) then
      if GetRollingQueueCount("RDP-IP-Failed-Counter") == 1000 then
        return
      end
      if GetRollingQueueKeyValue("RDP-IP-Failed-Counter", r176_1.Ip) == "1"
        and GetRollingQueueKeyValue("RDP-Ip-Failed-Counter", r176_1.Ip) == nil then
        local r176_42 = r0_54(r176_6, r176_1, r176_4)
        r176_42.ip_address_class = r176_2
        r176_42.CONTEXT_SOURCE = "LBFF"
        r176_42.reason = "spraying attack"
        local r176_43 = SafeGetUrlReputation
        local r176_44 = {}
        local r176_45 = r176_1.Ip
        r176_44[1] = r176_45
        r176_45 = r176_42
        local r176_46 = r176_43(r176_44, r176_45, false, 2000, false)
        r176_43 = r176_46.urls
        if r176_43[r176_1.Ip] then
          local r176_47 = r176_46.urls[r176_1.Ip]
          local r176_48 = r176_47.determination
          r176_47 = r176_46.urls[r176_1.Ip]
          local r176_49 = r176_47.confidence
          r176_47 = r176_46.urls
          r176_47 = r176_47[r176_1.Ip].context
          local r176_50 = r176_47.source
          r176_47 = r176_46.urls
          r176_47 = r176_47[r176_1.Ip].context
          local r176_51 = r176_47.signature_disable_ttl
          r176_47 = r176_46.urls
          r176_47 = r176_47[r176_1.Ip].context
          local r176_52 = r176_47.clean_bf_resources
          if r176_51 then
            AppendToRollingQueue("BruteForceProtection-Cloud-Config", "signature_disable", r176_51,
              tonumber(r176_51))
          end
          if r176_52 then
            r0_38()
            return
          end
          if r176_49 == 100 then
            r0_27("RDP_Ip", r176_1.Ip, 100, 604800, 1000)
          end
        elseif r176_46.error == 3 then
          r0_27("BF-FailedCloudCalls", "Counter", 1, 86400, 10)
          AppendToRollingQueue("BF-FailedCloudCalls", "LastError", r176_46.err_msg, 86400, 10)
        end
      end
    end
  end
end

local function r0_68(p178_0)
  local r178_0 = {}
  local r178_1 = {
    "GenB_FLAG_SameExtension", "GenB_FLAG_Encrypt3Folder", "GenB_FLAG_SameRenameFolder",
    "GenB_FLAG_AllFileUnknown", "GenB_FLAG_SameMagicByte", "GenB_FLAG_AllFileHasHighEntropy",
    "GenB_FLAG_AllFileMagicExtMismatch"
  }
  for r178_2 = 1, #r178_1 do
    table.insert(r178_0,
      r178_1[r178_2] .. "=" .. tostring(mp.bitand(p178_0, math_pow(2, r178_2 - 1)) > 0))
  end
  return r178_0
end

function RansomwareFeatures()
  local r179_0, r179_1, r179_2, r179_3, r179_4, r179_5, r179_6, r179_7 = 1, 2, 4, 8, 16, 32, 64, 0
  local r179_8 = bm.get_current_process_startup_info()
  r179_8 = r179_8.ppid or -1
  local r179_9 = "genb_ransom_meta_" .. r179_8
  local r179_10 = MpCommon.RollingQueueCount(r179_9)
  if r179_10 ~= nil and r179_10 >= 25 and r179_10 <= 100 then
    local r179_11 = GetRollingQueue(r179_9)
    if r179_11 == nil or type(r179_11) ~= "table" then
      return mp.CLEAN
    end
    do
      local r179_12, r179_13 = "", ""
      local r179_14 = {}
      local r179_15 = 0
      local r179_16 = {}
      local r179_17, r179_18 = 0, 0
      local r179_19 = {}
      local r179_20, r179_21, r179_22, r179_23 = 0, 0, 0, ""
      local r179_24, r179_25, r179_26, r179_27, r179_28, r179_29 = "", "", "", "", "", ""
      local r179_30, r179_31, r179_32 = ipairs(r179_11)
      local r179_33 = false
      for r179_34, r179_35 in r179_30, r179_31, r179_32 do
        local r179_36 = explode(r179_35.value, "|")
        local r179_37 = r179_36
        local r179_38 = r179_37[1]
        local r179_39 = r179_37[2]
        local r179_40 = r179_37[3]
        local r179_41 = r179_37[4]
        local r179_42 = r179_37[6]
        local r179_43 = r179_37[7]
        r179_36 = r179_16[r179_38]
        if r179_36 ~= 1 then
          r179_17 = r179_17 + 1
          r179_16[r179_38] = 1
        end
        r179_36 = string
        r179_36 = r179_36.match
        r179_36 = r179_36(r179_39, "(.*[/\\])")
        r179_12 = r179_36
        r179_36 = mp
        r179_36 = r179_36.crc32
        r179_36 = r179_36(0, r179_12, 1, #r179_12)
        local r179_44 = r179_36
        r179_36 = r179_14[r179_44]
        if r179_36 ~= 1 then
          r179_15 = r179_15 + 1
          r179_14[r179_44] = 1
        end
        r179_36 = string
        r179_36 = r179_36.match
        r179_36 = r179_36(r179_40, "(.*[/\\])")
        if r179_36 ~= r179_12 and r179_33 == false then
          r179_33 = true
        end
        if r179_41 == "Unknown" then
          r179_18 = r179_18 + 1
        end
        r179_36 = r179_19[r179_42]
        if r179_36 ~= 1 then
          r179_20 = r179_20 + 1
          r179_19[r179_42] = 1
        end
        r179_36 = ExtensionToMagicMismatch
        r179_36 = r179_36(r179_38, r179_42)
        if r179_36 == true then
          r179_22 = r179_22 + 1
        end
        if r179_43 >= 7 then
          r179_21 = r179_21 + 1
        end
      end
      if r179_17 == 1 then
        r179_7 = mp.bitor(r179_7, r179_0)
      end
      if r179_15 > 3 then
        r179_7 = mp.bitor(r179_7, r179_1)
      end
      if r179_33 == false then
        r179_7 = mp.bitor(r179_7, r179_2)
      end
      if r179_18 == r179_10 then
        r179_7 = mp.bitor(r179_7, r179_3)
      end
      if r179_20 == 1 then
        r179_7 = mp.bitor(r179_7, r179_4)
      end
      if r179_21 == r179_10 then
        r179_7 = mp.bitor(r179_7, r179_5)
      end
      if r179_22 == r179_10 then
        local r179_45 = mp.bitor(r179_7, r179_6)
        r179_7 = r179_45
      end
    end
  end
  return r0_68(r179_7)
end

function taint(p180_0, p180_1, p180_2, p180_3, p180_4)
  p180_4 = p180_4 or 500
  local r180_0 = p180_3 or ""
  local r180_1, r180_2 = pcall(MpCommon.RollingQueueCreate, p180_1, p180_4, p180_2, 1)
  if r180_1 then
    local r180_3, r180_4 = pcall(MpCommon.RollingQueueAppend, p180_1, p180_0, r180_0, p180_2)
    r180_2 = r180_4
    return r180_3
  end
  return false
end

function isTainted(p181_0, p181_1)
  local r181_0, r181_1 = pcall(MpCommon.RollingQueueQueryKey, p181_1, p181_0)
  local r181_2
  if r181_0 and r181_1 then
    r181_2 = r181_1.value
  end
  local r181_3 = r181_0 and r181_1 ~= nil
  local r181_4 = r181_2
  return r181_3, r181_4
end

local function r0_69(p182_0)
  local r182_0, r182_1 = pcall(MpCommon.RollingQueueCount, p182_0)
  if r182_0 then
    return r182_1
  end
  return 0
end

local function r0_70(p183_0)
  return MpCommon.GetPersistContextCount(p183_0)
end

function checkFilePathInProcessCommandline(p184_0, p184_1, p184_2, p184_3)
  if p184_0 ~= nil and p184_1 ~= nil then
    local r184_0 = p184_3
    r184_0 = (p184_3 == 0 or p184_3 == nil) and 3 or r184_0
    local r184_1 = mp.GetProcessCommandLine(p184_0)
    if r184_1 ~= nil and string.find(r184_1, p184_1, 1, true) then
      return true
    end
    if p184_2 == true then
      return checkParentCmdline(p184_0, { { "", p184_1 } }, r184_0)
    end
    return false
  end
  return false
end

function parseNetworkVolumeEvent(p185_0)
  if not p185_0.matched then
    return
  end
  local r185_0 = {}
  local r185_1 = {}
  local r185_2 = {}
  local r185_3, r185_4 = nil, nil
  r185_1 = split(p185_0.utf8p1, ";", r185_1)
  r185_2 = split(p185_0.utf8p2, ";", r185_2)
  for r185_5, r185_6 in pairs(r185_2) do
    table.insert(r185_1, r185_6)
  end
  for r185_7, r185_8 in ipairs(r185_1) do
    if r185_8 ~= nil then
      local r185_9, r185_10, r185_11, r185_12 = string.find(r185_8, "(%w+)%s*=%s*(.+)", 0)
      r185_4 = r185_12
      r185_3 = r185_11
      r185_7 = r185_10
      r185_7 = r185_9
      if r185_3 ~= nil and r185_4 ~= nil then
        r185_0[r185_3] = r185_4
      end
    end
  end
  return r185_0
end

function addOverallNetworkVolume()
  local r186_0 = bm.GetOverallTrafficVolumes()
  local r186_1 = {}
  if r186_0 and #r186_0 > 0 then
    r186_1 = safeJsonSerialize(r186_0)
    bm.add_related_string("BmNetOverallvolumeLen", "" .. #r186_1, bm.RelatedStringBMReport)
    bm.add_related_string("BmNetOverallvolume", r186_1, bm.RelatedStringBMReport)
  end
  return r186_1
end

function reportPcallEx()
  local r187_0 = "LuaError"
  local r187_1 = GetRollingQueueKeys(r187_0)
  if r187_1 ~= nil and type(r187_1) == "table" then
    for r187_2, r187_3 in ipairs(r187_1) do
      bm.add_related_string(r187_0, r187_3, bm.RelatedStringBMReport)
    end
  end
end

function reportLuaErrors(p188_0)
  if GetRollingQueueKeys("LuaError") then
    bm.trigger_sig("BMSigLuaErrors", p188_0)
  end
end

function reportRdTrace()
  local r189_0 = "RdTrace"
  local r189_1 = GetRollingQueueKeys(r189_0)
  if r189_1 ~= nil and type(r189_1) == "table" then
    for r189_2, r189_3 in ipairs(r189_1) do
      bm.add_related_string(r189_0, r189_3, bm.RelatedStringBMReport)
    end
  end
end

function isSensitiveFileForLinux(p190_0)
  local r190_0 = {
    prefix = {
      "/etc/shadow", "/etc/passwd", "/etc/sudoers", "/etc/system.d/", "/etc/rc", "/etc/init.d/",
      "/etc/rc.d/init.d/", "/etc/init/", "/etc/hosts", "/etc/resolv.conf", "/etc/profile",
      "/etc/crontab", "/etc/bash.bashrc", "/etc/profile.d/", "/etc/cron", "/etc/iptables/",
      "/etc/sysconfig/iptables", "/etc/audit/audit.rules", "/opt/microsoft/mdatp/conf/mdatp.rules",
      "/opt/microsoft/mdatp/conf/mdatp.conf", "/etc/modules", "/etc/modprobe.d/",
      "/etc/default/grub", "/etc/apt/sources.list", "/etc/gshadow", "/etc/group"
    },
    substr = {
      "/.aws/credentials", "/.aws/config", "/.docker/config.json", "private-keys-v1.d",
      "/secring.gpg"
    },
    regex = {
      "^/home/(%w+)/%.ssh/", "^/home/(%w+)/%.bash_profile$", "^/home/(%w+)/%.bash_login$",
      "^/home/(%w+)/%.bash_history$", "^/home/(%w+)/%.profile$", "^/home/(%w+)/%.bashrc$",
      "^/home/(%w+)/%.tcshrc$", "^/home/(%w+)/%.cshrc$", "^/home/(%w+)/%.kshrc$",
      "^/home/(%w+)/%.zshrc$", "^/home/(%w+)/%.shrc$"
    }
  }
  if p190_0 ~= nil and p190_0 ~= "" then
    for r190_1, r190_2 in ipairs(r190_0.prefix) do
      if string.find(p190_0, r190_2, 1, true) == 1 then
        return true
      end
    end
    for r190_3, r190_4 in ipairs(r190_0.substr) do
      if string.find(p190_0, r190_4, 1, true) then
        return true
      end
    end
    for r190_5, r190_6 in ipairs(r190_0.regex) do
      if string.find(p190_0, r190_6) then
        return true
      end
    end
    return false
  end
  return false
end

function extractDllForRegproc(p191_0)
  if p191_0 == nil then
    return
  end
  if not p191_0 then
    return
  end
  local r191_0 = string.lower(p191_0)
  p191_0 = r191_0
  r191_0 = string
  r191_0 = r191_0.find
  r191_0 = r191_0(p191_0, '^%s*"')
  if r191_0 then
    local r191_1 = string.gsub(p191_0, '^%s*"[^"]*regsvr32[%.ex]*"%s', "")
    p191_0 = r191_1
    r191_1 = string
    r191_1 = r191_1.gsub
    r191_1 = r191_1(p191_0, '^%s*"[^"]*rundll32[%.ex]*"%s', "")
    p191_0 = r191_1
  else
    local r191_2 = string.gsub(p191_0, "^%s*[%S]*regsvr32[%.ex]*%s", "")
    p191_0 = r191_2
    r191_2 = string
    r191_2 = r191_2.gsub
    r191_2 = r191_2(p191_0, "^%s*[%S]*rundll32[%.ex]*%s", "")
    p191_0 = r191_2
  end
  local r191_3 = string.gsub(p191_0, "[/-]%l+%s", "")
  p191_0 = r191_3
  r191_3 = string
  r191_3 = r191_3.gsub
  r191_3 = r191_3(p191_0, "[/-]i:[%S]+", "")
  p191_0 = r191_3
  r191_3 = string
  r191_3 = r191_3.find
  r191_3 = r191_3(p191_0, '^%s*"')
  local r191_4
  if r191_3 then
    local r191_5, r191_6, r191_7 = string.find(p191_0, '^%s*"([^",]+)"')
    r191_4 = r191_7
    _ = r191_6
    _ = r191_5
  else
    local r191_8, r191_9, r191_10 = string.find(p191_0, "^%s*([^%s,]+)")
    r191_4 = r191_10
    _ = r191_9
    _ = r191_8
  end
  if r191_4 and string.find(r191_4, "%.+$") then
    r191_4 = string.gsub(r191_4, "%.+$", "")
  end
  if r191_4 then
    local r191_11 = string.gsub(r191_4, "/", "\\")
    local r191_12 = false
    local r191_13 = StringStartsWith(r191_11, "\\\\")
    if r191_13 or r191_12 then
      r191_11 = "\\" .. string.gsub(r191_11, "\\+", "\\")
    else
      r191_11 = string.gsub(r191_11, "\\+", "\\")
    end
    r191_13 = string
    r191_13 = r191_13.gsub
    r191_13 = r191_13(r191_11, "^\\\\%.\\", "")
    r191_11 = r191_13
    r191_13 = string
    r191_13 = r191_13.gsub
    r191_13 = r191_13(r191_11, "\\%.\\", "\\")
    r191_11 = r191_13
    r191_13 = string
    r191_13 = r191_13.gsub
    r191_13 = r191_13(r191_11, "^\\\\%?\\", "")
    r191_11 = r191_13
    r191_13 = string
    r191_13 = r191_13.gsub
    local r191_14 = r191_11
    r191_13 = r191_13(r191_14, "^\\\\localhost\\c%$\\", "c:\\")
    r191_11 = r191_13
    r191_13 = string
    r191_13 = r191_13.gsub
    r191_14 = r191_11
    r191_13 = r191_13(r191_14, "^\\\\127%.0%.0%.1\\c%$\\", "c:\\")
    r191_4 = r191_13
  end
  return r191_4
end

function reportGenericRansomwareRQ(p192_0)
  if p192_0 ~= nil and p192_0 ~= "" then
    local r192_0, r192_1, r192_2 = "dummy_image_path", "dummy_proc_info", ""
    local r192_3 = GetRollingQueueAsHashTable(p192_0)
    if r192_3 == nil then
      return mp.CLEAN
    end
    if r192_3.cur_image_path ~= nil then
      r192_0 = r192_3.cur_image_path
    end
    if r192_3.proc_info ~= nil then
      r192_1 = r192_3.proc_info
    end
    if r192_3.appended_ext ~= nil then
      r192_2 = r192_3.appended_ext
    end
    if r192_0 ~= "" and r192_1 ~= "" then
      local r192_4 = bm.get_current_process_startup_info()
      r192_4 = r192_4 == nil and "-2" or r192_4.ppid
      bm.add_related_file(r192_0)
      bm.add_related_string("debug_proc_info", "old <" .. r192_1 .. "> new <" .. r192_4 .. ">",
        bm.RelatedStringBMReport)
      bm.add_related_string("ransom_extension", r192_2, bm.RelatedStringBMReport)
      local r192_5 = StringSplit(r192_3.renamed_file_path, ",")
      if r192_5 ~= nil or #r192_5 ~= 0 then
        for r192_6 = 1, #r192_5 do
          bm.add_related_file(r192_5[r192_6])
        end
      end
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end

function isCurrentProcessFriendly()
  local r193_0 = bm.get_current_process_startup_info()
  return MpCommon.IsFriendlyProcess(r193_0.ppid)
end

function CheckIfProcessTreePartOfTaintExecution(p194_0, p194_1, p194_2)
  if p194_1 == 0 then
    return false
  end
  local r194_0 = p194_1
  r194_0 = (p194_1 == nil or p194_1 < 0 or p194_1 > 5) and 5 or r194_0
  local r194_1 = p194_0
  if p194_0 == nil or p194_0 == "" then
    local r194_2 = bm.get_current_process_startup_info()
    if r194_2 == nil or r194_2.ppid == nil or r194_2.ppid == "" then
      return false
    end
    r194_1 = r194_2.ppid
  end
  local r194_3 = "queue_pid_taintfactory_a"
  if p194_2 and IsKeyInRollingQueue(r194_3, r194_1, true) then
    return true
  end
  local r194_4 = mp.GetParentProcInfo(r194_1)
  if r194_4 == nil or r194_4.ppid == nil or r194_4.image_path == nil then
    return
  end
  if IsKeyInRollingQueue(r194_3, r194_1, true) then
    return true
  end
  return CheckIfProcessTreePartOfTaintExecution(r194_4.ppid, r194_0 - 1)
end

function TerminateParentProcessForLinux(p195_0, p195_1)
  if p195_1 == 0 then
    return
  end
  local r195_0 = p195_1
  r195_0 = (p195_1 == nil or p195_1 < 0 or p195_1 > 5) and 5 or r195_0
  local r195_1 = p195_0
  if p195_0 == nil or p195_0 == "" then
    local r195_2 = bm.get_current_process_startup_info()
    if r195_2 == nil or r195_2.ppid == nil or r195_2.ppid == "" then
      return
    end
    r195_1 = r195_2.ppid
  end
  local r195_3 = {
    prefix = {
      "/var/tmp/", "/var/mail/", "/var/spool/mail/", "/var/lock/", "/dev/shm", "/home/",
      "/usr/bin/find", "/usr/bin/xargs"
    },
    substr = {
      "/python", "/perl", "/ruby", "/bash", "/dash", "/zsh", "/sh", "/ksh", "/ksh93", "/tcsh"
    }
  }

  local function r195_4(p196_0, p196_1, p196_2)
    for r196_0, r196_1 in ipairs(p196_2.prefix) do
      if string.find(p196_1, r196_1, 1, true) == 1 then
        return true
      end
    end
    for r196_2, r196_3 in ipairs(p196_2.substr) do
      if string.find(p196_1, r196_3, 1, true) then
        return true
      end
    end
    if isTainted(p196_1, "remote_file_created_taint") then
      return true
    end
    if versioning.GetCloudBlockLevel() >= 4 then
      local r196_4 = string.match(p196_0, "pid:(%w+),ProcessStart:(%w+)")
      if r196_4 ~= nil
        and tonumber(r196_4) > 6
        and string.find(p196_1, "/usr/lib/systemd/systemd", 1, true) ~= 1 then
        return true
      end
    end
    return false
  end

  local r195_5 = mp.GetParentProcInfo(r195_1)
  if r195_5 ~= nil and r195_5.ppid ~= nil and r195_5.image_path ~= nil then
    if r195_4(r195_5.ppid, r195_5.image_path, r195_3) then
      bm.add_threat_process(r195_5.ppid)
    end
    TerminateParentProcessForLinux(r195_5.ppid, r195_0 - 1)
  end
end

function RemediateProcessTreeForLinux(p197_0, p197_1)
  local r197_0 = p197_1
  r197_0 = (p197_1 == 0 or p197_1 == nil or p197_1 < 0 or p197_1 > 5) and 5 or r197_0
  local r197_1 = p197_0
  if p197_0 == nil or p197_0 == "" then
    local r197_2 = bm.get_current_process_startup_info()
    if r197_2 == nil or r197_2.ppid == nil or r197_2.ppid == "" then
      return
    end
    r197_1 = r197_2.ppid
  end
  TerminateParentProcessForLinux(r197_1, r197_0)
  local r197_3, r197_4 = bm.get_process_relationships(r197_1)
  for r197_5, r197_6 in ipairs(r197_4) do
    if r197_6 ~= nil and r197_6.ppid ~= nil then
      bm.add_threat_process(r197_6.ppid)
    end
  end
end

function IsExtensionDatePattern(p198_0)
  local r198_0 = {
    "^(%.)(%d+)/(%d+)/(%d+)$", "^(%.)(%d+)-(%d+)-(%d+)$", "^(%.)(%d+):(%d+):(%d+)$",
    "^(%.)(%d%d%d%d)(%d%d)(%d%d)$", "^(%-)(%d%d%d%d)(%d%d)(%d%d)$"
  }
  for r198_1, r198_2 in pairs(r198_0) do
    local r198_3, r198_4, r198_5, r198_6 = string.match(p198_0, r198_2)
    if r198_3 and r198_4 and r198_5 and r198_6 and r0_39(r198_4, r198_5, r198_6) then
      return true
    end
  end
  return false
end

function ValidateUniqueRQThreshold(p199_0, p199_1, p199_2, p199_3, p199_4, p199_5)
  local r199_0 = 0
  local r199_1, r199_2 = pcall(MpCommon.RollingQueueCreate, p199_0, p199_1, p199_2, 1)
  local r199_3 = r199_2
  if r199_1 then
    local r199_4, r199_5 = pcall(MpCommon.RollingQueueAppend, p199_0, p199_3, p199_4, p199_2)
    r199_3 = r199_5
    if r199_4 then
      local r199_6, r199_7 = pcall(MpCommon.RollingQueueCount, p199_0)
      r199_3 = r199_7
      local r199_8 = r199_6
      if r199_8 then
        if p199_5 <= r199_3 then
          return true
        end
        return false
      end
      return false
    end
    return false
  end
  return false
end

function getGpoDataStorePath(p200_0, p200_1, p200_2)
  if p200_0 ~= nil and p200_1 ~= nil then
    local r200_0 = nil
    if p200_2 == nil then
      r200_0 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\DataStore\\Machine"
    else
      r200_0 = "HKLM\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\DataStore\\"
        .. p200_2
    end
    local r200_1 = sysio.RegOpenKey(r200_0)
    if r200_1 == nil then
      return nil
    end
    local r200_2, r200_3 = nil, nil
    for r200_4, r200_5 in ipairs(sysio.RegEnumKeys(r200_1)) do
      local r200_6 = r200_0
      r200_2 = r200_6 .. "\\" .. r200_5
      r200_6 = sysio
      local r200_7 = r200_6.RegOpenKey(r200_2)
      if r200_7 and p200_0 == sysio.GetRegValueAsString(r200_7, "DomainName") then
        r200_3 = r200_7
        break
      end
      r200_3 = nil
    end
    if r200_3 == nil then
      return nil
    end
    local r200_8, r200_9, r200_10 = ipairs(sysio.RegEnumKeys(r200_3))
    local r200_11 = nil
    for r200_12, r200_13 in r200_8, r200_9, r200_10 do
      local r200_14, r200_15 = sysio.RegOpenKey, r200_2
      r200_15 = r200_15 .. "\\" .. r200_13
      local r200_16 = r200_14(r200_15)
      r200_14 = sysio.GetRegValueAsString(r200_16, "GPOName")
      r200_15 = r200_14
      r200_14 = r200_15.lower
      if p200_1 == r200_14(r200_15) then
        r200_11 = sysio.GetRegValueAsString(r200_16, "FileSysPath")
        break
      end
    end
    return r200_11
  end
  return nil
end

function parseGpoSysvolPath(p201_0)
  if p201_0 == nil then
    return nil
  end
  local r201_0, r201_1, r201_2 = p201_0:lower():match("\\\\(.+)\\sysvol\\(.+)\\policies\\({[0-9a-f\\-]+})\\.+")
  if r201_0 == r201_1 then
    return r201_0, r201_2
  end
  return nil
end

function isIEXfound(p202_0)
  if type(p202_0) == "string" then
    local r202_0 = false
    local r202_1 = p202_0:lower()
    p202_0 = r202_1
    r202_1 = {
      "[\\s;\\|\\=\\(>\\x22\\x27\\)]iex[\\s\\(\\x22\\x27]", "[|]iex[\\x22\\x27\\s]*$",
      "[|][^a-z]{0,4}i[^a-z]{0,4}e[^a-z]{0,4}x[^a-z]{0,4}$", "invoke-expression.*",
      "[.\\x22\\x27>]invoke[\\x22\\x27<(]", "^iex\\s+",
      "[char][int][decimal]::round(73.2)+[char][int][decimal]::round(68.9)+[char][int][decimal]::round(88)",
      "\\$shellid\\[\\d+\\]\\+\\$shellid\\[\\d+\\]\\+'x'",
      "[\\x22\\x27]i[\\x22\\x27]*\\+[\\x22\\x27]*e[\\x22\\x27]*\\+[\\x22\\x27]*x",
      "\\s*(iex|invoke-expression)"
    }
    for r202_2, r202_3 in ipairs(r202_1) do
      local r202_4, r202_5 = MpCommon.StringRegExpSearch(r202_3, p202_0)
      r202_2 = r202_5
      if r202_4 then
        return true
      end
    end
    return false
  end
  return false
end

function IsSenseRelatedProc()
  local r203_0 = {
    ["mssense.exe"] = true, ["senseir.exe"] = true, ["sensecm.exe"] = true, ["sensendr.exe"] = true,
    ["sensece.exe"] = true, ["mdecontaintoolv2.exe"] = true, ["openhandlecollector.exe"] = true,
    ["sensetvm.exe"] = true, ["senseap.exe"] = true
  }
  local r203_1 = string.lower(bm.get_imagepath())
  if r203_1 ~= nil
    and (string.find(r203_1, "\\program files\\windows defender advanced threat protection\\", 1,
      true)
      or string.find(r203_1,
        "\\programdata\\microsoft\\windows defender advanced threat protection\\", 1, true))
    and r203_0[string.match(r203_1, "\\([^\\]+)$")] then
    return true
  end
  local r203_2 = bm.get_current_process_startup_info()
  local r203_3 = mp.GetParentProcInfo(r203_2.ppid)
  if r203_3 ~= nil then
    local r203_4 = string.lower(r203_3.image_path)
    local r203_5 = string.find(r203_4,
      "\\program files\\windows defender advanced threat protection\\", 1, true)
    if (r203_5
      or string.find(r203_4,
        "\\programdata\\microsoft\\windows defender advanced threat protection\\", 1, true))
      and r203_0[string.match(r203_4, "\\([^\\]+)$")] then
      return true
    end
  end
  return false
end

function IsInThirdPartySecurityPath()
  local r204_0 = MpCommon.PathToWin32Path(bm.get_imagepath())
  if r204_0 then
    r204_0 = string.lower(r204_0)
    if not string.find(r204_0, "^c:\\program files\\")
      and not string.find(r204_0, "^c:\\program files %(x86%)\\")
      and not string.find(r204_0, "^c:\\programdata\\") then
      return false
    end
    local r204_1 = {
      ["2345soft"] = true, ["360"] = true, ["360safe"] = true, acronis = true,
      ["advanced monitoring agent"] = true, ahnlab = true, alibabaprotect = true,
      ["avast software"] = true, avg = true, avira = true, bitdefender = true, cato = true,
      ["cato networks"] = true, checkpoint = true, cisco = true, citrix = true, clamav = true,
      clamwin = true, comodo = true, confer = true, crowdstrike = true, cybercns = true,
      ["cybereason activeprobe"] = true, cylance = true, elastic = true, eset = true,
      ["f-secure"] = true, fortinet = true, halcyon = true, huorong = true, intermedia = true,
      ["kaspersky lab"] = true, ["keeper security"] = true, lavasoft = true, malwarebytes = true,
      mcafee = true, ["n-able"] = true, ["n-able technologies"] = true, norton = true,
      ["norton security"] = true, ["panda security"] = true, pcpitstop = true, picus = true,
      qax = true, rapid7 = true, reason = true, reasonlabs = true, rocketagent = true, seewo = true,
      sentinel = true, sentinelone = true, ["snow software"] = true, sophos = true, symantec = true,
      ["symantec.cloud"] = true, ["symantec endpoint protection cloud"] = true, tanium = true,
      tenable = true, threatsonar = true, titanagent = true, ["trend micro"] = true,
      typequick = true, vipre = true, ["vipre business agent"] = true, webroot = true, wrdata = true
    }
    local r204_2 = r204_0:match("^c:\\.-\\([^\\]+)\\")
    if r204_2 and r204_1[r204_2] then
      return true
    end
    return false
  end
  return false
end

function IsExcludedForXplatHeuristicTrigger(p205_0, p205_1)
  if p205_0 ~= nil and not (#p205_0 < 0) and p205_1 ~= nil and not (#p205_1 < 0) then
    local r205_0 = {
      { ".svn-base", "/.svn/pristine/", 1, 0 }, { ".php", "/twig_cache/", 1, 0 },
      { ".php", "/twig/", 1, 0 }, { ".php", "/wp-content/cache.bak/", 1, 0 },
      { ".php", "/wp-content/cache/", 1, 0 }, { ".php", "/smarty/templates_c", -1, 1 },
      { ".php", "/tmp/templates_c", -1, 1 }, { ".php", "/core/cache/catalog.config/", 1, 0 },
      { ".php", "cache/phpstan/", -1, 6 }, { ".php", "/storage/framework/views", 1, 0 },
      { ".php", "/cache/t_compile", 1, 0 }, { ".php", "/aec/app/cache", 1, 0 },
      { ".php", "/compiled_templates", 1, 0 }, { ".php", "/administrator/cache/", 1, 0 },
      { ".php", "/public_html/templates_c", 1, 0 }, { ".file", "/share/flatpak/repo/", 1, 0 },
      { ".file", "/flatpak/repo/tmp/flatpak-cache-", 1, 0 }, { ".py", "/python_stubs/", 1, 0 },
      { ".cch", "/blockcache", -1, 2 }, { ".vehicle", "/core/packages/", 1, 0 },
      { ".resolver", "/core/packages/", 1, 0 }, { "", "/diff/usr/lib/.build-id/", -1, 6 },
      { "", "/.metadata/.plugins/org.eclipse.core.resources/.history", -1, 6 },
      { "", "/library/developer/xcode/deriveddata/", 1, 0 },
      { "", "node_modules/esbuild/bin/esbuild", 1, 0 },
      { "", "esbuild/darwin-arm64/bin/esbuild", 1, 0 }, { "", "/smarty", -1, 0 },
      { "", "/smarty/", 1, 0 }, { "", "/smarty_site_cache/", 1, 0 },
      { "", "/.codeium/windsurf/code_tracker/active/", 1, 0 },
      { "", "/.codeium/code_tracker/active/", 1, 0 }, { "", "/node_modules/.bin/store/", 1, 0 },
      { "", "/kaspersky/klnagent/", 1, 0 }, { "", "/kaspersky lab/klnagent/", 1, 0 },
      { "", "/.cache/mozilla/", 1, 0 }, { "", "/bmc/bladelogic/", 1, 0 },
      { "", "/bitrix/managed_cache/", 1, 0 }, { "", "dropbox/.dropbox.cache/old_files", 1, 0 },
      { "", "/.git/lfs/", 1, 0 }, { "", "/lfs/objects/", 1, 0 }, { "", "/.git/modules/", 1, 0 },
      { "", "/.cache/", 1, 0 }, { "", "/cache/", 1, 0 }, { "", "/hashes/objects", 1, 0 },
      { "", "/flatpak/repo/", 1, 0 }, { "", "qualet", 1, 0 }, { "", "azure", 1, 0 },
      { "", "-jenkins-agent/workspace/", 1, 0 }, { "", "/build/intermediates.noindex/", 1, 0 }
    }
    local r205_1, r205_2, r205_3, r205_4 = nil, nil, nil, nil
    for r205_5, r205_6 in ipairs(r205_0) do
      if #r205_6 == 4 then
        local r205_7 = r205_6[1]
        local r205_8 = r205_6[2]
        local r205_9 = r205_6[3]
        local r205_10 = r205_6[4]
        if r205_7 ~= nil
          and r205_8 ~= nil
          and r205_9 ~= nil
          and r205_10 ~= nil
          and (r205_7 == "" or string.find(p205_1, r205_7, -1 * #r205_7, true))
          and (r205_9 == -1 and string.find(p205_0, r205_8, r205_9 * (#r205_8 + r205_10), true)
            or r205_9 == 1 and string.find(p205_0, r205_8, r205_9 + r205_10, true)) then
          return true
        end
      end
    end
    return false
  end
  return false
end

function isnull(p206_0)
  local r206_0 = type(p206_0)
  if r206_0 == "string" and p206_0 == "" then
    return true
  end
  if r206_0 == "table" and not next(p206_0) then
    return true
  end
  if r206_0 == "nil" then
    return true
  end
  return false
end

function IsSuspPSModule(p207_0)
  if p207_0 ~= nil and type(p207_0) == "string" then
    local r207_0 = {
      "powersploit", "powertools", "powershellempire", "empireproject//empire", "nishang",
      "offensive-powershell", "powercat", "psattackbuildtool", "exploit-jmxconsole",
      "invoke-psuacme", "invoke-reflectivepeinjection", "invoke-voicetroll", "invoke-paranoia",
      "invoke-processhunterthreaded", "invoke-kerberoast", "invoke-stealthuserhunter",
      "invoke-postexfil", "invoke-poshrathttp", "invoke-passwordsprayowa", "invoke-massmimikatz",
      "invoke-dllinjection", "invoke-shellcodemsil", "invoke-processhunter", "invoke-whitneykatz",
      "invoke-wmiobfuscatedpscommand", "invoke-credentialinjection", "invoke-netripper",
      "invoke-lswmimplant", "invoke-scomdecrypt", "invoke-usernameharvestowa", "invoke-backdoorlnk",
      "invoke-bloodhound", "invoke-thunderstruck", "invoke-poshrathttps", "invoke-adsbackdoor",
      "invoke-credentialsphish", "invoke-powershelltcp", "invoke-sharedfinder", "invoke-mimikatz",
      "invoke-callbackiex", "invoke-mimikatzwdigestdowngrade", "invoke-jsratrundll",
      "invoke-ninjacopy", "invoke-smbscanner", "invoke-findpathhijack", "invoke-dcsync",
      "invoke-networkrelay", "invoke-mapdomaintrusts", "invoke-mapdomaintrustsldap",
      "invoke-servicedisable", "invoke-filefinderthreaded", "invoke-userprocesshunter",
      "invoke-serviceenable", "invoke-portscan", "invoke-powershelltcponeline",
      "invoke-checklocaladminaccess", "invoke-callbackloop", "invoke-wscripttrigger",
      "invoke-wscriptelevate", "invoke-powerdump", "invoke-computerfieldsearch", "invoke-gofetch",
      "invoke-searchfiles", "invoke-filetransferwmimplant", "invoke-wcmdump",
      "invoke-enumsecuritytools", "invoke-jsratregsvr", "invoke-bruteforce", "invoke-empire",
      "invoke-processpunisher", "invoke-wmimplant", "invoke-loadpe", "invoke-shellcode",
      "invoke-reversednslookup", "invoke-psinject", "invoke-finddllhijack", "invoke-amsibypass",
      "invoke-arpscan", "invoke-domainharvestowa", "invoke-userhunter", "invoke-passwordsprayews",
      "invoke-wscriptbypassuac", "invoke-enumeratelocaladmin", "invoke-usereventhunter",
      "invoke-servicestop", "invoke-powershelludp", "invoke-findlocaladminaccessthreaded",
      "invoke-reverttoself", "invoke-powershelludponeline", "invoke-memoryloadlibrary",
      "invoke-findlocaladminaccess", "invoke-memoryfreelibrary", "invoke-servicecmd",
      "invoke-findallusertrustgroups", "invoke-enumeratelocaltrustgroups", "invoke-serviceuseradd",
      "invoke-inveigh", "invoke-sendmail", "invoke-powershellicmp", "invoke-packetknock",
      "invoke-psgcatagent", "invoke-filedownloader", "invoke-tokenmanipulation", "invoke-userview",
      "invoke-phant0m", "invoke-impersonateuser", "invoke-createremotethread", "invoke-filesearch",
      "invoke-winenum", "invoke-dnsloop", "invoke-searchgal", "invoke-enumeratelocaladmins",
      "invoke-enumeratelocaltrustgroupsthreaded", "invoke-netviewthreaded", "invoke-inveighrelay",
      "invoke-checkwrite", "invoke-threadedfunction", "invoke-hostenum",
      "invoke-findallgrouptrustusers", "invoke-servicestart", "invoke-bypassuac",
      "invoke-aclscanner", "invoke-patchdll", "invoke-mailsearch", "invoke-userhunterthreaded",
      "invoke-sharefinderthreaded", "invoke-userfieldsearch", "invoke-mapdomaintrust",
      "invoke-enumeratelocaladminsthreaded", "invoke-findusertrustgroups", "invoke-sharefinder",
      "invoke-portbind", "invoke-psexeccmd", "invoke-allchecks", "invoke-powershellwmi",
      "invoke-psgcat", "invoke-findgrouptrustusers", "invoke-downgradeaccount", "invoke-eventhunter",
      "invoke-userhunter", "invoke-processhunter", "invoke-sharefinder", "invoke-mapdomaintrust",
      "invoke-enumeratelocaladmin", "invoke-checklocaladminaccess", "invoke-threadedfunction",
      "invoke-zerologon​", "invoke-rubeus", "invoke-cleverspray", "new-powercat", "do-exfiltration",
      "inject-portableexecutable", "show-targetscreen", "new-honeyhash", "inject-bypassstuff",
      "remove-poshrat", "inject-netripper", "get-vulnautorun", "add-exfiltration",
      "show-wmimplantmainmenu", "get-processlistingwmimplant", "get-filecontentswmimplant",
      "start-powercat", "find-filewmimplant", "find-pathhijack", "get-lsasecret", "get-foxdump",
      "connect-powercat", "set-masterbootrecord", "http-backdoor", "inject-remoteshellcode",
      "configure-victim", "execute-dnstxt-code", "find-dllhijack", "snifferspoofer", "gupt-backdoor",
      "exploit-jboss", "write-hijackdll", "set-samaccountpasswordhash", "dns_txt_pwnage",
      "inject-localshellcode", "add-scrnsavebackdoor", "get-keepassdatabasekey", "get-passhashes",
      "add-regbackdoor", "get-modifiablefile", "get-psadforestkrbtgtinfo", "get-vulnschtask",
      "parse-ilhosts", "write-bytestomemory", "smbrelayexecute", "copy-arrayofmemaddresses",
      "find-fruit", "create-remotethread", "get-uniquetokens", "write-cmdservicebinary",
      "decrypthashes", "select-emailitem", "get-remoteprocaddress", "set-desktopacltoalloweveryone",
      "get-memoryprocaddress", "remove-persistence", "start-agentjob", "get-unattendedinstallfiles",
      "get-topport", "get-iecookies", "disable-securitysettings", "elevateprivs", "get-pebasicinfo",
      "portscan-alive", "reset-securitysettings", "get-entropy", "dumphashes", "write-serviceexe",
      "get-lostlimit", "get-regautologon", "unregister-processmoduletrace", "enable-duplicatetoken",
      "copy-clonedfile", "new-dllexportfunction", "discover-psmsexchangeservers",
      "find-psserviceaccounts", "get-chromedump", "get-tokeninformation", "get-ildisassembly",
      "get-psadforestinfo", "get-keystrokes", "get-procaddress", "get-gppinnerfields",
      "smbrelayresponse", "get-pearchitecture", "get-processmemoryinfo", "parse-ports",
      "get-usertgtevents", "write-portscanout", "set-macattribute", "create-multiplesessions",
      "smbntlmchallenge", "write-useraddmsi", "out-encryptedscript", "get-wlan-keys",
      "get-systemdnsserver", "get-primarytoken", "export-powerviewcsv", "injecturl2download",
      "get-imagentheaders", "download-execute-ps", "remove-ports", "copy-sections",
      "decryptsinglehash", "smbrelaychallenge", "restore-serviceexe", "set-killdate",
      "get-vaultelementvalue", "update-memoryprotectionflags", "set-desktopacls",
      "getwsusconfiguration", "get-methodaddress", "get-hbootkey", "get-unattendedinstallfile",
      "start-negotiate", "get-ntsysteminformation", "parse-hosts", "get-virtualprotectvalue",
      "find-processpes", "free-alltokens", "get-ffxandchromecookies", "import-dllinremoteprocess",
      "update-memoryaddresses", "create-processwithtoken", "portscan-port",
      "get-assemblyimplementedmethods", "write-useraddservicebinary", "get-userhashes",
      "powerpreter", "find-interestingfile", "find-4648logons", "get-pedetailedinfo",
      "decrypt-ciphertext", "discover-psinterestingservices", "write-serviceexecmd",
      "enum-alltokens", "get-serviceunquoted", "emit-callthreadstub", "get-serviceexeperms",
      "find-4624logons", "process-tasking", "find-avsignature", "set-criticalprocess",
      "get-vaultcredential", "smbntlmresponse", "get-shuffledarray", "parse-ipports",
      "find-localadminaccess", "ntlmchallengebase64", "download_execute", "process-packet",
      "get-killdate", "get-decryptedcpassword", "register-processmoduletrace",
      "discover-psmssqlservers", "load-libraryfrommemory", "run-exeonremote", "new-inmemorymodule",
      "sid_to_key", "get-passhints", "get-exploitablesystem", "get-netforestdomain",
      "get-netdomaincontroller", "get-netuser", "add-netuser", "add-netgroupuser", "get-netcomputer",
      "get-netou", "get-netfileserver", "get-netsession", "get-netrdpsession", "get-netprocess",
      "get-userevent", "get-userproperty", "get-computerproperty", "find-interestingfile",
      "find-userfield", "find-computerfield", "find-localadminaccess", "get-netdomaintrust",
      "get-netforesttrust", "find-foreignuser", "find-foreigngroup", "get-exploitablesystem",
      "invoke-totalexec"
    }
    if contains(p207_0, r207_0) then
      return true
    end
    return false
  end
  return false
end

function IsExchangeServer()
  if versioning.IsServer() then
    local r208_0 = "Microsoft.Exchange.Store.Service.exe"
    local r208_1 = GetRollingQueueKeyValue("ExchgVersion", r208_0)
    if r208_1 == nil then
      local r208_2, r208_3 = "ExchgVersion", 604800
      local r208_4 = sysio.RegOpenKey
      r208_4 = r208_4("HKLM\\Software\\Microsoft\\ExchangeServer\\V15\\Setup")
        or sysio.RegOpenKey("HKLM\\Software\\Microsoft\\ExchangeServer\\V14\\Setup")
      if not r208_4 then
        return false
      end
      r208_1 = sysio.GetRegValueAsString(r208_4, "OwaVersion")
      if not r208_1 then
        return false
      end
      AppendToRollingQueue(r208_2, r208_0, r208_1, r208_3)
    end
    return r208_1
  end
  return false
end

function IsSharepointServer()
  if versioning.IsServer() then
    local r209_0 = "WebServerExtensions_WSS"
    local r209_1 = GetRollingQueueKeyValue("SPVersion", r209_0)
    if r209_1 == nil then
      local r209_2, r209_3, r209_4 = "SPVersion", nil, 604800
      local r209_5 = { "14.0", "15.0", "16.0" }
      for r209_6, r209_7 in ipairs(r209_5) do
        local r209_8 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
            .. r209_7 .. "\\WSS")
        if r209_8 then
          r209_3 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\Shared Tools\\Web Server Extensions\\"
              .. r209_7)
        end
      end
      if not r209_3 then
        return false
      end
      r209_1 = sysio.GetRegValueAsString(r209_3, "Version")
      if not r209_1 then
        return false
      end
      AppendToRollingQueue(r209_2, r209_0, r209_1, r209_4)
    end
    return r209_1
  end
  return false
end

function IsActiveDirectoryRole()
  if versioning.IsServer() then
    local r210_0 = "AD-Domain-Services"
    local r210_1 = GetRollingQueueKeyValue("ActiveDirRole", r210_0)
    if r210_1 == nil then
      local r210_2 = MpCommon.GetServerRoles()
      if r210_2 ~= nil then
        for r210_3, r210_4 in ipairs(r210_2) do
          if r210_4 == "DirectoryServices-DomainController" then
            local r210_5, r210_6 = "ActiveDirRole", 604800
            local r210_7 = sysio.GetCommandLineFromService("NTDS")
            if r210_7 then
              if string.find(r210_7, "lsass.exe", 1, true) then
                AppendToRollingQueue(r210_5, r210_0, 1, r210_6)
                return true
              end
              return false
            end
            return false
          end
        end
      end
      return false
    end
    return true
  end
  return false
end

function IsADConnectRole()
  if versioning.IsServer() then
    local r211_0 = "Microsoft.Azure.ActiveDirectory.ADSyncManagement.Server"
    local r211_1 = GetRollingQueueKeyValue("ADConnect", r211_0)
    if r211_1 == nil then
      local r211_2, r211_3 = "ADConnect", 86400
      local r211_4 = sysio.GetCommandLineFromService("ADSync")
      if not r211_4 then
        return false
      end
      if not string.find(r211_4, "miiserver.exe", 1, true) then
        return false
      end
      AppendToRollingQueue(r211_2, r211_0, 1, r211_3)
    end
    return true
  end
  return false
end

function IsADConnectCloudSyncRole()
  if versioning.IsServer() then
    local r212_0 = "AADConnectProvisioningAgent"
    local r212_1 = GetRollingQueueKeyValue("ADConnectCloudSync", r212_0)
    if r212_1 == nil then
      local r212_2, r212_3 = "ADConnectCloudSync", 86400
      local r212_4 = sysio.GetCommandLineFromService("AADConnectProvisioningAgent")
      if not r212_4 then
        return false
      end
      if not string.find(r212_4, "AADConnectProvisioningAgent.exe", 1, true) then
        return false
      end
      AppendToRollingQueue(r212_2, r212_0, 1, r212_3)
    end
    return true
  end
  return false
end

function IsADFSRole()
  if versioning.IsServer() then
    local r213_0 = "Microsoft.IdentityServer.ServiceHost"
    local r213_1 = GetRollingQueueKeyValue("ADFSService", r213_0)
    if r213_1 == nil then
      local r213_2, r213_3 = "ADFSService", 86400
      local r213_4 = sysio.GetCommandLineFromService("adfssrv")
      if not r213_4 then
        return false
      end
      if not string.find(r213_4, "Microsoft.IdentityServer.ServiceHost.exe", 1, true) then
        return false
      end
      AppendToRollingQueue(r213_2, r213_0, 1, r213_3)
    end
    return true
  end
  return false
end

function CheckNewThresholdMet(p214_0, p214_1, p214_2)
  local r214_0, r214_1, r214_2 = false, "", -0x8000000000000000
  for r214_3, r214_4 in pairs(p214_2) do
    if r214_3 <= p214_0 and p214_0 - p214_1 < r214_3 and r214_2 < r214_3 then
      r214_0 = true
      r214_1 = r214_4
      r214_2 = r214_3
    end
  end
  return r214_0, r214_1
end

function reportMassReconHistory(p215_0, p215_1, p215_2)
  sms_untrusted_process()
  reportSessionInformation()
  reportTimingData()
  local r215_0 = GetRollingQueue(p215_0)
  bm.add_related_string("MassRecon_" .. p215_1 .. p215_2, safeJsonSerialize(r215_0),
    bm.RelatedStringBMReport)
  for r215_1, r215_2 in ipairs(r215_0) do
    local r215_3 = explode(r215_2.key, "|")
    r215_2.key = {
      parentPPID = r215_3[1], processPPID = r215_3[2], process_image = r215_3[3],
      process_cmd = r215_3[4]
    }
    bm.add_related_file(r215_3[3])
    bm.add_related_process(r215_3[1])
    bm.add_related_process(r215_3[2])
  end
end

function copyBMEvent(p216_0)
  local r216_0 = {}
  local r216_1 = {
    "matched", "timestamp", "ppid", "image_path", "reg_block_src", "reg_block_usermode", "attribute",
    "p1", "p2", "np1", "np2", "wp1", "wp2", "utf8p1", "utf8p2"
  }
  for r216_2, r216_3 in ipairs(r216_1) do
    r216_0[r216_3] = p216_0[r216_3]
  end
  return r216_0
end

function getCurrentProcessInjectors()
  local r217_0, r217_1, r217_2 = pcall(bm.get_process_relationships)
  local r217_3 = {}
  local r217_4 = { count = 0 }
  local r217_5 = { count = 0 }
  if r217_0 and r217_1 then
    for r217_6, r217_7 in ipairs(r217_1) do
      if mp.bitand(r217_7.reason, 2) == 2 then
        local r217_8, r217_9, r217_10 = pcall(bm.get_process_relationships, r217_7.ppid)
        r217_3[r217_7.ppid] = {}
        r217_4[r217_7.ppid] = r217_7
        r217_4.count = r217_4.count + 1
        if r217_8 and r217_10 and #r217_10 ~= 0 then
          for r217_11, r217_12 in ipairs(r217_10) do
            if mp.bitand(r217_12.reason, 2) == 2 then
              table.insert(r217_3[r217_7.ppid], r217_12.ppid)
              if not r217_5[r217_12.ppid] then
                r217_5[r217_12.ppid] = r217_12
                r217_5.count = r217_5.count + 1
              end
            end
          end
        else
          local r217_13 = GetRollingQueueKeyValues("InjectionRelationship", r217_7.ppid)
          if r217_13 then
            for r217_14, r217_15 in ipairs(r217_13) do
              local r217_16, r217_17, r217_18 = string.match(r217_15.value,
                "imagename:%s*(.-)%s*;targetprocessp(%d+:%d+);(injectiontype:%w+);")
              if r217_17 then
                table.insert(r217_3[r217_7.ppid], r217_17)
                if not r217_5[r217_17] then
                  r217_5[r217_17] = { image_name = r217_16, injection_type = r217_18 }
                  r217_5.count = r217_5.count + 1
                end
              end
            end
          end
        end
      end
    end
  end
  return r217_3, r217_4, r217_5
end

function readRegDQwordValue(p218_0)
  local function r218_0(p219_0)
    local r219_0 = ""
    for r219_1 = #p219_0, 1, -2 do
      r219_0 = r219_0 .. string.sub(p219_0, r219_1 - 1, r219_1)
    end
    return r219_0
  end

  local r218_1 = tohex(p218_0)
  r218_1 = r218_0(r218_1)
  while #r218_1 > 1 and r218_1:sub(1, 1) == "0" do
    r218_1 = r218_1:sub(2, -1)
  end
  return r218_1
end

function GetPidFromParentImagePath(p220_0)
  if not p220_0 then
    return
  end
  p220_0 = string.lower(p220_0)
  local r220_0 = bm.get_process_relationships()
  if not r220_0 then
    return
  end
  for r220_1, r220_2 in ipairs(r220_0) do
    if r220_2.ppid
      and r220_2.image_path
      and string.find(string.lower(r220_2.image_path), p220_0, 1, true) then
      return r220_2.ppid
    end
  end
end

function BlockC2Connection(p221_0, p221_1)
  local r221_0 = p221_1 or r0_40()
  if not r221_0 then
    return
  end
  bm.trigger_sig("C2Block", p221_0 and p221_0 or "", r221_0)
end

function TriggerTargetedMemoryScan(p222_0, p222_1)
  local r222_0 = p222_1 or r0_40()
  if not r222_0 then
    return
  end
  local r222_1 = string.format("%s,address:%s,size:0", r222_0, p222_0)
  mp.TriggerScanResource("ems", r222_1)
end

function AddSuspiciousRegion(p223_0, p223_1)
  local r223_0 = p223_1 or r0_40()
  if not r223_0 then
    return
  end
  local r223_1 = string.format("susp_regions:%s", r223_0)
  if not IsKeyInRollingQueue(r223_1, p223_0) then
    AppendToRollingQueue(r223_1, p223_0, nil, nil, 8)
  end
end

function GetSuspiciousAllocsInBmLog(p224_0)
  if mp.SIGATTR_LOG_SZ == 0 then
    return
  end

  local function r224_0(p225_0, p225_1)
    for r225_0 = mp.SIGATTR_LOG_SZ, 1, -1 do
      local r225_1 = p225_1[r225_0]
      if r225_1.attribute == 16435 and not p225_0[r225_1.utf8p2] then
        p225_0[r225_1.utf8p2] = true
      end
      if r225_1.attribute == 16505 then
        local r225_2 = string.match(r225_1.utf8p2, "(%d+);region")
        if not p225_0[r225_2] then
          p225_0[r225_2] = true
        end
      end
      if r225_1.attribute == 16523 and not p225_0[r225_1.utf8p2] then
        p225_0[r225_1.utf8p2] = true
      end
    end
  end

  local r224_1 = {}
  r224_0(r224_1, sigattr_tail)
  r224_0(r224_1, sigattr_head)
  if p224_0 then
    local r224_2 = 0
    for r224_3 in pairs(r224_1) do
      local r224_4, r224_5 = bm.VirtualQuery(r224_3)
      if r224_4 then
        local r224_6 = string.format("s:%x,p:%x,i:%x,t:%x", r224_5.size, r224_5.prot,
          r224_5.alloc_prot, r224_5.state_type)
        r224_2 = r224_2 + 1
        local r224_7 = string.format("a40d39a6_%d", r224_2)
        bm.add_related_string(r224_7, r224_6, bm.RelatedStringBMReport)
      end
    end
    bm.add_related_string("a40d39a6_total", tostring(r224_2), bm.RelatedStringBMReport)
  end
  return r224_1
end

function GetSuspiciousRegions(p226_0)
  local r226_0 = p226_0 or r0_40()
  if not r226_0 then
    return
  end
  local r226_1 = string.format("susp_regions:%s", r226_0)
  local r226_2 = GetRollingQueueKeys(r226_1)
  if not r226_2 then
    return
  end
  return r226_2
end

function TriggerScanBeaconing(p227_0)
  local r227_0 = p227_0 or r0_40()
  if not r227_0 then
    return
  end
  bm.trigger_sig("ScanSuspiciousRegions", r227_0, r227_0)
end

function ProcessCodeInjection(p228_0, p228_1)
  local r228_0 = p228_0.utf8p1
  if r228_0 then
    local r228_1 = p228_0.utf8p2
    if r228_1 then
      local r228_2 = string.match(r228_1, "regionsize:(%d+)")
      if r228_2 then
        local r228_3 = string.match(r228_1, "vmbaseaddress:(%d+)")
        if r228_3 then
          local r228_4 = string.match(r228_1, "injectiontype:(%a+);")
          if r228_4 then
            local r228_5 = p228_1.utf8p2
            if r228_5 then
              local r228_6 = string.match(r228_5, "injectiontype:(%a+);")
              if r228_6 then
                local r228_7, r228_8
                r228_7, r228_8 = string.match(r228_0, "targetprocessppid:(%d+):(%d+)")
                if r228_7 and r228_8 then
                  local r228_9 = bm.get_current_process_startup_info()
                  local r228_10 = r228_9.ppid
                  if r228_10 then
                    local r228_11 = MpCommon.IsFriendlyProcess(r228_10) and "1" or "0"
                    local r228_12 = r0_41()
                    local r228_13 = string.match(r228_0, "imagename:(.+);")
                    if (r228_12 == "RunDll64.exe" or r228_13 == "RunDll64.exe")
                      and (r228_2 == "950" or r228_2 == "995")
                      and r228_6 == "remotethread"
                      and r228_11 == "1" then
                      return false
                    end
                    local r228_14 = string.format("%s:%s:%s:%s:%s:%s", r228_12, r228_13, r228_6,
                      r228_4, r228_2, r228_11)
                    local r228_15 = {
                      ["msedge.exe:msedge.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["Teams.exe:Teams.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["msedge.exe:msedge.exe:queueuserapc:protectvm:16:1"] = true,
                      ["firefox.exe:firefox.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:16:1"] = true,
                      ["Teams.exe:Teams.exe:queueuserapc:protectvm:16:1"] = true,
                      ["AcroRd32.exe:AcroRd32.exe:queueuserapc:protectvm:12:1"] = true,
                      ["svservice.exe:powershell.exe:queueuserapc:allocvmremote:578:1"] = true,
                      ["RdrCEF.exe:RdrCEF.exe:queueuserapc:protectvm:12:1"] = true,
                      ["svservice.exe:svchost.exe:queueuserapc:allocvmremote:578:1"] = true,
                      ["OfficeClickToRun.exe:msoadfsb.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["Acrobat.exe:Acrobat.exe:queueuserapc:protectvm:12:1"] = true,
                      ["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:protectvm:16:1"] = true,
                      ["RdrCEF.exe:RdrCEF.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:736:1"] = true,
                      ["msedge.exe:msedge.exe:queueuserapc:protectvm:800:1"] = true,
                      ["powershell.exe:svservice.exe:queueuserapc:protectvm:578:1"] = true,
                      ["msedge.exe:msedge.exe:queueuserapc:protectvm:1312:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:allocvmremote:4096:0"] = true,
                      ["ai.exe:OfficeClickToRun.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["Teams.exe:Teams.exe:queueuserapc:protectvm:928:1"] = true,
                      ["msedge.exe:core.exe:queueuserapc:allocvmremote:578:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:672:1"] = true,
                      ["AcroCEF.exe:AcroCEF.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["java.exe:jcmd.exe:remotethread:allocvmremote:136:1"] = true,
                      ["svchost.exe:svservice.exe:queueuserapc:protectvm:578:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:12:1"] = true,
                      ["firefox.exe:firefox.exe:queueuserapc:protectvm:16:1"] = true,
                      ["RdrCEF.exe:RdrCEF.exe:queueuserapc:protectvm:912:1"] = true,
                      ["firefox.exe:firefox.exe:queueuserapc:protectvm:12:1"] = true,
                      ["Spotify.exe:Spotify.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["AcroRd32.exe:AcroRd32.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["jabra-direct.exe:jabra-direct.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:12:1"] = true,
                      ["msedge.exe:core.exe:queueuserapc:allocvmremote:725:1"] = true,
                      ["firefox.exe:firefox.exe:queueuserapc:protectvm:4096:1"] = true,
                      ["EXCEL.EXE:OfficeClickToRun.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["SIP.exe:powershell.exe:remotethread:protectvm:8192:1"] = true,
                      ["jcmd.exe:java.exe:remotethread:allocvmremote:136:1"] = true,
                      ["OfficeClickToRun.exe:ai.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["A180AG.exe:AcroRd32.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["MavInject32.exe:msoadfsb.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["EpicDumpTruckInjector64.exe:Hyperdrive.exe:remotethread:allocvmremote:166:0"] = true,
                      ["EpicDumpTruckInjector.exe:HubFramework.exe:remotethread:allocvmremote:160:0"] = true,
                      ["IPScriptHost.exe:T.exe:remotethread:allocvmremote:100:1"] = true,
                      ["SIP.exe:cmd.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:SelfService.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:ClearPassUSHARemediate.exe:remotethread:protectvm:8192:1"] = true,
                      ["VeeamGuestHelper.exe:svchost.exe:remotethread:allocvmremote:44:1"] = true,
                      ["OfficeClickToRun.exe:EXCEL.EXE:queueuserapc:protectvm:1024:1"] = true,
                      ["EpicDumpTruckInjector64.exe:Hyperdrive.exe:remotethread:allocvmremote:170:0"] = true,
                      ["EpicDumpTruckInjector.exe:HubFramework.exe:remotethread:allocvmremote:164:0"] = true,
                      ["Unattended.exe:explorer.exe:remotethread:allocvmremote:1360:1"] = true,
                      ["SIP.exe:netsh.exe:remotethread:protectvm:8192:1"] = true,
                      ["LDUrlMonInject64.exe:msedge.exe:remotethread:allocvmremote:1122:1"] = true,
                      ["SIP.exe:HxTsr.exe:remotethread:protectvm:8192:1"] = true,
                      ["explorer.exe:chrome.exe:remotethread:allocvmremote:664:1"] = true,
                      ["SIP.exe:VSSVC.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:splunk-MonitorNoHandle.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:CefSharp.BrowserSubprocess.exe:remotethread:protectvm:8192:1"] = true,
                      ["explorer.exe:cmd.exe:remotethread:allocvmremote:664:1"] = true,
                      ["Workstation.exe:Workstation.exe:queueuserapc:protectvm:16:1"] = true,
                      ["SIP.exe:WMIC.exe:remotethread:protectvm:8192:1"] = true,
                      ["A180AG.exe:AcroRd32.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["explorer.exe:msedge.exe:remotethread:allocvmremote:664:1"] = true,
                      ["A180AG.exe:Teams.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["A180AG.exe:WmiPrvSE.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["SIP.exe:get_proxy.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:wa_3rd_party_host_32.exe:remotethread:protectvm:8192:1"] = true,
                      ["TextServer.exe:T.exe:remotethread:allocvmremote:508:1"] = true,
                      ["EpicDumpTruckInjector64.exe:Hyperdrive.exe:remotethread:allocvmremote:170:1"] = true,
                      ["SIP.exe:wa_3rd_party_host_64.exe:remotethread:protectvm:8192:1"] = true,
                      ["LDUrlMonInject64.exe:chrome.exe:remotethread:allocvmremote:1122:1"] = true,
                      ["EpicDumpTruckInjector.exe:HubFramework.exe:remotethread:allocvmremote:164:1"] = true,
                      ["SIP.exe:chrome.exe:remotethread:protectvm:8192:1"] = true,
                      ["idea64.exe:java.exe:remotethread:allocvmremote:136:1"] = true,
                      ["syspin.exe:explorer.exe:remotethread:allocvmremote:38008:1"] = true,
                      ["OfficeClickToRun.exe:WINWORD.EXE:queueuserapc:protectvm:1024:1"] = true,
                      ["msiexec_monitor64.exe:msiexec.exe:remotethread:allocvmremote:172:1"] = true,
                      ["HubCore.exe:wfshell.exe:remotethread:allocvmremote:166:0"] = true,
                      ["rundll32.exe:powershell.exe:remotethread:protectvm:4096:1"] = true,
                      ["core.exe:msedge.exe:remotethread:allocvmremote:578:1"] = true,
                      ["RadeonSoftware.exe:QtWebEngineProcess.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["SIP.exe:HPWarrantyChecker.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:powershell.exe:remotethread:protectvm:8192:0"] = true,
                      ["SIP.exe:updater.exe:remotethread:protectvm:8192:1"] = true,
                      ["NHOSTSVC.EXE:winlogon.exe:remotethread:allocvmremote:227328:1"] = true,
                      ["explorer.exe:SecurityHealthSystray.exe:remotethread:allocvmremote:664:1"] = true,
                      ["SIP.exe:cscript.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:osqueryi.exe:remotethread:protectvm:8192:1"] = true,
                      ["core.exe:msedge.exe:remotethread:allocvmremote:725:1"] = true,
                      ["Dropbox.exe:Dropbox.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["MavInject32.exe:EXCEL.EXE:queueuserapc:protectvm:1024:1"] = true,
                      ["SIP.exe:RunHidden.exe:remotethread:protectvm:8192:1"] = true,
                      ["A180AG.exe:conhost.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:928:1"] = true,
                      ["911 Location Manager.exe:911 Location Manager.exe:queueuserapc:protectvm:16:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:allocvmremote:578:1"] = true,
                      ["Acrobat.exe:Acrobat.exe:queueuserapc:protectvm:16:1"] = true,
                      ["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:16:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:16:0"] = true,
                      ["AppVClient.exe:msedge.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:protectvm:800:1"] = true,
                      ["SIP.exe:vf_host.exe:remotethread:protectvm:8192:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:allocvmremote:725:1"] = true,
                      ["msedgewebview2.exe:msedgewebview2.exe:queueuserapc:protectvm:1312:1"] = true,
                      ["Teams.exe:Teams.exe:queueuserapc:protectvm:12:1"] = true,
                      ["Acrobat.exe:Acrobat.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["AcroCEF.exe:AcroCEF.exe:queueuserapc:protectvm:912:1"] = true,
                      ["Teams.exe:Teams.exe:queueuserapc:protectvm:1056:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:allocvmremote:555:1"] = true,
                      ["brave.exe:brave.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["AppVClient.exe:explorer.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["Workstation.exe:Workstation.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["core.exe:chrome.exe:queueuserapc:allocvmremote:578:1"] = true,
                      ["firefox.exe:firefox.exe:queueuserapc:protectvm:848:1"] = true,
                      ["opera.exe:opera.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["Spotify.exe:Spotify.exe:queueuserapc:protectvm:16:1"] = true,
                      ["core.exe:dllhost.exe:queueuserapc:allocvmremote:725:1"] = true,
                      ["msedge.exe:msedge.exe:queueuserapc:protectvm:16:0"] = true,
                      ["msedge.exe:msedge.exe:queueuserapc:allocvmremote:4096:0"] = true,
                      ["core.exe:dwm.exe:queueuserapc:protectvm:950:1"] = true,
                      ["msedge.exe:msedge.exe:queueuserapc:protectvm:12:1"] = true,
                      ["svservice.exe:svchost.exe:queueuserapc:protectvm:578:1"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:720:1"] = true,
                      ["core.exe:dwm.exe:queueuserapc:allocvmremote:725:1"] = true,
                      ["Code.exe:Code.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["AdskAccessUIHost.exe:AdskAccessUIHost.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["CTskMstr.exe:AgentExecutor.exe:queueuserapc:allocvmremote:612:1"] = true,
                      ["svservice.exe:powershell.exe:queueuserapc:protectvm:578:1"] = true,
                      ["AppVClient.exe:iexplore.exe:queueuserapc:protectvm:1024:1"] = true,
                      ["cyserver.exe:tlaworker.exe:queueuserapc:protectvm:1:1"] = true,
                      ["jabra-direct.exe:jabra-direct.exe:queueuserapc:protectvm:12:1"] = true,
                      ["core.exe:chrome.exe:queueuserapc:allocvmremote:725:1"] = true,
                      ["rserver3.exe:FamItrfc.Exe:queueuserapc:allocvmremote:41:1"] = true,
                      ["AcroRd32.exe:AcroRd32.exe:queueuserapc:protectvm:12:0"] = true,
                      ["chrome.exe:chrome.exe:queueuserapc:protectvm:656:1"] = true,
                      ["tableau.exe:QtWebEngineProcess.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["911 Location Manager.exe:911 Location Manager.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["EPOSConnect.exe:EPOSConnect.exe:queueuserapc:protectvm:12:1"] = true,
                      ["SIP.exe:Textron.scr:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:BeforeLogonForm.exe:remotethread:protectvm:8192:1"] = true,
                      ["SIP.exe:wscript.exe:remotethread:protectvm:8192:1"] = true,
                      ["idea64.exe:java.exe:queueuserapc:allocvmremote:136:1"] = true,
                      ["SIP.exe:TaniumExecWrapper.exe:remotethread:protectvm:8192:1"] = true,
                      ["A180AG.exe:Cibc.DI.Platform.Process.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["A180AG.exe:chrome.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["MavInject32.exe:WINWORD.EXE:queueuserapc:protectvm:1024:1"] = true,
                      ["SIP.exe:AdobeARM.exe:remotethread:protectvm:8192:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:protectvm:578:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:allocvmremote:950:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:protectvm:555:1"] = true,
                      ["core.exe:firefox.exe:queueuserapc:allocvmremote:521:1"] = true,
                      ["core.exe:msedge.exe:queueuserapc:protectvm:725:1"] = true,
                      ["Teams.exe:Teams.exe:queueuserapc:allocvmremote:4096:0"] = true,
                      ["core.exe:msedge.exe:queueuserapc:protectvm:950:1"] = true,
                      ["SIP.exe:DPM.exe:remotethread:protectvm:8192:1"] = true,
                      ["A180AG.exe:chrome.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["AMAgentAssist.exe:winlogon.exe:remotethread:allocvmremote:138:1"] = true,
                      ["core.exe:msedge.exe:remotethread:allocvmremote:555:1"] = true,
                      ["explorer.exe:EXCEL.EXE:remotethread:allocvmremote:664:1"] = true,
                      ["AMDllInjectionAssist.exe:vpnagent.exe:remotethread:allocvmremote:150:1"] = true,
                      ["jcmd.exe:java.exe:queueuserapc:allocvmremote:136:1"] = true,
                      ["SIP.exe:splunk-admon.exe:remotethread:protectvm:8192:1"] = true,
                      ["msedge.exe:msedge.exe:remotethread:allocvmremote:4096:1"] = true,
                      ["OfficeClickToRun.exe:POWERPNT.EXE:queueuserapc:protectvm:1024:1"] = true,
                      ["AMAgentAssist.exe:lsass.exe:remotethread:allocvmremote:138:1"] = true,
                      ["firefox.exe:firefox.exe:queueuserapc:mapview:65536:1"] = true,
                      ["sfc.exe:msedge.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["explorer.exe:PGStub.exe:remotethread:allocvmremote:664:1"] = true,
                      ["AMDllInjectionAssist.exe:armsvc.exe:remotethread:allocvmremote:150:1"] = true,
                      ["EPOSConnect.exe:EPOSConnect.exe:queueuserapc:allocvmremote:4096:1"] = true,
                      ["explorer.exe:SnippingTool.exe:remotethread:allocvmremote:664:1"] = true
                    }
                    if r228_15[r228_14] then
                      return false
                    end
                    bm.add_related_string("ci_al", r228_4, bm.RelatedStringBMReport)
                    bm.add_related_string("ci_tp", r228_6, bm.RelatedStringBMReport)
                    bm.add_related_string("ci_sz", r228_2, bm.RelatedStringBMReport)
                    bm.add_related_string("ci_fr", r228_11, bm.RelatedStringBMReport)
                    bm.add_related_string("ci_src_img", r228_12, bm.RelatedStringBMReport)
                    bm.add_related_string("ci_tgt_img", r228_13, bm.RelatedStringBMReport)
                    bm.add_related_string("ci_v", "2", bm.RelatedStringBMReport)
                    local r228_16 = string.format("pid:%s,ProcessStart:%s", r228_7, r228_8)
                    TriggerTargetedMemoryScan(r228_3, r228_16)
                    bm.trigger_sig("injection_target", "Behavior:Win32/ScanCodeInjection.A", r228_16)
                    return true
                  end
                  return false
                end
                return false
              end
              return false
            end
            return false
          end
          return false
        end
        return false
      end
      return false
    end
    return false
  end
  return false
end

function IsTaintedProcessinParentTreeForLinux(p229_0, p229_1, p229_2, p229_3)
  if p229_2 == 0 then
    return
  end
  if p229_0 == nil or p229_0 == "" then
    return
  end
  local r229_0 = p229_2
  r229_0 = (p229_2 == nil or p229_2 < 0 or p229_2 > 5) and 2 or r229_0
  p229_3 = p229_3 == nil or p229_3 == "" or p229_3
  if p229_3 then
    local r229_1 = bm.get_imagepath()
    if r229_1 ~= nil and r229_1 ~= "" and isTainted(r229_1, p229_0) then
      bm.add_related_file(r229_1)
      return true
    end
  end
  local r229_2 = p229_1
  if p229_1 == nil or p229_1 == "" then
    local r229_3 = bm.get_current_process_startup_info()
    if r229_3 == nil or r229_3.ppid == nil or r229_3.ppid == "" then
      return
    end
    r229_2 = r229_3.ppid
  end
  local r229_4 = mp.GetParentProcInfo(r229_2)
  if r229_4 == nil or r229_4.ppid == nil or r229_4.image_path == nil then
    return
  end
  if isTainted(r229_4.image_path, p229_0) then
    bm.add_related_file(r229_4.image_path)
    return true
  end
  return IsTaintedProcessinParentTreeForLinux(p229_0, r229_4.ppid, r229_0 - 1, false)
end

function IsPEBSpoofed(p230_0, p230_1, p230_2)
  local r230_0 = bm.GetPEBInfo(p230_0)
  if isnull(r230_0) then
    return false
  end
  if r230_0.HostArch == mp.SMS_PROC_ARCH_X64 and r230_0.ProcArch == mp.SMS_PROC_ARCH_X64 then
    local r230_1 = bm.ReadProcMem(r230_0.PEBAddr + 32, 8, p230_0)
    if r230_1 ~= nil and string.len(r230_1) == 8 then
      local r230_2 = mp.readu_u64(r230_1, 1)
      local r230_3 = bm.ReadProcMem(r230_2 + 96, 16, p230_0)
      if r230_3 ~= nil and string.len(r230_3) == 16 then
        local r230_4 = bm.ReadProcMem(r230_2 + 112, 16, p230_0)
        if r230_4 ~= nil and string.len(r230_4) == 16 then
          local r230_5 = mp.readu_u16(r230_3, 1)
          local r230_6 = mp.readu_u16(r230_4, 1)
          local r230_7 = mp.readu_u64(r230_3, 9)
          local r230_8 = mp.readu_u64(r230_4, 9)
          local r230_9 = bm.ReadProcMem(r230_7, r230_5, p230_0)
          if r230_9 ~= nil and string.len(r230_9) == r230_5 then
            r230_9 = normalize_unicode(r230_9)
            if isnull(r230_9) then
              return false
            end
            local r230_10 = bm.ReadProcMem(r230_8, r230_6, p230_0)
            if r230_10 ~= nil and string.len(r230_10) == r230_6 then
              r230_10 = normalize_unicode(r230_10)
              if isnull(r230_10) then
                return false
              end
              p230_1 = string.lower(p230_1)
              r230_9 = string.lower(r230_9)
              if r230_10 == p230_2 and r230_9 == p230_1 then
                return false
              end
              bm.add_related_string("PEB Spoofing Trace Commandline: ", p230_2,
                bm.RelatedStringBMReport)
              bm.add_related_string("PEB Spoofing PEB Commandline: ", r230_10,
                bm.RelatedStringBMReport)
              bm.add_related_string("PEB Spoofing Trace ImagePath: ", p230_1,
                bm.RelatedStringBMReport)
              bm.add_related_string("PEB Spoofing PEB ImagePath: ", r230_9, bm.RelatedStringBMReport)
              bm.add_related_process(p230_0)
              return true
            end
            return false
          end
          return false
        end
        return false
      end
      return false
    end
    return false
  end
  return false
end

function verify_relevant_sim_orgs()
  local r231_0 = versioning.GetOrgID()
  if r231_0 == nil
    or r231_0 == ""
    or not (r231_0:lower() == "9d61afa0-cfa4-4746-95af-dc897a6f6774"
      or r231_0:lower() == "24d4a9cf-e7f1-400a-b2d4-bd534e1e168d") then
    return false
  end
  return true
end

function verify_memory_features_coverage_orgs()
  if versioning.GetEngineRing() < 5 then
    return true
  end
  local r232_0 = {
    ["0dde20f2-5621-4cfa-b3f5-b920800dd3b4"] = true, ["64eacc49-6a31-42c6-9b39-c3d9148e65f4"] = true,
    ["bfbc94c5-06ed-4eb5-9a15-d6b60cc9794c"] = true, ["9f7a3318-62d2-47d1-bbff-8b380b669698"] = true,
    ["da82a2d8-0d12-41a6-b3dc-3b010c59f54a"] = true, ["395e414e-24a3-4802-82c4-e47dd3ffb449"] = true,
    ["4ec5f50d-2073-4ecf-986c-0dcca43f933a"] = true, ["2c6bd823-96a3-4121-b933-3d4193c1d6be"] = true,
    ["281296cc-22c0-4a74-b110-c064d45023ef"] = true, ["74e1dfed-6804-4e3c-bce4-b4d7c66c9823"] = true,
    ["0c05a59a-e6b3-4702-ae89-50f170bea544"] = true, ["96b0e66b-fb6c-4997-a3e2-a6acf57b1c64"] = true,
    ["9e561f08-d9a6-425f-8bbd-386b32139c24"] = true, ["3720c38e-7037-4391-b44a-3024091a5954"] = true,
    ["789eac8d-f812-4fdf-8b65-037a639ce266"] = true, ["a5083083-0e16-4695-8dca-72a29a1a5372"] = true,
    ["27f2abe6-da2d-4e59-9456-09c5210dfc73"] = true, ["7ba9358d-e714-4eb8-8768-0d9b568d44c6"] = true,
    ["ede93498-0189-4b5a-bb7d-bdb374cbebd3"] = true, ["d45c2b71-83c3-48a3-baf6-0714155a2b53"] = true,
    ["aae7c2f9-7572-4de6-890f-627578b1c3c7"] = true, ["e66d8213-210c-42e8-9911-e3171f34a171"] = true,
    ["a6e3e451-a358-463c-a321-b31557676fed"] = true, ["664aea05-c1de-48f3-ae5d-35b49dae8ebc"] = true,
    ["3225966f-5761-4dce-b041-41dfa7f0f70e"] = true, ["73a8a4e0-3a39-430c-abff-c9187cdd5b05"] = true,
    ["3d4bd465-f03c-4cf6-a716-d1fcd3661cc3"] = true, ["dc9433c4-a16f-4f92-a89e-f34ca04ce1f2"] = true,
    ["d25b7b36-894c-4ca4-9a21-22d2025130f9"] = true, ["0688cd32-c9f0-431e-a14e-723c778cf564"] = true,
    ["2e750407-ff67-4f05-bece-683a1d062121"] = true, ["26e23841-9122-4f38-b694-3090d1748975"] = true,
    ["b56c56f0-29f1-474f-933d-5fc1391bcacf"] = true, ["bd4f2ed4-25cf-4ce0-95e9-c3947a3e4936"] = true,
    ["12d3fd4a-60f7-4d92-97ba-1ac7e53d7c62"] = true, ["844db333-a736-483f-833c-20723a7b28ad"] = true
  }
  local r232_1 = versioning.GetOrgID()
  if r232_1 and r232_1 ~= "" then
    local r232_2 = r232_1:lower()
    r232_2 = r232_0[r232_2]
    r232_2 = r232_2 == true
    return r232_2
  end
  return false
end

function verify_socket_fd_triplet(p233_0, p233_1, p233_2)
  local r233_0 = tonumber(p233_0)
  local r233_1 = tonumber(p233_1)
  local r233_2 = tonumber(p233_2)
  if r233_0 and r233_1 and r233_2 then
    local function r233_3(p234_0)
      return p234_0 == 0 or p234_0 == 1 or p234_0 == 2
    end

    local r233_4 = nil
    if r233_3(r233_0) then
      if r233_3(r233_1) then
        if r233_3(r233_2) then
          return false
        end
        r233_4 = r233_2
      else
        r233_4 = r233_1
      end
    else
      r233_4 = r233_0
    end
    local r233_5 = r0_42()
    for r233_6, r233_7 in ipairs({ 0, 1, 2, r233_4, r233_0, r233_1, r233_2 }) do
      r233_5.ensure(r233_7)
    end
    r233_5.union(r233_0, 0)
    r233_5.union(r233_1, 1)
    r233_5.union(r233_2, 2)
    local r233_8 = r233_5.find(r233_4)
    return r233_5.find(0) == r233_8 and r233_5.find(1) == r233_8 and r233_5.find(2) == r233_8
  end
  return false
end

function verify_socket_fd_pair(p235_0, p235_1)
  local r235_0 = tonumber(p235_0)
  local r235_1 = tonumber(p235_1)
  if r235_0 and r235_1 then
    local function r235_2(p236_0)
      return p236_0 == 0 or p236_0 == 1
    end

    local r235_3 = nil
    if r235_2(r235_0) then
      if r235_2(r235_1) then
        return false
      end
      r235_3 = r235_1
    else
      r235_3 = r235_0
    end
    local r235_4 = r0_42()
    for r235_5, r235_6 in ipairs({ 0, 1, r235_3, r235_0, r235_1 }) do
      r235_4.ensure(r235_6)
    end
    r235_4.union(r235_0, 0)
    r235_4.union(r235_1, 1)
    local r235_7 = r235_4.find(r235_3)
    return r235_4.find(0) == r235_7 and r235_4.find(1) == r235_7
  end
  return false
end

function check_common_process_linux(p237_0)
  if p237_0 ~= nil and p237_0 ~= "" then
    local r237_0 = {
      "/usr/", "/var/lib/", "/bin/", "/var/log/", "/var/opt/", "/opt/", "/etc/", "/snap/", "/proc/",
      "/sbin/"
    }
    for r237_1, r237_2 in ipairs(r237_0) do
      if p237_0:sub(1, #r237_2) == r237_2 then
        return true
      end
    end
    local r237_3 = {
      "/ansible", "/snap/", "/splunkd/", "/oracle/", "-salt-", "/tmp/go-build", "/var/intel",
      "/var/cache", "/var/arcticwolfnetworks", "/jenkins", "/filebeat", ".kubectl", "clamav-",
      ".tivoli", "containerd-shim", "docker-", "influx_", "influxd", "terraform-", "zscaler-",
      "/tmp/apt-key-gpg", "common-setup-and-utils-script.sh", "mdatp-edr-mitre-setup.sh",
      "mdatp-epp-mitre-setup.sh", "amazon-ssm-agent", "/python"
    }
    for r237_4, r237_5 in ipairs(r237_3) do
      if string.find(p237_0, r237_5, 1, true) then
        return true
      end
    end
    local r237_6 = {
      "/bash", "/zsh", "/sh", "/csh", "/dash", "/ksh93", "/ksh", "/tcsh", "/perl", "/ruby", "/java",
      "/openssl", "/gpg", "/dd", "/shred", "/rm"
    }
    for r237_7, r237_8 in ipairs(r237_6) do
      if p237_0:sub(-1 * #r237_8) == r237_8 then
        return true
      end
    end
    return false
  end
  return true
end

function get_socket_fd_from_dup_event(p238_0)
  local r238_0
  if p238_0.matched and p238_0.utf8p1 ~= nil then
    r238_0 = string.match(p238_0.utf8p1, "Socket:(%d+)")
  end
  return r238_0
end

function find_nearby_protectvmlocal_changes(p239_0, p239_1)
  if type(p239_0) == "table"
    and not isnull(p239_0)
    and type(p239_1) == "string"
    and not isnull(p239_1)
    and mp.SIGATTR_LOG_SZ ~= 0 then
    local r239_0 = 16505
    local r239_1 = {}
    local r239_2 = 0
    for r239_3, r239_4 in pairs(p239_0) do
      r239_1[r239_4] = 0
    end
    for r239_5 = mp.SIGATTR_LOG_SZ, 1, -1 do
      local r239_6 = sigattr_tail[r239_5]
      if not isnull(r239_6.attribute)
        and not isnull(r239_6.utf8p1)
        and not isnull(r239_6.utf8p2)
        and r239_6.attribute == r239_0
        and r239_6.utf8p2 == p239_1
        and r239_1[r239_6.utf8p1] ~= nil then
        r239_1[r239_6.utf8p1] = r239_1[r239_6.utf8p1] + 1
        r239_2 = r239_2 + 1
      end
    end
    return r239_2, r239_1
  end
  return 0, nil
end

function find_nearby_suspicious_traffic(p240_0, p240_1, p240_2, p240_3)
  local r240_0, r240_1 = 10000000, 16402
  if not isnull(p240_0) and mp.SIGATTR_LOG_SZ ~= 0 then
    local r240_2 = isnull(p240_1)
    p240_1 = r240_2 and 3 or p240_1
    r240_2 = isnull
    r240_2 = r240_2(p240_2)
    p240_2 = r240_2 and 30 or p240_2
    r240_2 = isnull
    r240_2 = r240_2(p240_3)
    p240_3 = r240_2 and true or p240_3
    p240_2 = p240_2 * r240_0
    r240_2 = bm
    r240_2 = r240_2.GetOverallTrafficVolumes
    r240_2 = r240_2()
    if not isnull(r240_2)
      and not isnull(r240_2.first_report_time)
      and not isnull(r240_2.last_report_time) then
      local r240_3 = r240_2.first_report_time - p240_2
      local r240_4 = r240_2.last_report_time + p240_2
      if not (p240_0 < r240_3) and not (r240_4 < p240_0) then
        local r240_5 = {}
        for r240_6 = mp.SIGATTR_LOG_SZ, 1, -1 do
          local r240_7 = sigattr_tail[r240_6]
          if not isnull(r240_7.attribute)
            and not isnull(r240_7.utf8p1)
            and not isnull(r240_7.utf8p2)
            and r240_7.attribute == r240_1
            and (r240_7.utf8p1 == "NRI:HasRequestResponse.A"
              or r240_7.utf8p1 == "NRI:OutgoingRemoteConnection") then
            local r240_8 = r240_7.utf8p1 == "NRI:OutgoingRemoteConnection" and "req" or "resp"
            local r240_9, r240_10, r240_11 = string.match(r240_7.utf8p2,
              ";DestIp=(.-);DestPort=([0-9]+);.-;Uri=(.-);")
            local r240_12, r240_13, r240_14 = r240_11, r240_10, r240_9
            local r240_15
            if r240_12 == "" then
              r240_15 = nil
            else
              r240_15 = string.match(string.gsub(r240_12, "^https?://", ""), "^([^/]-)")
            end
            r240_9 = isnull
            r240_10 = r240_15
            r240_15 = r240_9(r240_10) and "" or string.lower(r240_15)
            if not isnull(r240_14)
              and not isnull(r240_13)
              and (r240_12 == "" or string.find(r240_15, ".", 1, true))
              and r240_15 ~= "aadcdn.msftauth.net"
              and r240_15 ~= "detectportal.firefox.com"
              and r240_15 ~= "loki.delve.office.com"
              and r240_15 ~= "ocsp.digicert.com"
              and r240_15 ~= "odc.officeapps.live.com"
              and r240_15 ~= "outlook.office365.com"
              and not string.find(r240_15, "crl[0-9]%.digicert%.com") then
              local r240_16 = string.format("%s:%s", r240_14, r240_13)
              local r240_17 = getIpAddressClass(r240_14)
              if not p240_3
                or not isnull(r240_17)
                  and (r240_17 == 3 or r240_17 == 8)
                  and not string.find(r240_14, "^fe80::") then
                if r240_5[r240_16] == nil then
                  local r240_18 = { req = 0, resp = 0, uri = {} }
                  r240_5[r240_16] = r240_18
                end
                r240_5[r240_16][r240_8] = r240_5[r240_16][r240_8] + 1
                if not isnull(r240_12) then
                  table.insert(r240_5[r240_16].uri, r240_12)
                end
              end
            end
          end
        end
        local r240_19 = 0
        local r240_20 = {}
        for r240_21, r240_22 in pairs(r240_5) do
          local r240_23 = math_min(r240_22.req, r240_22.resp)
          if p240_1 <= r240_23 then
            local r240_24 = { count = r240_23, uri = r240_22.uri }
            r240_20[r240_21] = r240_24
            r240_19 = r240_19 + 1
          end
        end
        return r240_19, r240_20
      end
      return 0, nil
    end
    return 0, nil
  end
  return 0, nil
end

function reportBmInfo()
  local r241_0 = {}
  if bm then
    for r241_1 = 1, mp.SIGATTR_LOG_SZ do
      local r241_2 = sigattr_head[r241_1]
      if r241_2.attribute then
        local r241_3
        if r241_2.utf8p1 and r241_2.utf8p1 ~= "" then
          r241_3 = r241_2.utf8p1
        else
          r241_3 = nil
        end
        local r241_4
        if r241_2.utf8p2 and r241_2.utf8p2 ~= "" then
          r241_4 = r241_2.utf8p2
        else
          r241_4 = nil
        end
        local r241_5
        if r241_2.np1 and r241_2.np1 ~= 0 then
          r241_5 = r241_2.np1
        else
          r241_5 = nil
        end
        local r241_6
        if r241_2.np2 and r241_2.np2 ~= 0 then
          r241_6 = r241_2.np2
        else
          r241_6 = nil
        end
        local r241_7
        if r241_2.timestamp then
          r241_7 = r241_2.timestamp
        else
          r241_7 = nil
        end
        if r241_2.attribute == 61440 and r241_2.p1 and r241_2.p1 ~= "" and r241_3 == nil then
          r241_3 = tostring(r241_2.p1)
        end
        if r241_2.attribute == 61440 and r241_2.p2 and r241_2.p2 ~= "" and r241_4 == nil then
          r241_4 = tostring(r241_2.p2)
        end
        local r241_8 = {
          index = r241_1, event_attribute = r241_2.attribute, utf8p1 = r241_3, utf8p2 = r241_4,
          np1 = r241_5, np2 = r241_6, timestamp = r241_7
        }
        table.insert(r241_0, r241_8)
      end
    end
    local r241_9 = table_split_chunks(r241_0, 100)
    for r241_10 = 1, #r241_9 do
      local r241_11 = r241_9[r241_10]
      local r241_12 = safeJsonSerialize(r241_11, 260)
      if r241_11 and r241_12 and r241_10 then
        bm.add_related_string("reportBmInfo_" .. r241_10, r241_12, bm.RelatedStringBMReport)
        bm.add_related_string("reportBmInfo_" .. r241_10 .. "_content_size", tostring(#r241_12),
          bm.RelatedStringBMReport)
      end
    end
    bm.add_related_string("reportBmInfo_size", tostring(#r241_0), bm.RelatedStringBMReport)
    return true
  end
  return false
end

function reportRelatedFilesFromBmEvents()
  local r242_0 = {
    [16384] = "utf8p1", [16385] = "utf8p1", [16386] = "utf8p2", [16387] = "utf8p1",
    [16388] = "utf8p1", [16525] = "utf8p1", [16404] = "utf8p1"
  }
  for r242_1 = mp.SIGATTR_LOG_SZ, 1, -1 do
    if sigattr_head[r242_1].attribute and r242_0[sigattr_head[r242_1].attribute] then
      local r242_2 = r242_0[sigattr_head[r242_1].attribute]
      local r242_3 = nil
      if sigattr_head[r242_1][r242_2] then
        r242_3 = sigattr_head[r242_1][r242_2]
      end
      if r242_3 then
        bm.add_related_file(r242_3)
      end
    end
  end
end

function getBmInfo()
  local r243_0 = {}
  if bm then
    local r243_1 = 0
    for r243_2 = mp.SIGATTR_LOG_SZ, 1, -1 do
      local r243_3, r243_4 = "", ""
      if sigattr_head[r243_2].attribute
        and sigattr_head[r243_2].attribute ~= 16404
        and sigattr_head[r243_2].attribute ~= 61440 then
        if sigattr_head[r243_2].utf8p1 then
          r243_3 = sigattr_head[r243_2].utf8p1
        else
          r243_3 = "<empty>"
        end
        if sigattr_head[r243_2].utf8p2 then
          r243_4 = sigattr_head[r243_2].utf8p2
        else
          r243_4 = "<empty>"
        end
        local r243_5 = {
          event_attribute = sigattr_head[r243_2].attribute, utf8p1 = r243_3, utf8p2 = r243_4
        }
        table.insert(r243_0, r243_5)
        r243_1 = r243_1 + 1
        if r243_1 > 128 then
          break
        end
      end
    end
    return r243_0
  end
  return r243_0
end

function commandline_to_argv(p244_0)
  local r244_0, r244_1, r244_2, r244_3, r244_4
  if not isnull(p244_0) and type(p244_0) == "string" then
    local r244_5 = 0
    local r244_6 = {}
    local r244_7 = ""
    local r244_8 = { [" "] = true, ["\n"] = true, ["\t"] = true }
    r244_0, r244_1, r244_2 = p244_0:gmatch(".")
    r244_3, r244_4 = false, false
    for r244_9 in r244_0, r244_1, r244_2 do
      if r244_3 then
        local r244_10 = r244_7
        r244_7 = r244_10 .. r244_9
        r244_3 = false
      elseif r244_9 ~= "\\" or r244_4 then
        if r244_9 == '"' then
          r244_4 = not r244_4
        elseif r244_4 or not r244_8[r244_9] then
          local r244_11 = r244_7
          r244_7 = r244_11 .. r244_9
        else
          if #r244_7 > 0 then
            r244_5 = r244_5 + 1
            table.insert(r244_6, r244_7)
          end
          r244_7 = ""
        end
      else
        r244_3 = true
      end
    end
    if not r244_3 and not r244_4 then
      if #r244_7 > 0 then
        r244_5 = r244_5 + 1
        table.insert(r244_6, r244_7)
      end
      local r244_12 = r244_5
      local r244_13 = r244_6
      return r244_12, r244_13
    end
    return 0, nil
  end
  return 0, nil
end

function helper_tamperapi_setup(p245_0, p245_1)
  if isnull(p245_1) then
    local r245_0 = "TamperAMSI"
    if r245_0 then
      p245_1 = r245_0
    end
  end
  local r245_1 = isnull(p245_0)
  r245_1 = (not r245_1 and p245_0.matched == true) == true
  if r245_1 and isnull(p245_0.utf8p1) then
    return
  end
  local r245_2 = bm.get_current_process_startup_info()
  if not isnull(r245_2) and not isnull(r245_2.ppid) then
    local r245_3 = string.find
    local r245_4 = string.lower
    local r245_5 = r245_2.command_line
    r245_3 = r245_3(r245_4(r245_5 or ""), "svchost.exe -k camera -s frameserver", 1, true)
    if not r245_3 then
      local r245_6, r245_7
      if r245_1 then
        local r245_8, r245_9, r245_10 = string.match(p245_0.utf8p1,
          "imagename:(.+);targetprocessppid:(%d+):(%d+)$")
        if isnull(r245_8) or isnull(r245_9) or isnull(r245_10) then
          return
        end
        r245_6, r245_7 = r245_8, string.format("pid:%d,ProcessStart:%d", r245_9, r245_10)
      else
        local r245_11 = r245_2.ppid
        r245_6 = GetFileName(bm.get_imagepath() or "")
        r245_7 = r245_11
        if isnull(r245_6) then
          return
        end
      end
      local r245_12 = r245_7
      local r245_13 = r245_1
      return r245_6, r245_12, r245_13
    end
  end
end

function found_api_tampering(p246_0, p246_1, p246_2, p246_3, p246_4, p246_5, p246_6, p246_7, p246_8,
  p246_9)
  local r246_0 = isnull(p246_3)
  p246_3 = r246_0 and "amsi.dll" or p246_3
  r246_0 = isnull
  r246_0 = r246_0(p246_4)
  if r246_0 then
    local r246_1 = { BadInstruction = true, KnownBad = true }
    if r246_1 then
      p246_4 = r246_1
    end
  end
  if isnull(p246_5) then
    local r246_2 = { "AmsiScanBuffer" }
    if r246_2 then
      p246_5 = r246_2
    end
  end
  if isnull(p246_6) then
    local r246_3 = { [144] = true, [195] = true, [196] = true, [49] = true, [51] = true }
    if r246_3 then
      p246_6 = r246_3
    end
  end
  local r246_4 = isnull(p246_7)
  p246_7 = r246_4 and 20 or type(p246_7) ~= "number" and 20 or p246_7
  r246_4 = isnull
  r246_4 = r246_4(p246_8)
  p246_8 = r246_4 and "TamperAMSIPatch" or p246_8
  r246_4 = isnull
  p246_9 = r246_4(p246_9) and "T1562.006" or p246_9
  local r246_5 = 86400
  local r246_6 = string.format("%s_Metadata", p246_8)
  local r246_7 = string.format("%s_Debug", p246_8)
  local r246_8 = 0
  local r246_9, r246_10, r246_11 = nil, nil, nil
  local r246_12 = p246_2 and "Remote" or "Local"
  local r246_13 = {
    AmsiOpenSession = "^4885D274474885C974428139414D5349753A488379080074334883791000742C41B801000000418BC0F00FC141184103C048984889027510418BC0F00FC141184103C0489848890233C0C3CCB857000780C3",
    AmsiScanBuffer = "^4C8BDC49895B0849896B104989731857415641574883EC704D8BF9418BF848.-B8570007804C8D5C2470498B5B20498B6B28498B7330498BE3415F415E5FC3CC",
    AmsiScanString = "^4883EC384533DB4885D2743D4C8B5424604D85D274334883C8FF48FFC06644391C4275F64803C041BBFFFFFFFF493BC377174C895424284C894C24204D8BC8448BC0E8",
    DllGetClassObject = "^558BEC8B550833C956BE........8B048A3B048E75134183F90475F28B55108B4D0CE8",
    EtwEventWrite = "^4C8BDC4883EC584D894BE833C0458943E04533C9498943D84533C0498943D06689442420E8........4883C458C3",
    EventWrite = "^6E74646C6C2E4574774576656E745772697465004576656E745772697465456E645363656E6172696F006E74646C6C2E4574774576656E745772697465456E645363656E6172696F004576656E7457726974654578006E74646C6C2E4574774576656E7457726974654578004576656E74577269746553746172745363656E6172696F006E74646C6C2E4574774576656E74577269746553746172745363656E6172696F004576656E745772697465537472696E67006E74646C6C2E4574774576656E745772697465537472696E67004576656E7457726974655472616E73666572006E74646C6C2E4574774576656E7457726974655472616E736665720046696C65456E6372797074696F6E537461747573410046696C65456E6372797074696F6E537461747573570046",
    LdrLoadDll = "^68........C3", NtTraceEvent = "^4C8BD1B85E000000F604250803FE7F0175030F05C3CD2EC3"
  }
  local r246_14 = {
    AmsiOpenSession2 = "^4885D2743F4885C9743A488379080074334883791000742C41B801000000418BC0F00FC141184103C048984889027510418BC0F00FC141184103C0489848890233C0C3CCB857000780C3",
    AmsiOpenSession3 = "^4885D2740C4885C9740748837908007507B857000780C3CC488379100074F241B801000000418BC0F00FC141184103C04898488902740433C0C3CC418BC0F00FC141184103C04898488902EBEACCCCCCCCCCCCCCE937060000CCCCCCCCCCCCCC488B4910488B01488B4020E910550000CCCCCCCCCCCCCCCC40534883EC20488BD9E822000000488BCB48FF15307600000F1F440000488BC34883C4205BC3CCCCCCCCCCCCCCCCCCCC488BC1488D15766600004883C108488910C701010000C0E98CEEFFFFCCCCCCCCCCCCCCCCCCCCCCCC488BC44889580848896810488970184889782041564883EC404D8BF1418BF8488BF2488BD9488B0DBCD40000488D05B5",
    AmsiOpenSession4 = "^4885D274464885C974418139414D53497539488379080074324883791000742B41B801000000418BC0F00FC141184103C048984889027510418BC0F00FC141184103C0489848890233C0C3B857000780C3",
    AmsiOpenSession5 = "^8BFF558BEC8B4D0C85C974398B450885C074328138414D5349752A83780400742483780800741E33D256428D700C8BC2F00FC1064089017507F00FC11642891133C05EEB05B8570007805DC20800CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC8BFF558BEC8B4508568B48088B450C99528B3150518B4E10FF150012E26BFF56105E5DC20800CCCCCCCCCCCCCCCCCCCCE91B60DCF683EC185356A10000E26B8B5D108B75083D0000E26B741CF6401C047416FF751CFF751853FF750C56FF7014FF7010E805F9FFFF8B450C85C0745A85DB7456837D1C00745085F6744C813E414D534975448B560485D2743D8B4E0885C974368945EC8B451489",
    AmsiScanString2 = "^8BFF558BEC8B550C85D27434837D1800742E8BCA568D7102668B0183C1026685C075F5FF75182BCEFF7514D1F9FF75108D04095052FF7508E813FFFFFF5EEB05B8570007805DC21400CCCCCCCCCCCCCC8BFF558BEC83E4F851535657A10000E26BBB0000E26B8B7508BF442EE16B3BC3741CF6401C04741656FF70148BD7FF70106A1959E8DEF6FFFFA10000E26B85F675243BC37416F6401C017410FF70148BD7FF70106A1A59E89DF6FFFFB857000780E9590100006A10FF150830E26B8BF08974240C85F67529A10000E26B3BC37416F6401C017410FF70148BD7FF70106A1B59E862F6FFFFB80E000780E91E01000033C08BFE68D022E16B",
    AmsiScanString3 = "^4883EC384D8BD84533C04885D274264C8B5424604D85D2741C4883C8FF48FFC0664439044275F64C8D0400B8FFFFFFFF4C3BC0760BB8570007804883C438C3CC4C895424284C894C24204D8BCBE80E000000EBE6",
    AmsiScanString4 = "^4883EC384D8BD84533C04885D274264C8B5424604D85D2741C4883C8FF48FFC0664439044275F64C8D0400B8FFFFFFFF4C3BC0760AB8570007804883C438C34C895424284C894C24204D8BCBE80F000000EBE7CC",
    EtwEventWrite2 = "^405557415441564157488D6C24804881EC80010000488B05%x%x%x%x%x%x%x%x4833C4488945600F57C90F57C033C033FF488945C0458BF8488945504D8BE14C8BF24C8BD1448BC70F114424500F114424600F114424700F1145800F1145900F1145A00F1145B00F114DD00F114DE00F114DF00F114D000F114D100F114D200F114D300F114D404885D20F84220200000F10028BCF418BD248D1EA418BC2C1E80483E20748899C2478010000488D1D%x%x%x%x%x%x%x%x0F11442478458BCA4C8B9CD390%x21C003B8493%x%x%x%x19008BC70F92C14D85DB0F95C023C84185CA752AB806000000488B9C2478010000488B4D604833CCE8%x%x%x%x%x%x004881C480010000415F"
  }
  local r246_15 = { DeepInstinct64 = "^4883EC08C7", DeepInstinct32 = "^83EC04C7" }
  if not isnull(p246_0)
    and not isnull(p246_1)
    and not isnull(p246_3)
    and not isnull(p246_4)
    and not isnull(p246_5)
    and not isnull(p246_6)
    and not isnull(p246_7) then
    if not p246_4.BadInstruction and not p246_4.FunctionBase and not p246_4.KnownBad then
      return false
    end
    local r246_16, r246_17 = pcall(bm.GetModAddress, p246_1, p246_3)
    if r246_16 and r246_17 then
      local r246_18 = ""
      if p246_4.FunctionBase and mp.SIGATTR_LOG_SZ > 0 then
        local r246_19 = string.gsub(p246_1, ",ProcessStart", "")
        local r246_20 = mp.SIGATTR_LOG_SZ
        for r246_21 = r246_20, 1, -1 do
          local r246_22 = sigattr_tail[r246_21]
          if p246_2
            and not isnull(r246_22.attribute)
            and r246_22.attribute == 16522
            and not isnull(r246_22.utf8p1)
            and not isnull(r246_22.utf8p2)
            and string.find(r246_22.utf8p1, r246_19, 1, true)
            and string.find(r246_22.utf8p2, "vmbaseaddress:%d+;.-lastprotectionmask:32") then
            local r246_23 = string.match(r246_22.utf8p2, "vmbaseaddress:(%d+);")
            if not isnull(r246_23) then
              local r246_24 = string.format("%s;%s", r246_18, r246_23)
              r246_18 = r246_24
            end
          elseif not p246_2
            and not isnull(r246_22.attribute)
            and r246_22.attribute == 16505
            and not isnull(r246_22.utf8p1)
            and not isnull(r246_22.utf8p2)
            and (string.find(r246_22.utf8p1, "32:", 1, true)
              or r246_22.utf8p1 == "4:32" and not string.find(r246_22.utf8p2, "vavadmmfname:..")) then
            local r246_25 = string.match(r246_22.utf8p2, "^(%d+);")
            if not isnull(r246_25) then
              local r246_26 = string.format("%s;%s", r246_18, r246_25)
              r246_18 = r246_26
            end
          end
        end
      end
      if r246_18 == "" and not p246_4.BadInstruction then
        return false
      end
      local r246_27, r246_28, r246_29 = pairs(p246_5)
      for r246_30, r246_31 in r246_27, r246_28, r246_29 do
        local r246_32, r246_33 = pcall(bm.GetProcAddress, p246_1, p246_3, r246_31)
        if r246_33 then
          local r246_34 = r246_33 > 4294967295 and mp.SMS_PROC_ARCH_X64 or mp.SMS_PROC_ARCH_X32
          local r246_35, r246_36, r246_37 = pcall(bm.VirtualQuery, r246_33, p246_1)
          if not r246_36 then
            break
          end
          local r246_38, r246_39 = pcall(bm.ReadProcMem, r246_33, 300, p246_1)
          if not r246_38 or not r246_39 then
            break
          end
          local r246_40 = tohex(r246_39)
          local r246_41 = mp.crc32(0, r246_40, 1, 0)
          if r246_13[r246_31] and string.find(r246_40, r246_13[r246_31])
            or r246_31 == "AmsiOpenSession"
              and (string.find(r246_40, r246_14.AmsiOpenSession2)
                or string.find(r246_40, r246_14.AmsiOpenSession3)
                or string.find(r246_40, r246_14.AmsiOpenSession4)
                or string.find(r246_40, r246_14.AmsiOpenSession5))
            or r246_31 == "AmsiScanString"
              and (string.find(r246_40, r246_14.AmsiScanString2)
                or string.find(r246_40, r246_14.AmsiScanString3)
                or string.find(r246_40, r246_14.AmsiScanString4))
            or string.find(r246_40, r246_15.DeepInstinct64)
            or string.find(r246_40, r246_15.DeepInstinct32)
            or p246_4.FunctionBase
              and r246_31 == "EtwEventWrite"
              and (r246_41 == 462378421 or string.find(r246_40, r246_14.EtwEventWrite2)) then
            break
          end
          if p246_4.KnownBad and string.find(r246_40, "^48B8................FFE0") then
            r246_11 = "KnownBad"
            r246_9 = true
            local r246_42 = {}
            r246_42.ProcName = p246_0
            r246_42.DLLName = p246_3
            r246_42.TamperType = r246_11
            r246_42.FuncName = r246_31
            r246_42.FuncAddr = r246_33
            local r246_43 = tostring(r246_41)
            r246_42.CRC32 = r246_43
            r246_42.CpuArch = r246_34
            r246_42.ProcRemote = p246_2
            r246_42.EncMem = r246_40
            local r246_44 = r246_42
            r246_42 = safeJsonSerialize
            r246_43 = r246_44
            r246_42 = r246_42(r246_43)
            r246_10 = r246_42
          end
          if p246_4.FunctionBase
            and r246_18 ~= ""
            and string.find(r246_18, tostring(r246_37.base_addr), 1, true) then
            r246_11 = "FunctionBase"
            r246_9 = true
            local r246_45 = {}
            r246_45.ProcName = p246_0
            r246_45.DLLName = p246_3
            r246_45.TamperType = r246_11
            r246_45.FuncName = r246_31
            r246_45.FuncAddr = r246_33
            r246_45.BaseAddr = r246_37.base_addr
            r246_45.ProcRemote = p246_2
            r246_45.EncMem = r246_40
            local r246_46 = tostring(r246_41)
            r246_45.CRC32 = r246_46
            local r246_47 = r246_45
            r246_45 = safeJsonSerialize
            r246_46 = r246_47
            r246_45 = r246_45(r246_46)
            r246_10 = r246_45
          end
          if p246_4.BadInstruction then
            local r246_48 = mp.x86dasm
            local r246_49 = #r246_39
            local r246_50 = mp.DASM_BREAK_ON_JMP
            local r246_51 = mp.DASM_BREAK_ON_IJMP
            r246_50 = r246_50 + r246_51
            r246_51 = nil
            local r246_52 = r246_48(r246_34, r246_33, r246_39, r246_49, p246_7, r246_33, r246_50)
            if not r246_52 then
              break
            end
            local r246_53, r246_54, r246_55 = pairs(r246_52)
            for r246_56, r246_57 in r246_53, r246_54, r246_55 do
              if p246_6[r246_57.opcode]
                and (r246_57.opcode ~= 51 and r246_57.opcode ~= 49 or r246_57.modrm == 192) then
                r246_11 = "BadInstruction"
                r246_9 = true
                local r246_58 = {}
                r246_58.ProcName = p246_0
                r246_58.DLLName = p246_3
                r246_58.TamperType = r246_11
                r246_58.FuncName = r246_31
                r246_58.FuncAddr = r246_33
                r246_58.Instr = r246_57.opcode
                local r246_59 = tostring(r246_41)
                r246_58.CRC32 = r246_59
                r246_58.CpuArch = r246_34
                r246_58.ProcRemote = p246_2
                r246_58.EncMem = r246_40
                local r246_60 = r246_58
                r246_58 = safeJsonSerialize
                r246_59 = r246_60
                r246_58 = r246_58(r246_59)
                r246_10 = r246_58
                break
              end
            end
          end
          if r246_9 then
            bm.add_related_string(r246_6, r246_10, bm.RelatedStringBMReport)
            TrackPidAndTechnique(p246_1, p246_9,
              string.format("%s_%s_%s_%s", p246_8, r246_12, p246_3, r246_11))
            r246_9 = false
            r246_8 = r246_8 + 1
          end
        end
      end
      if r246_8 > 0 then
        if p246_2 then
          bm.add_related_process(p246_1)
          MpCommon.SetTaintedProcess(p246_1, bm.BM_TAINT_PROTECTVM)
        else
          bm.request_SMS(p246_1, "m")
        end
        local r246_61 = r246_11
        return true, r246_61
      end
      return false
    end
    return false
  end
  return false
end

function is_valid_ip(p247_0)
  if isnull(p247_0) then
    return nil
  end
  return string.find(p247_0, "%d+%.%d+%.%d+%.%d+", 1, false)
end

function extract_urls(p248_0)
  if isnull(p248_0) then
    return {}
  end
  do
    local r248_0 = {}
    local r248_1 = {}
    local r248_2 = {}

    local function r248_3(p249_0)
      p249_0 = string.gsub(p249_0, "[,;%)}%]\\]$", "")
      p249_0 = string.gsub(p249_0, "\\+$", "")
      if not r0_55(p249_0) and not r0_61(p249_0) then
        local r249_0 = string.match
        r249_0 = r249_0(p249_0, "^[hH][tT]+[pP][sS]?://([^/]+)") or string.match(p249_0, "^([^/]+)")
        if r249_0 and not r248_2[r249_0] then
          table.insert(r248_0, p249_0)
          table.insert(r248_1, r249_0)
          r248_2[r249_0] = true
          local r249_1 = string.match(r249_0, "^www%.(.+)")
          if r249_1 then
            r248_2[r249_1] = true
          end
        end
      end
    end

    local r248_4 = p248_0:gsub("[\"']", ""):gsub("%+", ""):gsub("\\", ""):gsub("%s+", "")
    for r248_5 in string.gmatch(p248_0,
      "%-[Rr][Ee][Ss][Tt][Mm][Ee][Tt][Hh][Oo][Dd]%s*['\"]([^'\"]+)['\"]%)?") do
      r248_3(r248_5)
    end
    local r248_6 = false
    for r248_7 in string.gmatch(p248_0, "([hH][tT]+[pP][sS]?://[^%s%\"'<>%(%)]+)") do
      r248_3(r248_7)
      r248_6 = true
    end
    if r248_6 == false then
      for r248_8 in string.gmatch(p248_0, "([%w%-%.]+%.[a-zA-Z][a-zA-Z]+/[^%s%\"'<>,;%)%]}\\]+)") do
        if string.match(r248_8, "^[%w%-%.]+%.[a-zA-Z][a-zA-Z]+/") then
          r248_3(r248_8)
        end
      end
      for r248_9 in string.gmatch(r248_4, '["\']?[%w\\"]+%.[a-zA-Z]+["\']?') do
        local r248_10 = r248_9:gsub("[\\\"']", "")
        if #r248_10 > 6 and r248_10:match("^[%w%-%.]+%.[a-zA-Z]+$") then
          r248_3("http://" .. r248_10)
        end
      end
    end
    local r248_11 = "([^/\\%.vV_%-]%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?[^/\\%.vV_%-])" .. "|"
      .. "^(%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?[^/\\%.vV_%-])" .. "|"
      .. "([^/\\%.vV_%-]%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?)$" .. "|"
      .. "^(%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?)$"
    for r248_12 in string.gmatch(p248_0, r248_11) do
      local r248_13 = is_valid_ip(r248_12)
      if r248_13 then
        r248_12 = string.gsub(r248_12, "[,;%)}%]\\]$", "")
        r248_12 = string.gsub(r248_12, "\\+$", "")
        local r248_14 = r0_55
        r248_14 = r248_14(r248_12)
        if not r248_14 and not r248_2[r248_12] then
          table.insert(r248_0, r248_12)
          r248_2[r248_12] = true
        end
      end
    end
    return r248_0, r248_1
  end
end

function ExtractUrlGetReputation(p250_0, p250_1, p250_2, p250_3, p250_4, p250_5, p250_6)
  if p250_0 == nil then
    return nil, nil
  end
  if p250_1 == nil then
    return nil, nil
  end
  p250_2 = p250_2 or false
  p250_3 = p250_3 or 2
  p250_4 = p250_4 or 60
  p250_5 = p250_5 or false
  p250_6 = p250_6 or 2000
  local r250_0 = false
  local r250_1 = {}

  local function r250_2(p251_0, p251_1, p251_2, p251_3)
    local r251_0, r251_1 = pcall(mp.GetUrlReputation, p251_0, p251_1, p251_2, p251_3)
    if r251_0 then
      local r251_2 = r251_1.urls
      for r251_3, r251_4 in ipairs(r251_2) do
        if r251_4.determination == p250_3 and p250_4 <= r251_4.confidence then
          r250_0 = true
        end
      end
      table.insert(r250_1, r251_2)
    end
  end

  local r250_3, r250_4 = extract_urls(p250_0)
  if not isnull(r250_3) and not isnull(r250_4) then
    local r250_5 = r250_4[1]
    local r250_6, r250_7 = r250_3[1], r250_5
    local r250_8 = r250_7:gsub("\\", "/")
    r250_5 = r250_8
    r250_7 = r250_6
    r250_8 = r250_7:gsub("\\", "/")
    r250_6 = r250_8
    if p250_2 then
      local r250_9 = nil
      if not string.match(r250_5, "^(https?)://") then
        local r250_10 = string.match(r250_6, "^(https?)://")
        local r250_11, r250_12, r250_13 = r250_10, "://", r250_5
        r250_5 = r250_11 .. r250_12 .. r250_13
        r250_12 = r250_5
        r250_11 = r250_12.match
        r250_13 = "://([^/]+)"
        r250_11 = r250_11(r250_12, r250_13)
        if is_valid_ip(r250_11) then
          r250_9 = r250_11
        else
          r250_9 = r250_11:match("([^.]+%.[^.]+)$")
        end
        if r250_9 then
          local r250_14 = r250_9
          r250_9 = r250_10 .. "://" .. r250_14
          if r250_5 == r250_9 then
            r250_9 = nil
          end
        end
      end
      if r250_9 then
        local r250_15 = {}
        local r250_16 = r250_9
        r250_15[1] = r250_16
        r250_16 = p250_1
        r250_2(r250_15, r250_16, p250_5, p250_6)
      end
      if r250_5 ~= r250_6 then
        local r250_17 = r250_2
        local r250_18 = {}
        local r250_19 = r250_5
        r250_18[1] = r250_19
        r250_19 = p250_1
        r250_17(r250_18, r250_19, p250_5, p250_6)
      end
    end
    r250_8 = r250_2
    local r250_20 = {}
    local r250_21 = r250_6
    r250_20[1] = r250_21
    r250_21 = p250_1
    r250_8(r250_20, r250_21, p250_5, p250_6)
    r250_8 = r250_0
    r250_20 = r250_1
    return r250_8, r250_20
  end
  return nil, nil
end

function IsNoisyWebProc()
  local r252_0 = string.lower(bm.get_imagepath())
  if r252_0
    and (string.find(r252_0, "\\crowdcrawlerworker.exe", 1, true)
      or string.find(r252_0, "\\search_engine_ranker.exe", 1, true)
      or string.find(r252_0, "\\searchenginedata.exe", 1, true)
      or string.find(r252_0, "\\net_updater32.exe", 1, true)
      or string.find(r252_0, "\\themaposter.exe", 1, true)
      or string.find(r252_0, "\\blackhatseo.exe", 1, true)
      or string.find(r252_0, "\\maw-aio.exe", 1, true)
      or string.find(r252_0, "\\webcontact.exe", 1, true)
      or string.find(r252_0, "\\sitecrawller.exe", 1, true)
      or string.find(r252_0, "\\sidcraker.exe", 1, true)
      or string.find(r252_0, "\\sidwpcraker.exe", 1, true)
      or string.find(r252_0, "\\wp-brute.exe", 1, true)
      or string.find(r252_0, "\\wp-cracker-v2.exe", 1, true)
      or string.find(r252_0, "\\besacrawler.exe", 1, true)
      or string.find(r252_0, "\\cymulate.agent.service.exe", 1, true)
      or string.find(r252_0, "\\cymulate.agent.executor.exe", 1, true)
      or string.find(r252_0, "\\cmscheckerv3.exe", 1, true)
      or string.find(r252_0, "\\honeygain.exe", 1, true)) then
    return true
  end
  return false
end

function IsUriKnownHostname(p253_0)
  if p253_0 ~= nil and p253_0 ~= "" then
    local r253_0 = {
      ".microsoftonline.", ".office365.com", ".outlook.com", ".microsoft.com", ".visualstudio.com",
      ".windows.net", ".msftauth.net", ".msft.net", "aadcdn.ms", ".live.com", ".office.com",
      ".office.net", ".azure.com", ".azure.net", ".azurewebsites.net", ".azureedge.net",
      ".microsoftazuread-sso.com", ".osdinfra.net", ".xboxlive.com", ".skype.com", ".lync.com",
      ".sharepoint.com", ".msappproxy.net", ".powershellgallery.com", ".google.com", ".intel.com",
      ".godaddy.com", ".svc.cloud.microsoft", ".sharepoint-df.com", ".pushnp.svc.ms",
      ".wns.windows.com", ".msedge.net", ".msn.com", ".microsoft.ghe.com", ".msft.ghe.com",
      "mcp.eng.ms", ".githubcopilot.com", ".anthropic.com", "chatgpt.com", ".digicert.com",
      ".digicert.cn", ".globalsign.com", ".verisign.com", ".ssl.com", ".comodoca.com",
      ".usertrust.com", ".sectigo.com", ".entrust.net", ".symcb.com", ".symcd.com", ".pki.goog",
      ".geotrust.com", ".lencr.org", ".identrust.com", ".thawte.com", ".cfca.com.cn", ".adobe.com",
      ".adobe.io", ".goskope.com", ".sentinelone.net", ".rapid7.com", ".checkpoint.com",
      ".symantec.com", ".demonware.net", ".activision.com", ".hangame.com",
      ".installeranalytics.com"
    }
    local r253_1 = p253_0:lower()
    for r253_2, r253_3 in ipairs(r253_0) do
      if r253_1:find(r253_3, 1, true) then
        return true
      end
    end
    return false
  end
  return false
end

function getSessionInfo(p254_0, p254_1)
  local r254_0 = {}
  r254_0.SigName = p254_1
  local r254_1 = string.lower(mp.GetProcessCommandLine(p254_0))
  if r254_1 ~= nil then
    r254_0.cmdline = r254_1
  end
  local r254_2, r254_3 = pcall(MpCommon.QuerySessionInformation, p254_0, MpCommon.WTSIsRemoteSession)
  r254_3 = r254_2 and r254_3 or "FALSE"
  r254_0.isRemote = tostring(r254_3)
  local r254_4, r254_5 = pcall(MpCommon.QuerySessionInformation, p254_0, MpCommon.WTSDomainName)
  if r254_4 and r254_5 and r254_5 ~= "" then
    local r254_6 = scrubData(r254_5)
    r254_0.DomainName = tostring(r254_6)
  end
  local r254_7, r254_8 = pcall(MpCommon.QuerySessionInformation, p254_0, MpCommon.WTSUserName)
  if r254_7 and r254_8 and r254_8 ~= "" then
    local r254_9 = scrubData(r254_8)
    r254_0.UserName = tostring(r254_9)
  end
  local r254_10, r254_11 = pcall(MpCommon.QuerySessionInformation, p254_0, MpCommon.WTSClientAddress)
  if r254_10 and r254_11 and r254_11 ~= "" then
    local r254_12 = scrubData(r254_11)
    r254_0.IP = tostring(r254_12)
  end
  local r254_13, r254_14 = pcall(MpCommon.QuerySessionInformation, p254_0, MpCommon.WTSClientName)
  if r254_13 and r254_14 and r254_14 ~= "" then
    local r254_15 = scrubData(r254_14)
    r254_0.ClientName = tostring(r254_15)
  end
  return r254_0
end

local function r0_71(p255_0, p255_1)
  local r255_0, r255_1 = pcall(bm.ReadProcMem, p255_0, p255_1)
  if r255_0 then
    if r255_1 == nil then
      return nil
    end
    if #r255_1 < p255_1 then
      return nil
    end
    return r255_1
  end
  return nil
end

function getCWD_BM()
  local r256_0, r256_1, r256_2, r256_3 = 0, 0, 0, 0
  local r256_4 = bm.GetPEBInfo()
  if r256_4 == nil then
    return nil
  end
  if r256_4.PEBAddr ~= nil and r256_4.PEBAddr ~= 0 then
    if r256_4.ProcArch == mp.SMS_PROC_ARCH_X64 then
      r256_0, r256_1, r256_2, r256_3 = 32, 56, 64, 8
    else
      if r256_4.ProcArch ~= mp.SMS_PROC_ARCH_X32 then
        return nil
      end
      r256_0, r256_1, r256_2, r256_3 = 16, 36, 40, 4
    end
    local r256_5 = r256_4.PEBAddr
    if r256_5 ~= nil and r256_5 ~= 0 then
      local r256_6 = r0_71(r256_5 + r256_0, r256_3)
      if r256_6 == nil then
        return nil
      end
      local r256_7
      if r256_4.ProcArch == mp.SMS_PROC_ARCH_X64 then
        r256_7 = mp.readu_u64(r256_6, 1)
      elseif r256_4.ProcArch == mp.SMS_PROC_ARCH_X32 then
        r256_7 = mp.readu_u32(r256_6, 1)
      else
        r256_7 = 0
      end
      if r256_7 ~= nil and r256_7 ~= 0 then
        local r256_8 = r0_71(r256_7 + r256_1, 2)
        if r256_8 == nil then
          return nil
        end
        local r256_9 = r0_71(r256_7 + r256_2, r256_3)
        if r256_9 == nil then
          return nil
        end
        local r256_10 = mp.readu_u16(r256_8, 1)
        if r256_10 == nil then
          return nil
        end
        if r256_10 == 0 then
          return nil
        end
        local r256_11
        if r256_4.ProcArch == mp.SMS_PROC_ARCH_X64 then
          r256_11 = mp.readu_u64(r256_9, 1)
        elseif r256_4.ProcArch == mp.SMS_PROC_ARCH_X32 then
          r256_11 = mp.readu_u32(r256_9, 1)
        else
          r256_11 = 0
        end
        if r256_11 ~= nil and r256_11 ~= 0 then
          local r256_12 = r0_71(r256_11, r256_10)
          if r256_12 == nil then
            return nil
          end
          local r256_13, r256_14 = pcall(mp.utf16to8, r256_12 .. "\000\000")
          if r256_13 then
            if r256_14 == nil then
              return nil
            end
            return r256_14
          end
          return nil
        end
        return nil
      end
      return nil
    end
    return nil
  end
  return nil
end

function extractTaskCommandArgs(p257_0)
  if type(p257_0) == "string" and p257_0 ~= "" then
    local r257_0 = p257_0:match("<Actions%f[%s>][^>]*>(.-)</Actions%s*>")
    if r257_0 then
      local r257_1 = r257_0:match("<Exec%f[%s>][^>]*>(.-)</Exec%s*>")
      if r257_1 then
        local r257_2 = r257_1:match("<Command%s*>(.-)</Command%s*>")
        r257_2 = r257_2 or r257_1:find("<Command%s*/>") and "" or r257_2
        if r257_2 then
          local r257_3 = r257_1:match("<Arguments%s*>(.-)</Arguments%s*>") or ""
          local r257_4 = r257_2
          if r257_3 ~= "" then
            if r257_2 == "" then
              r257_4 = r257_3
            else
              r257_4 = r257_2 .. " " .. r257_3 or r257_3
            end
          end
          return r257_4, r257_2, r257_3
        end
        return nil, nil, nil
      end
      return nil, nil, nil
    end
    return nil, nil, nil
  end
  return nil, nil, nil
end
