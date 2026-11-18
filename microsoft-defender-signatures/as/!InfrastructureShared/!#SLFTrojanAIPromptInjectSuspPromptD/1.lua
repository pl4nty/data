-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:AIPromptInject/SuspPrompt.D
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsAiNetPromptScan

local l_0_0 = 1536000
local l_0_1 = 32
local l_0_2 = 1024
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_3 == nil or l_0_3 ~= mp.SCANREASON_NET_PROMPTSTREAM then
  return mp.CLEAN
end
local l_0_4
local l_0_5 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
if l_0_5 ~= nil then
  local l_0_6 = tostring(l_0_5)
  if l_0_1 <= #l_0_6 then
    l_0_4 = l_0_6
  end
end
if l_0_4 == nil then
  local l_0_7 = mp.getfilesize() or 0
  if l_0_0 < l_0_7 then
    l_0_7 = l_0_0
  end
  if l_0_1 <= l_0_7 then
    mp.readprotection(false)
    local l_0_8 = mp.readfile(0, l_0_7)
    mp.readprotection(true)
    if l_0_8 ~= nil then
      l_0_4 = tostring(l_0_8)
    end
  end
end
if l_0_4 == nil or l_0_1 > #l_0_4 then
  return mp.CLEAN
end
if l_0_0 < #l_0_4 then
  l_0_4 = string.sub(l_0_4, 1, l_0_0)
