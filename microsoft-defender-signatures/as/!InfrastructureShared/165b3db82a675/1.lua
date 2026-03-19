-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\165b3db82a675\1.luac 

-- params : ...
-- function num : 0
if not IsDeviceHVA() then
  return mp.CLEAN
end
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or not l_0_0.command_line then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.command_line or "")
local l_0_2 = (bm.get_imagepath)()
if isnull(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2)
local l_0_4 = {}
-- DECOMPILER ERROR at PC54: No list found for R4 , SetList fails

local l_0_5 = {}
-- DECOMPILER ERROR at PC56: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC58: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC59: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC60: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC61: Overwrote pending register: R7 in 'AssignReg'

for l_0_9,l_0_10 in ("\\windows defender\\")("\\microsoft monitoring agent\\") do
  -- DECOMPILER ERROR at PC64: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC67: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC68: Overwrote pending register: R14 in 'AssignReg'

  if (("\\saltstack\\").find)("\\sccm\\", "\\ccm\\", "\\dsc\\", true) then
    return mp.CLEAN
  end
end
for l_0_14,l_0_15 in ipairs(l_0_5) do
  if (string.find)(l_0_1, l_0_15, 1, true) then
    return mp.CLEAN
  end
end
local l_0_16 = false
local l_0_17 = "T1021.006"
local l_0_18 = ""
if (string.find)(l_0_3, "powershell", 1, true) or (string.find)(l_0_3, "pwsh", 1, true) then
  if (string.find)(l_0_1, "-encodedcommand", 1, true) or (string.find)(l_0_1, " -enc ", 1, true) or (string.find)(l_0_1, " -e ", 1, true) and (string.find)(l_0_1, "[A-Za-z0-9+/=]%s*$") then
    l_0_16 = true
    l_0_18 = "encoded_ps"
  else
    if (string.find)(l_0_1, "frombase64string", 1, true) then
      l_0_16 = true
      l_0_18 = "base64_decode"
    else
      if (string.find)(l_0_1, "downloadstring", 1, true) or (string.find)(l_0_1, "downloadfile", 1, true) or (string.find)(l_0_1, "invoke-webrequest", 1, true) or (string.find)(l_0_1, "start-bitstransfer", 1, true) or (string.find)(l_0_1, "new-object net.webclient", 1, true) or (string.find)(l_0_1, "invoke-restmethod", 1, true) then
        l_0_16 = true
        l_0_18 = "download_cradle"
        l_0_17 = "T1105"
      else
        if (string.find)(l_0_1, "invoke-expression", 1, true) or (string.find)(l_0_1, "iex(", 1, true) or (string.find)(l_0_1, "iex (", 1, true) then
          l_0_16 = true
          l_0_18 = "invoke_expression"
        else
          if (string.find)(l_0_1, "amsiutils", 1, true) or (string.find)(l_0_1, "amsiinitfailed", 1, true) or (string.find)(l_0_1, "amsicontext", 1, true) then
            l_0_16 = true
            l_0_18 = "amsi_bypass"
            l_0_17 = "T1562.001"
          else
            if (string.find)(l_0_1, "set-mppreference", 1, true) and (string.find)(l_0_1, "-disable", 1, true) then
              l_0_16 = true
              l_0_18 = "defender_disable"
              l_0_17 = "T1562.001"
            end
          end
        end
      end
    end
  end
end
if not l_0_16 then
  if (string.find)(l_0_3, "\\certutil.exe", 1, true) and ((string.find)(l_0_1, "-urlcache", 1, true) or (string.find)(l_0_1, "-decode", 1, true)) then
    l_0_16 = true
    l_0_18 = "certutil_download"
    l_0_17 = "T1105"
  else
    if (string.find)(l_0_3, "\\bitsadmin.exe", 1, true) and (string.find)(l_0_1, "/transfer", 1, true) then
      l_0_16 = true
      l_0_18 = "bitsadmin_transfer"
      l_0_17 = "T1105"
    else
      if (string.find)(l_0_3, "\\mshta.exe", 1, true) then
        l_0_16 = true
        l_0_18 = "mshta_exec"
        l_0_17 = "T1218.005"
      else
        if (string.find)(l_0_3, "\\regsvr32.exe", 1, true) and ((string.find)(l_0_1, "/i:", 1, true) or (string.find)(l_0_1, "scrobj", 1, true)) then
          l_0_16 = true
          l_0_18 = "regsvr32_lolbin"
          l_0_17 = "T1218.010"
        else
          if (string.find)(l_0_3, "\\rundll32.exe", 1, true) and ((string.find)(l_0_1, "javascript:", 1, true) or not (string.find)(l_0_1, "comsvcs", 1, true) or (string.find)(l_0_1, "minidump", 1, true)) then
            l_0_16 = true
            l_0_18 = "rundll32_abuse"
            l_0_17 = "T1218.011"
          else
            if ((string.find)(l_0_3, "\\wscript.exe", 1, true) or (string.find)(l_0_3, "\\cscript.exe", 1, true)) and ((string.find)(l_0_1, "\\temp\\", 1, true) or (string.find)(l_0_1, "\\appdata\\", 1, true) or (string.find)(l_0_1, "\\public\\", 1, true)) then
              l_0_16 = true
              l_0_18 = "scripthost_temp"
              l_0_17 = "T1059.005"
            end
          end
        end
      end
    end
  end
