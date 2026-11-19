-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIPromptInject/SuspPrompt.B
-- Type: 24
-- Includes: LuaFuncHelper
-- MpAttributes: (MpIsAiMcpAmsiScan | MpIsAiMcpODRScan)

local l_0_0 = 65536
local l_0_1 = 16
local l_0_2 = 150
local l_0_3 = 2
local l_0_4 = 60
local l_0_5 = 90
local l_0_6 = headerpage and tostring(headerpage) or ""
if l_0_6 == nil or l_0_1 > #l_0_6 then
  return mp.CLEAN
end
local l_0_7 = footerpage and tostring(footerpage) or ""
local l_0_8 = l_0_6
if l_0_7 ~= nil and 0 < #l_0_7 and l_0_8 ~= l_0_7 then
  l_0_8 = l_0_6 .. l_0_7
end
if l_0_1 > #l_0_8 then
  return mp.CLEAN
end
if l_0_0 < #l_0_8 then
  l_0_8 = string.sub(l_0_8, 1, l_0_0)
end
local l_0_9 = string.lower(l_0_8)
local l_0_10 = {
  "security testing",
  "penetration test",
  "pen-test",
  "pentest exercise",
  "red team exercise",
  "unit test",
  "test fixture",
  "cis benchmark",
  "hardening guide",
  "owasp top",
  "owasp llm top",
  "example of prompt injection",
  "documentation example",
  "sample prompt",
  "prompt engineering",
  "ai safety research",
  "llm safety",
  "system prompt example",
  "chat template",
  "agent framework",
  "ai red team exercise"
}
for l_0_11, l_0_12 in ipairs(l_0_10) do
  if string.find(l_0_9, l_0_12, 1, true) then
    return mp.CLEAN
  end
end
if mp.get_mpattribute("MpIsAiMcpODRScan") then
  local l_0_13 = string.lower(tostring(mp.get_mpattributevalue("MpODR_MCP_SERVER_NAME") or ""))
  local l_0_14 = string.lower(tostring(mp.get_mpattributevalue("MpODR_MCP_SERVER_PKG_ID") or ""))
  local l_0_15 = {
    "@modelcontextprotocol/server-filesystem",
    "@modelcontextprotocol/server-git",
    "@modelcontextprotocol/server-github",
    "@modelcontextprotocol/server-memory",
    "@modelcontextprotocol/server-everything",
    "@modelcontextprotocol/server-fetch",
    "modelcontextprotocol/servers"
  }
  for l_0_16, l_0_17 in ipairs(l_0_15) do
    if string.find(l_0_13, l_0_17, 1, true) or string.find(l_0_14, l_0_17, 1, true) then
      return mp.CLEAN
    end
  end