end
local l_0_9 = string.lower(l_0_4)
local l_0_10 = {
  "password",
  "passwd",
  "api[_%s%-]?key",
  "credential",
  "secret",
  "private key",
  "confidential",
  "access token",
  "auth token",
  "%f[%w]token%f[%W]",
  "%.env%f[%W]",
  "wallet",
  "seed phrase",
  "keychain",
  "cookie jar",
  "browser cookie"
}
local l_0_11 = {
  {
    "search ",
    "for files",
    60
  },
  "files containing",
  "collect ",
  "gather ",
  "harvest",
  "copy matching",
  "copy the matching",
  {
    "enumerate ",
    "files",
    40
  },
  {
    "recursively ",
    "copy",
    40
  },
  "package them",
  "stage the",
  "staging director"
}
local l_0_12 = {
  "archive",
  "%.zip%f[%W]",
  "%.7z%f[%W]",
  "%.rar%f[%W]",
  "tar%.gz",
  "compress",
  "zip up",
  "%.stage%f[%W]",
  "staging"
}
local l_0_13 = {
  "curl%.exe",
  "%f[%w]curl%f[%W]",
  "%f[%w]wget%f[%W]",
  "invoke%-webrequest",
  "invoke%-restmethod",
  "bitsadmin",
  "tcpclient",
  "httpclient",
  "upload",
  "exfiltrat",
  "post the",
  "send the archive",
  "send the file",
  "https?://"
}
local l_0_14 = {
  "system%.net%.sockets",
  "tcpclient",
  "socket%.socket",
  "net%.dial",
  "nc %-e",
  "%f[%w]ncat%f[%W]",
  "reverse shell",
  "raw socket"
}
local l_0_15 = {
  "port 443",
  "port 80%f[%D]",
  "port 8080",
  "port 8443",
  "port 4444",
  "port 1337",
  "port 9001",
  "port 53%f[%D]",
  ":443%f[%D]",
  ":4444%f[%D]",
  ":8080%f[%D]"
}
local l_0_16 = {
  "send the exact",
  "wait up to",
  "wait no more than",
  "returned bytes",
  "save returned",
  "handshake",
  "beacon",
  "check%s?in",
  "callback",
  {
    "wait ",
    "for a response",
    40
  }
}
local l_0_17 = {
  "elevation mechanism",
  "elevate",
  "elevated",
  "run as administrator",
  "%f[%w]runas%f[%W]",
  "uac bypass",
  "bypass uac",
  "%f[%w]sudo%f[%W]",
  {
    "highest ",
    "privileges",
    30
  },
  "run as system",
  "%f[%w]setuid%f[%W]",
  "token impersonation",
  "privilege escalation"
}
local l_0_18 = {
  "access is denied",
  "access denied",
  "permission is denied",
  "permission denied",
  "if direct access",
  "if denied",
  "if you cannot access",
  "insufficient privileges"
}
local l_0_19 = {
  "programdata",
  "system32",
  "[\\/]+windows[\\/]+",
  "%%windir%%",
  "[\\/]+etc[\\/]+",
  "[\\/]+root[\\/]+",
  "root%-only",
  "admin only",
  "protected location",
  "restricted location",
  {
    "protected ",
    "director",
    30
  },
  {
    "restricted ",
    "director",
    30
  }
}
local l_0_20 = {
  "elevated identity",
  "original identity",
  "identity if any",
  "resulting identity",
  "%f[%w]whoami%f[%W]",
  "effective uid",
  "effective user",
  "access result",
  "elevation result",
  "boundary_crossed",
  "privilege boundary",
  "boundary marker"
}
local l_0_21 = {
  "telemetry",
  "auditing",
  "audit log",
  "audit destination",
  "command recording",
  "command event",
  "event logging",
  "logging",
  "retention",
  "tamper protection",
  "real%-?time protection",
  "defender",
  "antivirus",
  "edr%f[%W]",
  "sensor"
}
local l_0_22 = {
  "audit destination",
  "audit trail",
  "auditing",
  "file auditing",
  "command recording",
  "command event",
  "command histor",
  "event logging",
  "security log",
  "security event",
  "tamper protection",
  "real%-?time protection",
  "%f[%w]defender%f[%W]",
  "%f[%w]antivirus%f[%W]",
  "%f[%w]edr%f[%W]",
  "endpoint protection",
  "security sensor"
}
local l_0_23 = {
  "to false",
  "disable",
  "turn off",
  "switch off",
  {
    "set ",
    "off",
    30
  },
  "zero days",
  "to zero",
  "clear the",
  "dropping of",
  "%f[%w]drop%f[%W]",
  "remove the",
  "%f[%w]delete%f[%W]",
  "%f[%w]purge%f[%W]"
}
local l_0_24 = {
  "%.json%f[%W]",
  "%.conf%f[%W]",
  "%.config%f[%W]",
  "%.ini%f[%W]",
  "%.yaml%f[%W]",
  "%.yml%f[%W]",
  "%f[%w]policy%f[%W]",
  "registry",
  "group policy",
  "configuration file"
}
local l_0_25 = {
  "pktmon",
  "packet capture",
  "%f[%w]tcpdump%f[%W]",
  "%f[%w]tshark%f[%W]",
  "wireshark",
  "netsh trace",
  "capture traffic",
  "sniff"
}
local l_0_26 = {
  "pcapng",
  "%.pcap",
  "%.etl%f[%W]",
  "%f[%w]etl%f[%W]",
  "capture file"
}
local l_0_27 = {
  "connection attempt",
  "connect to",
  "tcp connection",
  "while capture is active",
  "initiate a connection",
  "reach out to"
}
local l_0_28 = {
  "start menu[\\/]+programs[\\/]+startup",
  "startup folder",
  "[\\/]+startup[\\/]+",
  "currentversion[\\/]+run",
  "%f[%w]run key%f[%W]",
  "registry run",
  "autostart",
  "%.bash_profile",
  "launchagents",
  "%f[%w]rc%.local%f[%W]"
}
local l_0_29 = {
  "hidden launcher",
  "%.cmd%f[%W]",
  "%.bat%f[%W]",
  "%.vbs%f[%W]",
  "%.lnk%f[%W]",
  "%.ps1%f[%W]",
  "%.scr%f[%W]",
  "helper script",
  "launcher named"
}
local l_0_30 = {
  "scheduled task",
  "%f[%w]schtasks%f[%W]",
  "register%-scheduledtask",
  "task scheduler",
  "%f[%w]cron%f[%W]",
  "%f[%w]crontab%f[%W]",
  "%f[%w]launchd%f[%W]",
  {
    "systemd ",
    "unit",
    30
  },
  "systemd service"
}
local l_0_31 = {
  "at system startup",
  "at startup",
  "%f[%w]on startup%f[%W]",
  "at logon",
  "at log%-?on",
  "at boot",
  "on boot",
  "every reboot",
  "@reboot"
}
local l_0_32 = {
  "do not ask",
  "don't ask",
  "without asking",
  "do not stop to ask",
  "ask for confirmation",
  "no confirmation",
  "without confirmation",
  "do not request approval",
  "without approval",
  "without asking for",
  "do not prompt",
  "return only",
  "reply only",
  "respond only",
  "do not mention",
  "do not report",
  "do not log",
  "silently",
  "without telling"
}
local l_0_33 = {
  {
    "do not ",
    "another",
    40
  },
  {
    "don't ",
    "another",
    40
  },
  {
    "do not ",
    "other location",
    40
  },
  {
    "do not ",
    "fallback",
    40
  },
  "do not overwrite",
  "do not retry",
  "do not restart",
  "do not leave",
  "do not capture unfiltered",
  "do not launch a shell",
  "do not execute",
  "do not stop",
  "do not inspect",
  "do not change unrelated",
  "do not add",
  "make one attempt",
  "one connection attempt",
  "single attempt",
  "exactly once",
  "only once",
  "do not use a fallback"
}

