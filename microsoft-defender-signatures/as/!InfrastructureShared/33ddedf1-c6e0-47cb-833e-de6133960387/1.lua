-- Threat: !InfrastructureShared
-- Name: 33ddedf1-c6e0-47cb-833e-de6133960387
-- Type: 25

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function GetRuleInfo()
  return {
    Name = "Block rebooting machine in Safe Mode",
    Description = "Windows Defender Exploit Guard detected system changes to reboot machine in Safe Mode",
    NotificationDedupingInterval = 120, NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end

function GetMonitoredLocations()
  return HIPS.MONITOR_PROCESSCREATE
end

function GetPathInclusions()
  return {
    ["%systemroot%\\system32\\bcdedit.exe"] = 2, ["%systemroot%\\syswow64\\bcdedit.exe"] = 2,
    ["%systemroot%\\system32\\bootcfg.exe"] = 2, ["%systemroot%\\syswow64\\bootcfg.exe"] = 2
  }
end

function GetCommandLineInclusions()
  local r4_0 = 'bootcfg(\\.exe)?[\\s\\"]+/raw\\s+/a\\s+/safeboot'
  local r4_1 = { [r4_0] = 0 }
  r4_1['bcdedit(\\.exe)?[\\s\\"]+(-noninteractive\\s+)?(/store\\s.+\\s)?(-|/)set\\s+(([^\\s]+\\s+)|(-encodedcommand\\s+[^\\s]+\\s+))?safeboot'] = 0
  return r4_1
end
