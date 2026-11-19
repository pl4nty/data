-- Threat: !InfrastructureShared
-- Name: !#Lua:LuaGPOBlockerFilter
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: Lua:GPOBlockerFilter

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local r0_0 = mp.getfilename()
local r0_1 = r0_0:lower():match("^(.*)\\gpt.ini$")
local r0_2 = r0_0:lower()
r0_2 = r0_2:match("^\\device\\mup\\.+\\sysvol\\.+\\policies\\{(%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x)}\\gpt.ini$")

local function r0_3(p1_0)
  local r1_0, r1_1 = pcall(parseRegistryPol, p1_0)
  if r1_0 then
    if #r1_1 == 0 then
      return nil
    end
    local r1_2 = {}
    local r1_3, r1_4 = "^SOFTWARE\\Microsoft\\Windows Defender\\", "^SOFTWARE\\Policies\\Microsoft\\Windows Defender\\"
    for r1_5, r1_6 in ipairs(r1_1) do
      local r1_7 = r1_6.key
      local r1_8 = r1_7
      r1_7 = r1_8.find
      if r1_7(r1_8, r1_3) or r1_6.key:find(r1_4) then
        local r1_9 = r1_6.data
        if r1_6.typ == 1 then
          r1_9 = mp.utf16to8(r1_9)
        elseif r1_6.typ == 4 then
          r1_9 = mp.readu_u32(r1_9, 1)
        end
        local r1_10 = #r1_2 + 1
        local r1_11 = {}
        r1_11.key = r1_6.key
        local r1_12 = MpCommon.NormalizeString(r1_6.value, "CmdLineNormalizationStandard")
        r1_11.name = r1_12
        r1_11.value = r1_9
        r1_2[r1_10] = r1_11
        r1_10 = r1_6.key
        r1_11 = r1_10
        r1_10 = r1_11.find
        r1_12 = "Exclusions\\Paths"
        if r1_10(r1_11, r1_12) then
          local r1_13 = MpCommon.StringRegExpSearch("(c:?\\\\*\\*?%?$)", r1_9)
          if r1_13 then
            AppendToRollingQueue("gpo_broad_exclusion", string.lower(r1_9), true, 94608000, 100)
          end
        end
        r1_10 = r1_6.key
        r1_11 = r1_10
        r1_10 = r1_11.find
        if r1_10(r1_11, "Exclusions\\Extensions") then
          local r1_14 = MpCommon.StringRegExpSearch("(([.*]+)?(exe|dll|bat|ps1)$)", r1_9)
          if r1_14 then
            AppendToRollingQueue("gpo_broad_exclusion", string.lower(r1_9), true, 94608000, 100)
          end
        end
      end
    end
    if #r1_2 == 0 then
      return nil
    end
    return r1_2
  end
  return { error = r1_1 }
end

local function r0_4(p2_0)
  local r2_0 = sysio.GetFileSize(p2_0)
  if sysio.GetLastResult().Success then
    r2_0 = r2_0 > 65536 and 65536 or r2_0
    local r2_1 = sysio.ReadFile(p2_0, 0, r2_0)
    local r2_2 = sysio.GetLastResult()
    r2_2 = r2_2.Success
    if r2_2 then
      r2_2 = {}

      local function r2_3(p3_0, p3_1, p3_2)
        if p3_0 == "Properties"
          and p3_1.key
          and (p3_1.key:find("^SOFTWARE\\Microsoft\\Windows Defender\\")
            or p3_1.key:find("^SOFTWARE\\Policies\\Microsoft\\Windows Defender\\")) then
          local r3_0 = p3_1.value
          if p3_1.type == "REG_DWORD" then
            r3_0 = tonumber(p3_1.value, 16)
          end
          local r3_1 = r2_2
          local r3_2 = #r2_2 + 1
          local r3_3 = {}
          r3_3.key = p3_1.key
          local r3_4 = MpCommon.NormalizeString(p3_1.name, "CmdLineNormalizationStandard")
          r3_3.name = r3_4
          r3_3.value = r3_0
          r3_1[r3_2] = r3_3
          r3_1 = p3_1.key
          r3_2 = r3_1
          r3_1 = r3_2.find
          r3_3 = "Exclusions\\Paths"
          if r3_1(r3_2, r3_3) then
            local r3_5 = MpCommon.StringRegExpSearch("(c:?\\\\*\\*?%?$)", r3_0)
            if r3_5 then
              AppendToRollingQueue("gpo_broad_exclusion", string.lower(r3_0), true, 94608000, 100)
            end
          end
          r3_1 = p3_1.key
          r3_2 = r3_1
          r3_1 = r3_2.find
          if r3_1(r3_2, "Exclusions\\Extensions") then
            local r3_6 = MpCommon.StringRegExpSearch("(([.*]+)?(exe|dll|bat|ps1)$)", r3_0)
            if r3_6 then
              AppendToRollingQueue("gpo_broad_exclusion", string.lower(r3_0), true, 94608000, 100)
            end
          end
        end
      end

      local function r2_4()

      end

      local r2_5, r2_6 = pcall(parseXML, r2_1, r2_3, r2_4)
      if not r2_5 then
        r2_2.error = r2_6
      end
      if next(r2_2) then
        return r2_2
      end
      return nil
    end
    return nil
  end
  return nil