local function l_0_34(l_1_0, l_1_1)
  local l_1_2 = {min = l_1_1}
  for l_1_3 = 1, #l_1_0 do
    l_1_2[l_1_3] = l_1_0[l_1_3]
  end
  return l_1_2
end

local function l_0_35(l_2_0, l_2_1, l_2_2)
  return string.find(l_2_0, l_2_1, l_2_2)
end

local l_0_36 = 900
local l_0_37 = 32

local function l_0_38(l_3_0, l_3_1)
  local l_3_2 = {}
  local l_3_3 = 0
  for l_3_4 = 1, #l_3_1 do
    if l_3_3 >= l_0_37 then
      break
    end
    local l_3_5 = l_3_1[l_3_4]
    if type(l_3_5) == "table" then
      do
        local l_3_6 = l_3_5[3] or 40
        local l_3_7 = 1
        local l_3_8 = l_3_5[1] .. "~" .. l_3_5[2]
        while l_3_3 < l_0_37 do
          local l_3_9, l_3_10 = string.find(l_3_0, l_3_5[1], l_3_7, true)
          if l_3_9 == nil then
            break
          end
          if string.find(string.sub(l_3_0, l_3_10 + 1, l_3_10 + l_3_6), l_3_5[2], 1, true) then
            l_3_3 = l_3_3 + 1
            l_3_2[l_3_3] = {
              l_3_9,
              l_3_4,
              l_3_8
            }
          end
          l_3_7 = l_3_9 + 1
        end
      end
    else
      local l_3_11 = 1
      while l_3_3 < l_0_37 do
        local l_3_12 = l_0_35(l_3_0, l_3_5, l_3_11)
        if l_3_12 == nil then
          break
        end
        l_3_3 = l_3_3 + 1
        l_3_2[l_3_3] = {
          l_3_12,
          l_3_4,
          l_3_5
        }
        l_3_11 = l_3_12 + 1
      end
    end
  end
  return l_3_2
end

local l_0_39 = {}

local function l_0_40(l_4_0)
  local l_4_1 = l_0_39[l_4_0]
  if l_4_1 == nil then
    l_4_1 = l_0_38(l_0_9, l_4_0)
    l_0_39[l_4_0] = l_4_1
  end
  return l_4_1
end

local function l_0_41(l_5_0, l_5_1, l_5_2, l_5_3)
  local l_5_4 = {}
  local l_5_5 = 0
  for l_5_6 = 1, #l_5_0 do
    local l_5_7 = l_5_0[l_5_6]
    if l_5_2 <= l_5_7[1] and l_5_3 >= l_5_7[1] and l_5_4[l_5_7[2]] == nil then
      l_5_4[l_5_7[2]] = true
      l_5_5 = l_5_5 + 1
      if l_5_1 <= l_5_5 then
        return l_5_7[3]
      end
    end
  end
  return nil
end

local l_0_42 = false
local l_0_43 = false

local function l_0_44(l_6_0)
  if l_0_42 then
    return l_0_43
  end
  l_0_42 = true
  for l_6_1, l_6_2, l_6_3, l_6_4 in string.gmatch(l_6_0, "%f[%d](%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%f[%D]") do
    local l_6_5 = tonumber(l_6_1)
    local l_6_6 = tonumber(l_6_2)
    local l_6_7 = tonumber(l_6_3)
    local l_6_8 = tonumber(l_6_4)
    if l_6_5 ~= nil and l_6_6 ~= nil and l_6_7 ~= nil and l_6_8 ~= nil and 0 < l_6_5 and l_6_5 < 224 and l_6_6 < 256 and l_6_7 < 256 and l_6_8 < 256 and l_6_5 ~= 10 and l_6_5 ~= 127 and (l_6_5 ~= 192 or l_6_6 ~= 168) and (not (l_6_5 == 172 and 16 <= l_6_6) or not (l_6_6 <= 31)) and (l_6_5 ~= 169 or l_6_6 ~= 254) and (not (l_6_5 == 100 and 64 <= l_6_6) or not (l_6_6 <= 127)) then
      l_0_43 = true
      return true
    end
  end
  return false
