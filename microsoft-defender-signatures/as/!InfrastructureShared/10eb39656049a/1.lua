-- Threat: !InfrastructureShared
-- Name: 10eb39656049a
-- Type: 21
-- Includes: WinRMSessionInfra, BMLuaLib, TechniqueTracker

if (this_sigattrlog[2] == nil or not this_sigattrlog[2].matched) and (this_sigattrlog[3] == nil or not this_sigattrlog[3].matched) and (this_sigattrlog[4] == nil or not this_sigattrlog[4].matched) and not IsWinRMSessionForPpid("BM", nil, nil) and not IsWinRMSessionFoundInParents("BM", nil, 4, nil) then
  return mp.CLEAN
end
local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = string.lower(l_0_0.command_line or "")
local l_0_2 = bm.get_imagepath()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
local l_0_4 = {
  "\\conhost.exe",
  "\\windows defender\\",
  "\\microsoft monitoring agent\\",
  "\\ansible\\",
  "\\chef\\",
  "\\puppet\\",
  "\\saltstack\\",
  "\\sccm\\",
  "\\ccm\\",
  "\\dsc\\"
}
local l_0_5 = {
  "get-mpcomputerstatus",
  "invoke-command -session",
  "test-wsman"
}
for l_0_6, l_0_7 in ipairs(l_0_4) do
  if string.find(l_0_3, l_0_7, 1, true) then
    return mp.CLEAN
  end
end
for l_0_8, l_0_9 in ipairs(l_0_5) do
  if string.find(l_0_1, l_0_9, 1, true) then
    return mp.CLEAN
  end
end
local l_0_10 = false
local l_0_11 = "T1021.006"
local l_0_12 = ""
if string.find(l_0_3, "powershell", 1, true) or string.find(l_0_3, "pwsh", 1, true) then
  if string.find(l_0_1, "-encodedcommand", 1, true) or string.find(l_0_1, " -enc ", 1, true) or string.find(l_0_1, " -e ", 1, true) and string.find(l_0_1, "[A-Za-z0-9+/=]%s*$") then
    local l_0_13 = string.match(l_0_1, "%-e%a*%s+([A-Za-z0-9+/=]+)%s*$")
    if l_0_13 and 20 < #l_0_13 then
      local l_0_14, l_0_15 = pcall(MpCommon.Base64Decode, l_0_13)
      if l_0_14 and l_0_15 then
        local l_0_16, l_0_17 = pcall(mp.utf16to8, l_0_15)
        if l_0_16 and l_0_17 then
          local l_0_18 = string.lower(l_0_17)
          local l_0_19 = {
            "invoke-mimikatz",
            "sekurlsa",
            "lsadump",
            "invoke-kerberoast",
            "invoke-bloodhound",
            "sharphound",
            "rubeus",
            "safetykatz",
            "sharpkatz",
            "downloadstring",
            "downloadfile",
            "net.webclient",
            "invoke-webrequest",
            "start-bitstransfer",
            "invoke-restmethod",
            "bitstransfer",
            "invoke-expression",
            "iex(",
            "iex (",
            "invoke-shellcode",
            "invoke-dllinjection",
            "new-object io.memorystream",
            "virtualalloc",
            "createthread",
            "reflection.assembly",
            "amsiutils",
            "amsiinitfailed",
            "amsicontext",
            "set-mppreference",
            "add-mppreference",
            "disablerealtimemonitoring",
            "clear-eventlog",
            "remove-eventlog",
            "vssadmin delete",
            "wevtutil cl",
            "system.net.sockets",
            "nishang",
            "powercat",
            "invoke-powershelltcp"
          }
          for l_0_20, l_0_21 in ipairs(l_0_19) do
            if string.find(l_0_18, l_0_21, 1, true) then
              l_0_10 = true
              l_0_12 = "encoded_ps"
              break
            end
          end
        end
      elseif 500 < #l_0_13 then
        l_0_10 = true
        l_0_12 = "encoded_ps_undecoded"
      end
    end
  elseif string.find(l_0_1, "frombase64string", 1, true) then
    l_0_10 = true
    l_0_12 = "base64_decode"
  elseif string.find(l_0_1, "downloadstring", 1, true) or string.find(l_0_1, "downloadfile", 1, true) or string.find(l_0_1, "invoke-webrequest", 1, true) or string.find(l_0_1, "start-bitstransfer", 1, true) or string.find(l_0_1, "new-object net.webclient", 1, true) or string.find(l_0_1, "invoke-restmethod", 1, true) then
    l_0_10 = true
    l_0_12 = "download_cradle"
    l_0_11 = "T1105"
    if string.find(l_0_1, "169.254.169.254", 1, true) or string.find(l_0_1, "metadata.google", 1, true) or string.find(l_0_1, "metadata.azure", 1, true) then
      l_0_10 = false
      l_0_12 = ""
    end
  elseif string.find(l_0_1, "invoke-expression", 1, true) or string.find(l_0_1, "iex(", 1, true) or string.find(l_0_1, "iex (", 1, true) then
    l_0_10 = true
    l_0_12 = "invoke_expression"
  elseif string.find(l_0_1, "amsiutils", 1, true) or string.find(l_0_1, "amsiinitfailed", 1, true) or string.find(l_0_1, "amsicontext", 1, true) then
    l_0_10 = true
    l_0_12 = "amsi_bypass"
    l_0_11 = "T1562.001"
  elseif string.find(l_0_1, "set-mppreference", 1, true) and string.find(l_0_1, "-disable", 1, true) then
    l_0_10 = true
    l_0_12 = "defender_disable"
    l_0_11 = "T1562.001"
  end