end

local function r0_5(p5_0)
  local r5_0 = sysio.GetFileSize(p5_0)
  if sysio.GetLastResult().Success then
    r5_0 = r5_0 > 65536 and 65536 or r5_0
    local r5_1 = sysio.ReadFile(p5_0, 0, r5_0)
    if sysio.GetLastResult().Success then
      local r5_2, r5_3, r5_4, r5_5, r5_6, r5_7, r5_8, r5_9, r5_10 = nil, nil, nil, nil, nil, nil, nil, nil, nil
      local r5_11 = {}
      local r5_12 = false

      local function r5_13()
        if not r5_9 then
          return
        end
        local r6_0 = string.format("%s %s", r5_9 or "", r5_10 or "")
        if r6_0 ~= "" then
          local r6_1 = string.lower(r6_0)
          local r6_2 = {
            "\\windowsdefenderatponboardingscript.cmd",
            "\\windowsdefenderatplocalonboardingscript.cmd",
            'schtasks /change /tn "\\microsoft\\windows\\diskcleanup\\silentcleanup" /disable',
            'schtasks /change /tn "\\microsoft\\windows\\certificateservicesclient\\aikcertenrolltask" /disable',
            "c:\\program files (x86)\\common files\\adobe\\arm\\1.0\\adobearm.exe",
            "c:\\windows\\syswow64\\macromed\\flash\\flashplayerupdateservice.exe",
            "\\vgregion.se\\ifr$\\scriptandexec\\ps1\\",
            "\\vgregion.se\\ifr$\\scriptandexec\\exec\\", "c:\\windows\\system32\\restartsms.ps1",
            "c:\\windows\\system32\\pgrvpnlogonactions_1_3.ps1"
          }
          for r6_3, r6_4 in ipairs(r6_2) do
            if string.find(r6_4, r6_1) then
              r5_12 = true
            end
          end
        end
        if not r5_12 then
          AppendToRollingQueue("gpo_schtasks", r6_0, r0_2, 946080000, 300, 0)
          local r6_5 = sysio.CommandLineScan(r6_0, 0)
          local r6_6, r6_7 = r5_6:match("^([^\\]+)\\([^\\]+)$")
          if not r6_6 then
            r6_6, r6_7 = "", r5_6
          end
          local r6_8 = r5_11
          local r6_9 = #r5_11 + 1
          local r6_10 = {}
          r6_10.task_uid = r5_3
          r6_10.task_name = r5_5
          r6_10.changed_time = r5_4
          local r6_11 = MpCommon.NormalizeString(r6_0, "CmdLineNormalizationStandard")
          r6_10.cmdline = r6_11
          r6_11 = r6_5 or false
          r6_10.scan_result = r6_11
          r6_10.working_directory = r5_8
            and MpCommon.NormalizeString(r5_8, "CmdLineNormalizationStandard")
            or ""
          local r6_12 = crypto.Sha1Buffer(r6_6, 0, #r6_6)
          r6_10.domain = r6_12
          r6_12 = crypto
          r6_12 = r6_12.Sha1Buffer
          r6_12 = r6_12(r6_7, 0, #r6_7)
          r6_10.user = r6_12
          r6_12 = r5_7
          r6_10.pass = not not r6_12
          r6_8[r6_9] = r6_10
        end
      end

      local function r5_14(p7_0, p7_1, p7_2)
        if p7_2 and p7_1 then
          error("unexpected text in tag with attributes")
        elseif r5_2 then
          if r5_2 == 1 then
            if p7_0 == "Properties" then
              r5_9 = p7_1.appName
              r5_10 = p7_1.args
              r5_5 = p7_1.name or ""
              r5_6 = p7_1.runAs or ""
              r5_7 = p7_1.cpassword or ""
              r5_8 = p7_1.startIn or ""
            end
          elseif r5_2 == 2 then
            if p7_0 == "Properties" then
              r5_5 = p7_1.name or ""
              r5_6 = p7_1.runAs or ""
              r5_7 = p7_1.cpassword or ""
            elseif p7_0 == "Command" then
              r5_9 = p7_2
            elseif p7_0 == "Arguments" then
              r5_10 = p7_2
            elseif p7_0 == "WorkingDirectory" then
              r5_8 = p7_2
            end
          end
        else
          if p7_0 == "Task" or p7_0 == "ImmediateTask" then
            r5_2 = 1
          elseif p7_0 == "TaskV2" or p7_0 == "ImmediateTaskV2" then
            r5_2 = 2
          end
          r5_3 = p7_1.uid or ""
          r5_4 = p7_1.changed or ""
        end
      end

      local function r5_15(p8_0)
        if not r5_2 then
          return
        end
        if r5_2 == 1 then
          if p8_0 == "Task" or p8_0 == "ImmediateTask" then
            r5_13()
            r5_9, r5_10 = nil, nil
            r5_2 = nil
            r5_3 = nil
            r5_4 = nil
            r5_5 = nil
            r5_6 = nil
            r5_7 = nil
            r5_8 = nil
          end
        elseif r5_2 == 2 then
          if p8_0 == "Exec" then
            r5_13()
            r5_9, r5_10 = nil, nil
            r5_8 = nil
          elseif p8_0 == "TaskV2" or p8_0 == "ImmediateTaskV2" then
            r5_2 = nil
            r5_3 = nil
            r5_4 = nil
            r5_5 = nil
            r5_6 = nil
            r5_7 = nil
          end
        end
      end

      if not pcall(parseXML, r5_1, r5_14, r5_15) then
        r5_11.error = true
      end
      if next(r5_11) then
        return r5_11
      end
      return nil
    end
    return nil
  end
  return nil
end

local r0_6 = {}
r0_6.machine = {
  preferences = {
    registry = r0_4(r0_1 .. "\\machine\\preferences\\registry\\registry.xml"),
    scheduledtasks = r0_5(r0_1 .. "\\machine\\preferences\\scheduledtasks\\scheduledtasks.xml")
  },
  registry = r0_3(r0_1 .. "\\machine\\registry.pol")
}
r0_6.user = {
  preferences = {
    registry = r0_4(r0_1 .. "\\user\\preferences\\registry\\registry.xml"),
    scheduledtasks = r0_5(r0_1 .. "\\user\\preferences\\scheduledtasks\\scheduledtasks.xml")
  },
  registry = r0_3(r0_1 .. "\\user\\registry.pol")
}
local r0_7 = next
local r0_8 = r0_6.machine.preferences
r0_7 = r0_7(r0_8)
if not r0_7
  and not r0_6.machine.registry
  and not next(r0_6.user.preferences)
  and not r0_6.user.registry then
  return mp.CLEAN
end
local r0_9 = crypto.Sha1Buffer(r0_2, 0, #r0_2)
local r0_10 = string.format("http://gpo.%s", r0_9)
local r0_11 = tonumber(mp.get_mpattributevalue("Lua:GPOVersion"))
local r0_12 = mp.bitand
r0_12 = r0_12(r0_11, 4294901760) / 65536
local r0_13 = mp.bitand(r0_11, 65535)
local r0_14 = {
  SIG_CONTEXT = "LUA_GENERIC", CONTENT_SOURCE = "GPO", TAG = "NOLOOKUP", GPO_USER_VERSION = r0_12,
  GPO_MACHINE_VERSION = r0_13
}
local r0_15 = safeJsonSerialize(r0_6)
r0_14.INFO = r0_15
r0_15 = pcall
local r0_16 = mp.GetUrlReputation
local r0_17 = {}
local r0_18 = r0_10
r0_17[1] = r0_18
r0_18 = r0_14
local r0_19, r0_20 = r0_15(r0_16, r0_17, r0_18)
if r0_19 then
  local r0_21 = r0_20.urls[1].determination
  if r0_21 == 4 then
    AppendToRollingQueue("gpo_block", r0_2, r0_11, 28800, 128)
    return mp.INFECTED
  end
end
AppendToRollingQueue("gpo_applied", r0_2, r0_11, 31536000, 128)
return mp.INFECTED
