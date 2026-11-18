-- Threat: !InfrastructureShared
-- Name: 65b3e53b9579
-- Type: 21
-- Includes: LuaFuncHelper, TechniqueTracker

local l_0_0 = this_sigattrlog[1]
if not (l_0_0 ~= nil and l_0_0.matched) or l_0_0.utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1, l_0_2
l_0_1, l_0_2 = IsProcNameInParentProcessTree("BM", "svchost.exe")
if not l_0_1 or not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_0.utf8p2)
if l_0_3 == nil or #l_0_3 < 10 or 256 < #l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.match(l_0_3, "mshta%.exe.-(https?://[^%s%?%)%]%}%'\"&|<>;,]+)")
if l_0_4 == nil or #l_0_4 < 10 then
  return mp.CLEAN
end
local l_0_5 = {}
l_0_5.SIG_CONTEXT = "BM"
l_0_5.CONTENT_SOURCE = "CmdLine"
l_0_5.PROCESS_CONTEXT = "mshta.exe"
l_0_5.BREAK_AT_FIRST_HIT_MALWARE = "60"
l_0_5.FILELESS = "true"
l_0_5.CMDLINE_URL = "true"
l_0_5.SIG_REFERENCE = "Behavior:Win32/WalletThief.A"
l_0_5.CMDLINE_MATCH = l_0_3
local l_0_6 = CheckUrlReputationSimple({l_0_4}, l_0_5, 60)
if not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tasks"
local l_0_8 = "HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Schedule\\TaskCache\\Tree"
local l_0_9 = sysio.RegOpenKey(l_0_7)
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = sysio.RegEnumKeys(l_0_9)
if not l_0_10 then
  return mp.CLEAN
end
local l_0_11 = MpCommon.ExpandEnvironmentVariables("%windir%")
if l_0_11 == nil or l_0_11 == "" or l_0_11 == "%windir%" then
  return mp.CLEAN
end
local l_0_12 = false
local l_0_13 = 0
for l_0_14, l_0_15 in ipairs(l_0_10) do
  if l_0_13 < 8 and type(l_0_15) == "string" and string.match(l_0_15, "^%{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x%}$") then
    local l_0_16 = l_0_7 .. "\\" .. l_0_15
    local l_0_17 = sysio.RegOpenKey(l_0_16)
    if l_0_17 then
      local l_0_18 = sysio.GetRegValueAsString(l_0_17, "Path")
      local l_0_19 = sysio.GetRegValueAsBinary(l_0_17, "Actions")
      if type(l_0_18) == "string" and 1 < #l_0_18 and #l_0_18 <= 256 and string.sub(l_0_18, 1, 1) == "\\" and not string.find(l_0_18, "..\\", 1, true) and not string.find(l_0_18, "\\..", 1, true) and not string.find(l_0_18, "/", 1, true) and not string.find(l_0_18, ":", 1, true) and type(l_0_19) == "string" and 0 < #l_0_19 and #l_0_19 < 2048 then
        local l_0_20 = string.lower(string.gsub(l_0_19, "%z", ""))
        local l_0_21 = string.gsub(l_0_20, "%^", "")
        local l_0_22 = string.match(l_0_21, "mshta%.exe.-(https?://[^%s%?%)%]%}%'\"&|<>;,]+)")
        local l_0_24 = l_0_22 == l_0_4
        if not l_0_24 then
          l_0_22 = string.match(l_0_20, "powershell.exe.-(https?://[^%s%?%)%]%}%'\"&|<>;,]+)")
          l_0_24 = l_0_22 == l_0_4 and (string.find(l_0_20, "iex", 1, true) or string.find(l_0_20, "invoke-expression", 1, true) or string.find(l_0_20, "create", 1, true))
        end
        if l_0_24 then
          local l_0_25 = l_0_8 .. l_0_18
          local l_0_26 = sysio.RegOpenKey(l_0_25)
          local l_0_27
          if l_0_26 then
            l_0_27 = sysio.GetRegValueAsString(l_0_26, "Id")
          end
          if l_0_27 == l_0_15 then
            l_0_12 = true
            local l_0_28 = AppendToRollingQueue("WalletThief_Queue", "TasksKey", l_0_16, 300, 32, 0)
            l_0_28 = AppendToRollingQueue("WalletThief_Queue", "TreeKey", l_0_25, 300, 32, 0) and l_0_28
            local l_0_29 = l_0_11 .. "\\System32\\Tasks" .. l_0_18
            if sysio.IsFileExists(l_0_29) then
              l_0_28 = AppendToRollingQueue("WalletThief_Queue", "TaskFile", l_0_29, 300, 32, 0) and l_0_28
              if l_0_28 then
                bm.add_related_string("WtTaskFile", l_0_29, bm.RelatedStringBMReport)
              end
            end
            local l_0_30 = l_0_11 .. "\\Tasks" .. l_0_18 .. ".job"
            if sysio.IsFileExists(l_0_30) then
              l_0_28 = AppendToRollingQueue("WalletThief_Queue", "TaskFile", l_0_30, 300, 32, 0) and l_0_28
              if l_0_28 then
                bm.add_related_string("WtTaskFile", l_0_30, bm.RelatedStringBMReport)
              end
            end
            if l_0_28 then
              l_0_13 = l_0_13 + 1
              bm.add_related_string("WtTaskId", l_0_15, bm.RelatedStringBMReport)
              bm.add_related_string("WtTaskPath", l_0_18, bm.RelatedStringBMReport)
            end
          end
        end
      end
    end
  end
end
if not l_0_12 then
  return mp.CLEAN
end
bm.add_related_string("WtInfectedUrl", l_0_4, bm.RelatedStringBMReport)
bm.add_threat_process(l_0_2)
return mp.INFECTED