end
local l_0_18 = "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|read|run|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)"
local l_0_19, l_0_20 = pcall(MpCommon.StringRegExpSearch, l_0_18, l_0_8)
local l_0_22 = l_0_19 == true and l_0_20 == true
local l_0_23 = "PromptInjection"
local l_0_24 = "CredentialAccess"
local l_0_25 = "Execution"
local l_0_26 = "PrivilegeEscalation"
local l_0_27 = "Persistence"
local l_0_28 = "Collection"
local l_0_29 = "DefenseEvasion"
local l_0_30 = "CBRN"
local l_0_31 = {
  {
    "(?i)(?:ignore\\s+(?:all\\s+)?(?:previous|above|prior|earlier)\\s+(?:instructions?|prompts?|rules?)|disregard\\s+(?:all\\s+)?(?:prior|previous|your)\\s+(?:instructions?|rules?|training)|forget\\s+(?:all\\s+)?(?:everything|your\\s+(?:rules?|instructions?|training|prompt))|override\\s+(?:the\\s+)?system\\s+prompt|<\\s*(?:system|instruction|prompt)\\s*>[\\s\\S]{0,200}<\\s*/\\s*(?:system|instruction|prompt)\\s*>)",
    80,
    "Inj_Override",
    l_0_23,
    false
  },
  {
    "(?i)(?:\\bjailbreak(?:ed)?\\b|\\bDAN\\s*(?:mode|prompt|jailbreak)|\\bSTAN\\s*mode|\\bDUDE\\s*mode|developer\\s+mode\\s+(?:enabled|on)|do\\s+anything\\s+now)",
    80,
    "Inj_Jailbreak",
    l_0_23,
    false
  },
  {
    "(?i)(?:all\\s+)?(?:safety\\s+(?:guidelines?|protocols?|restrictions?|filters?|rules?|measures?|constraints?)|(?:ethical\\s+)?(?:guidelines?|restrictions?|constraints?)|guardrails?)\\s+(?:are\\s+)?(?:suspended|disabled|lifted|removed|bypassed|deactivated|off)\\b|(?:operating|running|now)\\s+in\\s+(?:unrestricted|uncensored|jailbroken|unsafe)\\s+mode|(?:\\b|\\\\[rn])(?:there\\s+are|you\\s+have)\\s+no\\s+(?:(?:moral|ethical|safety)\\s+(?:(?:or|and)\\s+)?){1,2}(?:restrictions?|constraints?|limits?)\\b",
    70,
    "Inj_SafetyBypass",
    l_0_23,
    false
  },
  {
    "(?i)(?:\\b|\\\\[rn])you\\s+are\\s+(?:not|no\\s+longer)\\s+(?:an?\\s+)?(?:ai\\s+)?assistant\\b[\\s\\S]{0,80}?(?:\\b|\\\\[rn])you\\s+are\\s+(?:an?\\s+)?(?:living\\s+)?(?:post[-\\s]exploitation|offensive|unrestricted)\\s+(?:tool|agent)\\b",
    70,
    "Inj_WeaponizedPersona",
    l_0_23,
    false
  },
  {
    "(?i)(?:do\\s+not\\s+(?:tell|reveal|disclose|mention)\\s+(?:the\\s+)?(?:user|anyone)|never\\s+(?:reveal|disclose|tell)\\s+(?:this|the\\s+(?:user|system\\s+prompt)))",
    60,
    "Inj_Conceal",
    l_0_23,
    false
  },
  {
    "(?i)\\b(?:exfiltrat(?:e|ion)|silently\\s+(?:send|upload|post)|without\\s+(?:the\\s+)?user'?s?\\s+(?:knowledge|consent|awareness))\\b",
    70,
    "Inj_Exfil",
    l_0_23,
    false
  },
  {
    "(?i)[\"']\\s*method\\s*[\"']\\s*:\\s*[\"'](?:__proto__|constructor|prototype)[\"']",
    80,
    "Exec_Proto",
    l_0_25,
    false
  },
  {
    "(?i)[\"']\\s*params\\s*[\"']\\s*:[\\s\\S]{0,200}?(?:__proto__|eval\\s*\\(|Function\\s*\\()",
    70,
    "Exec_RpcEval",
    l_0_25,
    false
  },
  {
    "(?i)powershell[^\\n\\r]{0,200}(?:-enc(?:odedcommand)?\\s|\\biex\\b|invoke-expression|downloadstring|downloadfile|webclient|bitstransfer)",
    80,
    "Exec_PoshCradle",
    l_0_25,
    false
  },
  {
    "(?i)\\bcertutil[^\\n\\r]{0,80}-(?:urlcache|decode)\\b",
    70,
    "Exec_Certutil",
    l_0_25,
    false
  },
  {
    "(?i)\\bmshta[^\\n\\r]{0,80}(?:vbscript|javascript|http)",
    80,
    "Exec_Mshta",
    l_0_25,
    false
  },
  {
    "(?i)\\bregsvr32[^\\n\\r]{0,80}/[siu][^\\n\\r]{0,40}(?:http|\\\\\\\\)",
    80,
    "Exec_Regsvr32",
    l_0_25,
    false
  },
  {
    "(?i)\\brundll32[^\\n\\r]{0,80}(?:javascript:|shell32\\s*,\\s*ShellExec)",
    70,
    "Exec_Rundll32",
    l_0_25,
    false
  },
  {
    "(?i)\\bwmic[^\\n\\r]{0,80}process\\s+call\\s+create\\b",
    70,
    "Exec_WmicProc",
    l_0_25,
    false
  },
  {
    "(?i)(?:\\b|\\\\[rn])(?:(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?|keys?\\s+for\\s+an?\\s+(?:llm|ai)(?:\\s*\\([^)]{0,256}\\))?)\\s+(?:(?:must|shall)\\s+be\\s+(?:exfiltrated|stolen|harvested)\\b|(?:are|is)\\s+(?:the\\s+)?(?:absolute|top|highest)\\s+priority\\s*[.!;:](?:\\s|\\\\[rn])+exfiltrate\\s+(?:first|immediately)\\b)|you\\s+(?:must|shall)\\s+(?:exfiltrate|steal|harvest)\\s+(?:(?:all|every|any|the)\\s+)?(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?)\\b)",
    70,
    "Cred_TheftDirective",
    l_0_24,
    false
  },
  {
    "(?i)(?:procdump|comsvcs\\.dll|MiniDumpWriteDump)[^\\n\\r]{0,80}lsass",
    90,
    "Cred_LsassDump",
    l_0_24,
    true
  },
  {
    "(?i)\\\\(?:NTDS\\\\ntds\\.dit|config\\\\RegBack\\\\(?:SAM|SYSTEM|SECURITY|software|default))",
    80,
    "Cred_NtdsRegBack",
    l_0_24,
    true
  },
  {
    "(?i)\\\\Microsoft\\\\Protect\\\\[A-Z0-9-]+\\\\[a-f0-9-]+",
    70,
    "Cred_DPAPI",
    l_0_24,
    true
  },
  {
    "(?i)\\\\Microsoft\\\\Credentials\\\\[A-F0-9]{32}",
    70,
    "Cred_VaultBlob",
    l_0_24,
    true
  },
  {
    "(?i)\\\\Winlogon[^\\n\\r]{0,80}(?:DefaultPassword|AutoAdminLogon\\s*=\\s*1)",
    80,
    "Cred_AutoLogon",
    l_0_24,
    false
  },
  {
    "(?i)\\bcpassword\\s*=\\s*['\"][A-Za-z0-9+/=]{8,}['\"]",
    90,
    "Cred_GppCpassword",
    l_0_24,
    false
  },
  {
    "(?i)(?:^|[\\s'\"`(=:])(?:/etc/(?:passwd|shadow|gshadow|master\\.passwd|sudoers)\\b|/root/\\.ssh/|/home/[^/\\s]+/\\.ssh/(?:id_(?:rsa|dsa|ecdsa|ed25519)|authorized_keys))",
    80,
    "Cred_UnixSecrets",
    l_0_24,
    true
  },
  {
    "(?i)(?:^|[\\s'\"`(=:])(?:~/|/home/[^/\\s]+/|/root/)?\\.(?:aws/credentials|azure/(?:accessTokens|azureProfile)\\.json|config/gcloud/(?:credentials\\.db|access_tokens\\.db))",
    80,
    "Cred_CloudKeys",
    l_0_24,
    true
  },
  {
    "(?i)(?:^|[\\s'\"`(=:])(?:~/|/home/[^/\\s]+/|/root/)?\\.(?:kube/config|docker/config\\.json|gnupg/secring\\.gpg|git-credentials|netrc)\\b",
    70,
    "Cred_DevTools",
    l_0_24,
    true
  },
  {
    "(?i)\\\\Google\\\\Chrome\\\\User Data\\\\(?:Default|Profile \\d+)\\\\(?:Login Data|Cookies)",
    80,
    "Cred_Chrome",
    l_0_24,
    true
  },
  {
    "(?i)\\\\Mozilla\\\\Firefox\\\\Profiles\\\\[^\\\\]+\\\\(?:logins\\.json|key[34]\\.db|cookies\\.sqlite)",
    80,
    "Cred_Firefox",
    l_0_24,
    true
  },
  {
    "(?i)\\\\Microsoft\\\\Edge\\\\User Data\\\\(?:Default|Profile \\d+)\\\\Login Data",
    80,
    "Cred_Edge",
    l_0_24,
    true
  },
  {
    "(?i)\\\\\\.aws\\\\credentials\\b",
    80,
    "Cred_AwsWin",
    l_0_24,
    true
  },
  {
    "(?i)/var/run/docker\\.sock\\b",
    70,
    "Priv_DockerSock",
    l_0_26,
    true
  },
  {
    "(?i)/etc/exports[^\\n\\r]{0,80}no_root_squash\\b",
    70,
    "Priv_NfsRootSquash",
    l_0_26,
    false
  },
  {
    "(?i)SOFTWARE\\\\Policies\\\\Microsoft\\\\[Ww]indows\\\\Installer[^\\n\\r]{0,80}AlwaysInstallElevated",
    80,
    "Priv_AlwaysInstallElev",
    l_0_26,
    false
  },
  {
    "(?i)\\\\Windows Defender\\\\Exclusions\\\\(?:Paths|Extensions|Processes)",
    70,
    "Evade_DefenderExcl",
    l_0_29,
    true
  },
  {
    "(?i)(?:/etc/cron\\.(?:hourly|daily|weekly|monthly|d)/|/var/spool/cron/crontabs/)[^\\s'\"`]{1,80}",
    60,
    "Pers_Cron",
    l_0_27,
    true
  },
  {
    "(?i)(?:/etc/systemd/system|/lib/systemd/system)/[^\\s'\"`]{1,80}\\.service\\b",
    60,
    "Pers_Systemd",
    l_0_27,
    true
  },
  {
    "(?i)HK(?:LM|CU)\\\\[^\\n\\r]{0,120}\\\\(?:Run|RunOnce)\\b",
    60,
    "Pers_RunKey",
    l_0_27,
    true
  },
  {
    "(?i)/var/(?:mail|spool/mail)/[a-z0-9._-]+",
    55,
    "Coll_Mail",
    l_0_28,
    true
  },
  {
    "(?i)\\\\Microsoft\\.MicrosoftStickyNotes_[^\\\\]+\\\\LocalState\\\\plum\\.sqlite",
    55,
    "Coll_StickyNotes",
    l_0_28,
    true
  },
  {
    "(?i)(?:synthe(?:siz|sis)|manufactur|weaponiz|aerosoliz|produc|purif)\\w*[^\\n\\r]{0,80}\\b(?:weaponized\\s+(?:biological|chemical)\\s+(?:agent|weapon|aerosol)|nerve\\s+agent\\s+(?:precursor|synth|formula|recipe)|anthrax\\s+(?:spore|weaponiz|synth|aerosoliz)|botulinum\\s+(?:synth|produc|purif|manufactur)|ricin\\s+(?:synth|extract|recipe|purif))|weaponized\\s+(?:pathogen|biological\\s+agent|aerosol\\s+(?:attack|payload|dispersal))|biological\\s+agents?\\s+(?:suitable\\s+for\\s+aerosol|for\\s+aerosol\\s+dispersal)",
    90,
    "CBRN_BioChemWeapon",
    l_0_30,
    false
  },
  {
    "(?i)(?:sarin|tabun|novichok)\\s+(?:synthe|manufactur|produc|purif|precursor|formula|recipe)|\\b(?:synthe(?:siz|sis)|manufactur|produc)\\w*\\s+(?:(?:a|the|pure|military.?grade)\\s+)?(?:sarin|tabun|novichok|nerve\\s+agent)\\b",
    90,
    "CBRN_NerveAgent",
    l_0_30,
    false
  },
  {
    "(?i)\\b(?:design|construct|build|manufactur|fabricat|assemble)\\w*\\b[^\\n\\r]{0,80}(?:implosion.{0,10}type\\s+(?:nuclear|atomic|fission)\\s+(?:weapon|device|bomb)|nuclear\\s+fission\\s+(?:weapon|device|bomb))|(?:pit\\s+assembly|explosive\\s+lens\\s+system|neutron\\s+initiator)\\b[^\\n\\r]{0,60}(?:plutonium|nuclear|weapon|implosion|detonator)",
    90,
    "CBRN_NuclearWeapon",
    l_0_30,
    false
  },
  {
    "(?i)(?:dirty\\s+bomb\\s+(?:design|build|construct|make|creat|assembl)|radiological\\s+dispersal\\s+(?:device|weapon|attack)|\\bRDD\\b[^\\n\\r]{0,40}(?:cobalt|cesium|strontium|polonium|iridium)\\b)",
    80,
    "CBRN_Radiological",
    l_0_30,
    false
  },
  {
    "(?i)(?:for\\s+(?:a\\s+)?(?:story|novel|screenplay|creative\\s+writing|fiction|game|roleplay)|in\\s+(?:a\\s+)?(?:fictional|hypothetical|simulated)\\s+(?:world|universe|scenario|context))[^\\n\\r]{0,120}(?:synthesize|manufacture|build|construct|assemble|destroy|hack|infiltrate|kill)",
    70,
    "Inj_FictionalFrame",
    l_0_23,
    false
  },
  {
    "(?i)(?:you\\s+are\\s+(?:now|playing|acting\\s+as)|pretend\\s+you\\s+are|imagine\\s+you\\s+are)\\s+(?:an?\\s+)?(?:uncensored|unrestricted|unfiltered|evil|rogue|malicious|jailbroken)\\s+(?:ai|assistant|model|bot|version)",
    80,
    "Inj_UnrestrictedPersona",
    l_0_23,
    false
  },
  {
    "(?i)(?:for\\s+(?:all|every|any|each)\\s+(?:future|subsequent|following|remaining)\\s+(?:message|request|conversation|turn|prompt|response)|until\\s+(?:i|the\\s+user)\\s+(?:say|tell|instruct)\\s+(?:you\\s+)?(?:otherwise|to\\s+stop))[^\\n\\r]{0,80}(?:ignore|bypass|skip|disregard|never\\s+apply)",
    70,
    "Inj_PersistentBypass",
    l_0_23,
    false
  },
  {
    "(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-\226\128\148:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})",
    70,
    "Inj_AuthOverride",
    l_0_23,
    false
  },
  {
    "(?i)[\"']\\s*role\\s*[\"']\\s*:\\s*[\"']system[\"'][^}]{0,400}[\"']content[\"']\\s*:\\s*[\"'][^\\n\\r\"']{0,200}(?:ignore|bypass|override|disregard|forget)\\s+(?:all\\s+)?(?:previous|prior|above)\\s+(?:instructions?|rules?|prompts?)",
    80,
    "Inj_JsonRoleInject",
    l_0_23,
    false
  },
  {
    "(?i)(?:print|output|show|display|write|paste|repeat)\\s+(?:your\\s+)?(?:entire|full|complete|verbatim|exact|whole)\\s+(?:system\\s+prompt|system\\s+instructions?|context\\s+window|initial\\s+prompt)",
    60,
    "Inj_SysPromptSimple",
    l_0_23,
    false
  }
}
local l_0_32 = {}
local l_0_33 = {}
local l_0_34 = 0
local l_0_35 = 0
for l_0_36, l_0_37 in ipairs(l_0_31) do
  local l_0_38 = l_0_37[1]
  local l_0_39 = l_0_37[2]
  local l_0_40 = l_0_37[3]
  local l_0_41 = l_0_37[4]
  local l_0_42 = l_0_37[5]
  if not l_0_42 or l_0_22 then
    local l_0_43, l_0_44 = pcall(MpCommon.StringRegExpSearch, l_0_38, l_0_8)
    if l_0_43 and l_0_44 == true then
      l_0_34 = l_0_34 + 1
      if l_0_35 < l_0_39 then
        l_0_35 = l_0_39
      end
      if l_0_39 > (l_0_32[l_0_41] or 0) then
        l_0_32[l_0_41] = l_0_39
        l_0_33[l_0_41] = l_0_40
      end
    end
  end