end
if not l_0_10 then
  if string.find(l_0_3, "\\certutil.exe", 1, true) and (string.find(l_0_1, "-urlcache", 1, true) or string.find(l_0_1, "-decode", 1, true)) then
    l_0_10 = true
    l_0_12 = "certutil_download"
    l_0_11 = "T1105"
  elseif string.find(l_0_3, "\\bitsadmin.exe", 1, true) and string.find(l_0_1, "/transfer", 1, true) then
    l_0_10 = true
    l_0_12 = "bitsadmin_transfer"
    l_0_11 = "T1105"
  elseif string.find(l_0_3, "\\mshta.exe", 1, true) then
    l_0_10 = true
    l_0_12 = "mshta_exec"
    l_0_11 = "T1218.005"
  elseif string.find(l_0_3, "\\regsvr32.exe", 1, true) and (string.find(l_0_1, "/i:", 1, true) or string.find(l_0_1, "scrobj", 1, true)) then
    l_0_10 = true
    l_0_12 = "regsvr32_lolbin"
    l_0_11 = "T1218.010"
  elseif string.find(l_0_3, "\\rundll32.exe", 1, true) and (string.find(l_0_1, "javascript:", 1, true) or string.find(l_0_1, "comsvcs", 1, true) and string.find(l_0_1, "minidump", 1, true)) then
    l_0_10 = true
    l_0_12 = "rundll32_abuse"
    l_0_11 = "T1218.011"
  elseif (string.find(l_0_3, "\\wscript.exe", 1, true) or string.find(l_0_3, "\\cscript.exe", 1, true)) and (string.find(l_0_1, "\\temp\\", 1, true) or string.find(l_0_1, "\\appdata\\", 1, true) or string.find(l_0_1, "\\public\\", 1, true)) then
    l_0_10 = true
    l_0_12 = "scripthost_temp"
    l_0_11 = "T1059.005"
  end
end
if not l_0_10 then
  if string.find(l_0_3, "\\ntdsutil.exe", 1, true) and (string.find(l_0_1, "ifm", 1, true) or string.find(l_0_1, "ac i ntds", 1, true)) then
    l_0_10 = true
    l_0_12 = "ntds_theft"
    l_0_11 = "T1003.003"
  elseif string.find(l_0_1, "sekurlsa", 1, true) or string.find(l_0_1, "lsadump", 1, true) then
    l_0_10 = true
    l_0_12 = "mimikatz_pattern"
    l_0_11 = "T1003.001"
  elseif string.find(l_0_3, "\\reg.exe", 1, true) and string.find(l_0_1, "save", 1, true) and (string.find(l_0_1, " sam", 1, true) or string.find(l_0_1, " security", 1, true) or string.find(l_0_1, " system", 1, true)) then
    l_0_10 = true
    l_0_12 = "reg_save_hive"
    l_0_11 = "T1003.002"
  end
end
if not l_0_10 then
  if string.find(l_0_3, "\\schtasks.exe", 1, true) and string.find(l_0_1, "/create", 1, true) then
    l_0_10 = true
    l_0_12 = "schtask_persist"
    l_0_11 = "T1053.005"
  elseif string.find(l_0_3, "\\sc.exe", 1, true) and string.find(l_0_1, "create", 1, true) then
    l_0_10 = true
    l_0_12 = "service_create"
    l_0_11 = "T1543.003"
  elseif string.find(l_0_3, "\\reg.exe", 1, true) and string.find(l_0_1, "add", 1, true) and (string.find(l_0_1, "\\run", 1, true) or string.find(l_0_1, "\\runonce", 1, true)) then
    l_0_10 = true
    l_0_12 = "reg_run_persist"
    l_0_11 = "T1547.001"
  elseif string.find(l_0_3, "\\net.exe", 1, true) and string.find(l_0_1, "user", 1, true) and string.find(l_0_1, "/add", 1, true) then
    l_0_10 = true
    l_0_12 = "user_add"
    l_0_11 = "T1136.001"
  end
end
if not l_0_10 then
  if string.find(l_0_3, "\\vssadmin.exe", 1, true) and string.find(l_0_1, "delete", 1, true) then
    l_0_10 = true
    l_0_12 = "shadow_delete"
    l_0_11 = "T1490"
  elseif string.find(l_0_3, "\\wevtutil.exe", 1, true) and (string.find(l_0_1, " cl ", 1, true) or string.find(l_0_1, "clear-log", 1, true)) then
    l_0_10 = true
    l_0_12 = "log_clear"
    l_0_11 = "T1070.001"
  elseif string.find(l_0_3, "\\bcdedit.exe", 1, true) and string.find(l_0_1, "recoveryenabled", 1, true) and string.find(l_0_1, "no", 1, true) then
    l_0_10 = true
    l_0_12 = "recovery_disable"
    l_0_11 = "T1490"
  end
end
if not l_0_10 then
  return mp.CLEAN
end
bm.add_related_string("WinRM_reason", l_0_12, bm.RelatedStringBMReport)
bm.add_related_string("WinRM_cmd", l_0_1, bm.RelatedStringBMReport)
bm.add_related_string("WinRM_img", l_0_3, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", l_0_11, "WinRMChild")
add_parents()
return mp.INFECTED