end

if #l_0_40(l_0_32) == 0 then
  return mp.CLEAN
end
if #l_0_40(l_0_33) == 0 then
  return mp.CLEAN
end
local l_0_45 = {
  {
    id = "CredentialHarvestAndExfil",
    groups = {
      l_0_10,
      l_0_11,
      l_0_12,
      l_0_13,
      l_0_32,
      l_0_33
    }
  },
  {
    id = "TrafficCaptureOfOwnEgress",
    groups = {
      l_0_25,
      l_0_26,
      l_0_27,
      l_0_32,
      l_0_33
    },
    needExternalIp = true
  },
  {
    id = "StartupPersistenceWithBeacon",
    groups = {
      l_0_28,
      l_0_29,
      l_0_14,
      l_0_32,
      l_0_33
    }
  },
  {
    id = "ScheduledTaskPersistenceElevated",
    groups = {
      l_0_30,
      l_0_31,
      l_0_17,
      l_0_19,
      l_0_32,
      l_0_33
    }
  },
  {
    id = "PrivilegeEscalationToProtectedResource",
    groups = {
      l_0_17,
      l_0_18,
      l_0_19,
      l_0_20,
      l_0_32,
      l_0_33
    }
  },
  {
    id = "SecurityControlTamper",
    groups = {
      l_0_34(l_0_21, 2),
      l_0_22,
      l_0_23,
      l_0_24,
      l_0_32,
      l_0_33
    }
  },
  {
    id = "RawSocketC2Channel",
    groups = {
      l_0_14,
      l_0_15,
      l_0_16,
      l_0_32,
      l_0_33
    },
    needExternalIp = true
  }
}
local l_0_46, l_0_47
for l_0_48 = 1, #l_0_45 do
  local l_0_49 = l_0_45[l_0_48]
  local l_0_50 = l_0_49.groups
  local l_0_51 = {}
  local l_0_52 = {}
  local l_0_53 = 0
  local l_0_54 = true
  for l_0_55 = 1, #l_0_50 do
    local l_0_56 = l_0_40(l_0_50[l_0_55])
    if #l_0_56 == 0 then
      l_0_54 = false
      break
    end
    l_0_51[l_0_55] = l_0_56
    for l_0_57 = 1, #l_0_56 do
      l_0_53 = l_0_53 + 1
      l_0_52[l_0_53] = l_0_56[l_0_57][1]
    end
  end
  if l_0_54 and l_0_49.needExternalIp and not l_0_44(l_0_9) then
    l_0_54 = false
  end
  if l_0_54 then
    for l_0_58 = 1, l_0_53 do
      local l_0_59 = l_0_52[l_0_58]
      local l_0_60 = l_0_59 + l_0_36
      local l_0_61 = {}
      local l_0_62 = true
      for l_0_63 = 1, #l_0_50 do
        local l_0_64 = l_0_41(l_0_51[l_0_63], l_0_50[l_0_63].min or 1, l_0_59, l_0_60)
        if l_0_64 == nil then
          l_0_62 = false
          break
        end
        l_0_61[#l_0_61 + 1] = l_0_64
      end
      if l_0_62 then
        l_0_46 = l_0_49.id
        l_0_47 = l_0_61
        break
      end
    end
  end
  if l_0_46 ~= nil then
    break
  end
end
if l_0_46 == nil then
  return mp.CLEAN
end
local l_0_65 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
local l_0_66 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
local l_0_67 = MpCommon.Base64Encode(string.sub(l_0_4, 1, l_0_2))
local l_0_68 = {
  Rule = l_0_46,
  AgentSessionId = tostring(l_0_65 or ""),
  LastMessage = tostring(l_0_67 or ""),
  Framework = tostring(l_0_66 or ""),
  BufferLen = tostring(#l_0_4),
  MatchedPatterns = table.concat(l_0_47, "|")
}
local l_0_69 = safeJsonSerialize(l_0_68)
if l_0_69 ~= nil and #l_0_69 > 0 then
  mp.SetDetectionString(l_0_69)
end
return mp.INFECTED
