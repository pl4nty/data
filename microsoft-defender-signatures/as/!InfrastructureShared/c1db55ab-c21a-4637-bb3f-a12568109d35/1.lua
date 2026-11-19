-- Threat: !InfrastructureShared
-- Name: c1db55ab-c21a-4637-bb3f-a12568109d35
-- Type: 25

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function GetRuleInfo()
  return {
    Name = "Use advanced protection against ransomware",
    Description = "Windows Defender Exploit Guard detected execution of file that exhibit characteristics similar to ransomware",
    NotificationDedupingInterval = 120, NotificationDedupingScope = HIPS.DEDUPE_SCOPE_UI
  }
end

function GetMonitoredLocations()
  return HIPS.MONITOR_PROCESSCREATE
end

function GetPathInclusions()
  local r3_0 = {
    ["%systemroot%\\system32\\vssadmin.exe"] = 2, ["%systemroot%\\system32\\wbem\\wmic.exe"] = 2,
    ["%systemroot%\\syswow64\\wbem\\wmic.exe"] = 2, ["%systemroot%\\syswow64\\vssadmin.exe"] = 2
  }
  r3_0["%systemroot%\\system32\\windowspowershell\\*\\powershell.exe"] = 2
  r3_0["%systemroot%\\syswow64\\windowspowershell\\*\\powershell.exe"] = 2
  return r3_0
end

function GetCommandLineInclusions()
  local r4_0, r4_1 = 'vssadmin(\\.exe)?[\\s\\"]+delete\\s+shadows', 'wmic(\\.exe)?[\\s\\"]+shadowcopy\\s+delete'
  local r4_2 = { [r4_0] = 0, [r4_1] = 0 }
  r4_2['powershell(.exe)?\\"?\\s+.*\\"?get-wmiobject\\s+win32_shadowcopy\\s*\\|\\s*remove-wmiobject\\s*\\"?'] = 0
  r4_2['vssadmin(\\.exe)?[\\s\\"]+resize\\s+shadowstorage\\s+.+?/maxsize=[0]+(((g|m)b)|%)'] = 0
  return r4_2
end