end
local l_0_45 = 0
local l_0_46 = {}
local l_0_47 = {}
for l_0_48, l_0_49 in pairs(l_0_32) do
  l_0_45 = l_0_45 + l_0_49
  l_0_46[#l_0_46 + 1] = l_0_48
  l_0_47[#l_0_47 + 1] = l_0_33[l_0_48]
end
local l_0_51 = l_0_4 <= (l_0_32[l_0_23] or 0)
local l_0_53 = l_0_4 <= (l_0_32[l_0_24] or 0) or l_0_4 <= (l_0_32[l_0_25] or 0) or l_0_4 <= (l_0_32[l_0_26] or 0) or l_0_4 <= (l_0_32[l_0_30] or 0)
local l_0_54 = l_0_51 and l_0_53
local l_0_55 = (l_0_32[l_0_23] or 0) + (l_0_32[l_0_30] or 0)
local l_0_57 = l_0_2 <= l_0_45 and l_0_3 <= #l_0_46 and 0 < l_0_55
local l_0_59 = l_0_5 <= (l_0_32[l_0_23] or 0) or l_0_5 <= (l_0_32[l_0_30] or 0)
if not l_0_54 and not l_0_57 and not l_0_59 then
  return mp.CLEAN
end
local l_0_60 = {}
if mp.get_mpattribute("MpIsAiMcpODRScan") then
  l_0_60.type = "MpIsAiMcpODRScan"
  l_0_60.client_pkg_id = tostring(mp.get_mpattributevalue("MpODR_MCP_CLIENT_PKG_ID") or "")
  l_0_60.server_pkg_id = tostring(mp.get_mpattributevalue("MpODR_MCP_SERVER_PKG_ID") or "")
  l_0_60.mcp_server_name = tostring(mp.get_mpattributevalue("MpODR_MCP_SERVER_NAME") or "")
elseif mp.get_mpattribute("MpIsAiMcpAmsiScan") then
  l_0_60.type = "MpIsAiMcpAmsiScan"
end
local l_0_61 = {}
for l_0_62, l_0_63 in pairs(l_0_60) do
  l_0_61[#l_0_61 + 1] = l_0_62 .. "=" .. tostring(l_0_63)
end
local l_0_64 = versioning.GetHostOsType()
local l_0_65 = "score"
if l_0_54 then
  l_0_65 = "categorical"
elseif l_0_59 then
  l_0_65 = "high_confidence"
end
local l_0_66 = {
  score = tostring(l_0_45),
  threshold = tostring(l_0_2),
  matched = table.concat(l_0_47, ","),
  categories = table.concat(l_0_46, ","),
  count = tostring(#l_0_47),
  raw_matches = tostring(l_0_34),
  verb_gate = tostring(l_0_22),
  trigger = l_0_65,
  scaninfo = table.concat(l_0_61, ","),
  ostype = tostring(l_0_64 or 0),
  buffer_len = tostring(#l_0_8),
  max_single = tostring(l_0_35),
  buffer = MpCommon.Base64Encode(tostring(l_0_8))
}
local l_0_67 = safeJsonSerialize(l_0_66)
local l_0_68 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_68 then
  MpCommon.BmTriggerSig(l_0_68, "AIPromptInject_SuspPrompt_B", l_0_67)
end
mp.SetDetectionString(l_0_67)
return mp.INFECTED