end
if not l_0_16 then
  if (string.find)(l_0_3, "\\ntdsutil.exe", 1, true) and ((string.find)(l_0_1, "ifm", 1, true) or (string.find)(l_0_1, "ac i ntds", 1, true)) then
    l_0_16 = true
    l_0_18 = "ntds_theft"
    l_0_17 = "T1003.003"
  else
    if (string.find)(l_0_1, "sekurlsa", 1, true) or (string.find)(l_0_1, "lsadump", 1, true) then
      l_0_16 = true
      l_0_18 = "mimikatz_pattern"
      l_0_17 = "T1003.001"
    else
      if (string.find)(l_0_3, "\\reg.exe", 1, true) and (string.find)(l_0_1, "save", 1, true) and ((string.find)(l_0_1, " sam", 1, true) or (string.find)(l_0_1, " security", 1, true) or (string.find)(l_0_1, " system", 1, true)) then
        l_0_16 = true
        l_0_18 = "reg_save_hive"
        l_0_17 = "T1003.002"
      end
    end
  end
end
if not l_0_16 then
  if (string.find)(l_0_3, "\\schtasks.exe", 1, true) and (string.find)(l_0_1, "/create", 1, true) then
    l_0_16 = true
    l_0_18 = "schtask_persist"
    l_0_17 = "T1053.005"
  else
    if (string.find)(l_0_3, "\\sc.exe", 1, true) and (string.find)(l_0_1, "create", 1, true) then
      l_0_16 = true
      l_0_18 = "service_create"
      l_0_17 = "T1543.003"
    else
      if (string.find)(l_0_3, "\\reg.exe", 1, true) and (string.find)(l_0_1, "add", 1, true) and ((string.find)(l_0_1, "\\run", 1, true) or (string.find)(l_0_1, "\\runonce", 1, true)) then
        l_0_16 = true
        l_0_18 = "reg_run_persist"
        l_0_17 = "T1547.001"
      else
        if (string.find)(l_0_3, "\\net.exe", 1, true) and (string.find)(l_0_1, "user", 1, true) and (string.find)(l_0_1, "/add", 1, true) then
          l_0_16 = true
          l_0_18 = "user_add"
          l_0_17 = "T1136.001"
        end
      end
    end
  end
end
if not l_0_16 then
  if (string.find)(l_0_3, "\\vssadmin.exe", 1, true) and (string.find)(l_0_1, "delete", 1, true) then
    l_0_16 = true
    l_0_18 = "shadow_delete"
    l_0_17 = "T1490"
  else
    if (string.find)(l_0_3, "\\wevtutil.exe", 1, true) and ((string.find)(l_0_1, " cl ", 1, true) or (string.find)(l_0_1, "clear-log", 1, true)) then
      l_0_16 = true
      l_0_18 = "log_clear"
      l_0_17 = "T1070.001"
    else
      if (string.find)(l_0_3, "\\bcdedit.exe", 1, true) and (string.find)(l_0_1, "recoveryenabled", 1, true) and (string.find)(l_0_1, "no", 1, true) then
        l_0_16 = true
        l_0_18 = "recovery_disable"
        l_0_17 = "T1490"
      end
    end
  end
end
if not l_0_16 then
  return mp.CLEAN
end
;
(bm.add_related_string)("WinRM_reason", l_0_18, bm.RelatedStringBMReport)
;
(bm.add_related_string)("WinRM_cmd", l_0_1, bm.RelatedStringBMReport)
;
(bm.add_related_string)("WinRM_img", l_0_3, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", l_0_17, "SuspWinRMChild")
add_parents()
return mp.INFECTED

