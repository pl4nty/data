-- Threat: !InfrastructureShared
-- Name: OldZbot
-- Type: 15
-- Includes: OldZbot

local l_0_0 = Remediation.Threat
if not l_0_0 or type(l_0_0.Name) ~= "string" then
  return
end
local l_0_1 = l_0_0.Name
if Infrastructure_OldZbotIsOneXThread(l_0_1) then
  MpCommon.SetGlobalMpAttribute("SYSCLEAN:Zbot_scan_begin")
end
if Infrastructure_OldZbotIsTwoXDetection(l_0_1) then
  MpCommon.SetGlobalMpAttribute("SYSCLEAN:Zbot_2x_scan_begin")
  if l_0_0.Active then
    Remediation.SetRebootRequired()
  end
end
if Infrastructure_OldZbotIsOneXCleanup(l_0_1) then
  local l_0_2 = {
    "bootlist32.exe",
    "bootwindows.exe",
    "intel32.exe",
    "lowsec.exe",
    "msupdt.exe",
    "nologon32.exe",
    "ntos.exe",
    "oembios.exe",
    "sdra64.exe",
    "twex.exe",
    "twext.exe",
    "twunk_32.exe",
    "unic128.exe",
    "userinit32.exe",
    "win32old.exe",
    "windows64.exe",
    "win32room.exe",
    "win32avs.exe",
    "word64main.exe"
  }
  local l_0_3 = Infrastructure_OldZbotExpandPaths("%systemroot%\\system32", false)
  local l_0_4 = Infrastructure_OldZbotExpandPaths("%appdata%", true)
  for l_0_5, l_0_6 in pairs(l_0_4) do
    l_0_3[#l_0_3 + 1] = l_0_6
  end
  for l_0_7, l_0_8 in pairs(l_0_3) do
    for l_0_9, l_0_10 in ipairs(l_0_2) do
      sysio.DeleteFile(l_0_8 .. "\\" .. l_0_10)
    end
  end
  if type(l_0_0.Resources) == "table" then
    for l_0_11, l_0_12 in pairs(l_0_0.Resources) do
      if l_0_12.Schema == "file" and type(l_0_12.Path) == "string" then
        sysio.DeleteFile(l_0_12.Path)
      end
    end
  end
elseif Infrastructure_OldZbotIsFullScanThreat(l_0_1) and type(l_0_0.RemovalPolicy) == "number" then
  Remediation.SetRemovalPolicy(crypto.bitor(l_0_0.RemovalPolicy, 4))
end
if Infrastructure_OldZbotIsTwoXThread(l_0_1) then
  local l_0_13 = Infrastructure_OldZbotGetTwoXCandidates()
  if next(l_0_13) then
    for l_0_14, l_0_15 in ipairs(l_0_13) do
      local l_0_16 = sysio.RegOpenKey(l_0_15.run_key_name)
      if l_0_16 then
        sysio.DeleteRegValue(l_0_16, l_0_15.value_name)
      end
    end
    local l_0_17 = sysio.RegOpenKey("HKLM\\SOFTWARE\\Microsoft\\RemovalTools")
    if l_0_17 then
      sysio.DeleteRegValue(l_0_17, "mpts")
    end
  end
end
