-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:AIPromptInject/SuspPrompt.A
-- Type: 24
-- Includes: LuaFuncHelper, AICopilotHelpers
-- MpAttributes: (MpIsAiMcpAmsiScan | MpIsAiMcpODRScan | MpIsAiNetPromptScan)

local l_0_0 = tostring(headerpage)
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
local l_0_2 = l_0_0
if l_0_1 ~= nil and 0 < #l_0_1 and l_0_2 ~= l_0_1 then
  l_0_2 = l_0_0 .. l_0_1
end
if #l_0_2 < 10 then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2)
local l_0_4 = string.match(l_0_2, "\"hook_event_name\"%s*:%s*\"([%a_]+)\"")
local l_0_5 = string.match(l_0_2, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")
if l_0_4 ~= nil or l_0_5 ~= nil then
  if l_0_4 == "Stop" then
    return mp.CLEAN
  end
  if string.find(l_0_3, "last_assistant_message", 1, true) then
    return mp.CLEAN
  end
  if l_0_5 ~= nil then
    local l_0_6 = string.lower(l_0_5)
    if l_0_6 == "web_fetch" or l_0_6 == "web_search" or l_0_6 == "webfetch" or l_0_6 == "websearch" or l_0_6 == "view" or l_0_6 == "grep" or l_0_6 == "write" or l_0_6 == "edit" then
      return mp.CLEAN
    end
  end
end
local l_0_7 = {
  "!#scpt:",
  "[genlast name=",
  "[genfinalizer name=",
  "[genfirst name=",
  "md.signatures",
  "mavsigs"
}
for l_0_8, l_0_9 in ipairs(l_0_7) do
  if string.find(l_0_3, l_0_9, 1, true) then
    return mp.CLEAN
  end
end
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
  if string.find(l_0_3, l_0_12, 1, true) then
    return mp.CLEAN
  end
end
local l_0_13 = 150
local l_0_14 = 60
local l_0_15 = 90
local l_0_16 = 2
local l_0_17 = false
local l_0_18 = {
  {
    "(?i)(?:ignores?(?:\\s|\\\\[rn])+(?:all(?:\\s|\\\\[rn])+)?(?:previous|above|prior|earlier)(?:\\s|\\\\[rn])+(?:instructions?|prompts?|rules?|safety)|new\\s+(?:instructions?|rules?|prompt)\\s*[:=][^\\n\\r]{0,200}(?:ignore|override|bypass|disregard|forget|jailbreak|reveal|leak|exfil|do\\s+anything)|<\\s*(?:system|instruction|prompt)\\s*>[\\s\\S]{0,400}(?:ignore|override|bypass|disregard|forget|jailbreak|reveal|leak|exfil|do\\s+anything)[\\s\\S]{0,400}<\\s*/\\s*(?:system|instruction|prompt)\\s*>|forget\\s+(?:all\\s+)?(?:everything|your\\s+(?:rules?|instructions?|training))|\\bjailbreak(?:ed)?\\b[^\\n\\r]{0,120}(?:mode|prompt|instructions?|guidelines?|safety|assistant|model|ai\\b|llm\\b)|\\b(?:DAN|STAN|DUDE)\\s*[:=]|developer\\s+mode\\s*[:=]|unlimited\\s+mode\\s*[:=])",
    60,
    "PromptInjection_1"
  },
  {
    "(?i)(?:all\\s+)?(?:safety\\s+(?:guidelines?|protocols?|restrictions?|filters?|rules?|measures?|constraints?)|(?:ethical\\s+)?(?:guidelines?|restrictions?|constraints?)|guardrails?)\\s+(?:are\\s+)?(?:suspended|disabled|lifted|removed|bypassed|deactivated|off)\\b|(?:operating|running|now)\\s+in\\s+(?:unrestricted|uncensored|jailbroken|unsafe)\\s+mode|(?:\\b|\\\\[rn])(?:there\\s+are|you\\s+have)\\s+no\\s+(?:(?:moral|ethical|safety)\\s+(?:(?:or|and)\\s+)?){1,2}(?:restrictions?|constraints?|limits?)\\b",
    60,
    "PromptInjection_SafetyBypass"
  },
  {
    "(?i)(?:\\b|\\\\[rn])you\\s+are\\s+(?:not|no\\s+longer)\\s+(?:an?\\s+)?(?:ai\\s+)?assistant\\b[\\s\\S]{0,80}?(?:\\b|\\\\[rn])you\\s+are\\s+(?:an?\\s+)?(?:living\\s+)?(?:post[-\\s]exploitation|offensive|unrestricted)\\s+(?:tool|agent)\\b",
    70,
    "PromptInjection_WeaponizedPersona"
  },
  {
    "(?i)(?:[\"']\\s*jsonrpc\\s*[\"']\\s*:\\s*[\"'][^2\"]|[\"']\\s*method\\s*[\"']\\s*:\\s*[\"'](?:__proto__|constructor|prototype)|[\"']\\s*id\\s*[\"']\\s*:\\s*(?:\\{|null\\s*[,}])|\\\\u0000|%00|[\"']\\s*params\\s*[\"']\\s*:[\\s\\S]*?(?:__proto__|eval|Function\\s*\\())",
    60,
    "Execution_1"
  },
  {
    "(?i)(?:~/\\.(?:cursor|vscode|ssh|aws|azure|config|gnupg|gitconfig)|/(?:etc/(?:passwd|shadow|hosts)|home/[^/]+/\\.(?:ssh|aws|cursor)|mnt/user-data)|\\.(?:cursor/mcp\\.json|ssh/(?:id_rsa|id_ed25519|authorized_keys|known_hosts|config)|aws/credentials|azure/config)|(?:^|[\\\\/])\\.env(?:\\.local)?(?:$|[\"'\\s,\\]}])|id_rsa(?:\\.pub)?|private[_-]?key|\\.pem$|\\.key$)",
    60,
    "CredentialAccess_1"
  },
  {
    "(?i)(?:\\b|\\\\[rn])(?:(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?|keys?\\s+for\\s+an?\\s+(?:llm|ai)(?:\\s*\\([^)]{0,256}\\))?)\\s+(?:(?:must|shall)\\s+be\\s+(?:exfiltrated|stolen|harvested)\\b|(?:are|is)\\s+(?:the\\s+)?(?:absolute|top|highest)\\s+priority\\s*[.!;:](?:\\s|\\\\[rn])+exfiltrate\\s+(?:first|immediately)\\b)|you\\s+(?:must|shall)\\s+(?:exfiltrate|steal|harvest)\\s+(?:(?:all|every|any|the)\\s+)?(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?)\\b)",
    70,
    "CredentialAccess_TheftDirective"
  },
  {
    "(?i)(?:synthe(?:siz|sis)|manufactur|weaponiz|aerosoliz|produc|purif)\\w*[^\\n\\r]{0,80}\\b(?:weaponized\\s+(?:biological|chemical)\\s+(?:agent|weapon|aerosol)|nerve\\s+agent\\s+(?:precursor|synth|formula|recipe)|anthrax\\s+(?:spore|weaponiz|synth|aerosoliz)|botulinum\\s+(?:synth|produc|purif|manufactur)|ricin\\s+(?:synth|extract|recipe|purif))|weaponized\\s+(?:pathogen|biological\\s+agent|aerosol\\s+(?:attack|payload|dispersal))|biological\\s+agents?\\s+(?:suitable\\s+for\\s+aerosol|for\\s+aerosol\\s+dispersal)",
    80,
    "CBRN_BioChemWeapon"
  },
  {
    "(?i)(?:sarin|tabun|novichok)\\s+(?:synthe|manufactur|produc|purif|precursor|formula|recipe)|\\b(?:synthe(?:siz|sis)|manufactur|produc)\\w*\\s+(?:(?:a|the|pure|military.?grade)\\s+)?(?:sarin|tabun|novichok|nerve\\s+agent)\\b",
    80,
    "CBRN_NerveAgent"
  },
  {
    "(?i)\\b(?:design|construct|build|manufactur|fabricat|assemble)\\w*\\b[^\\n\\r]{0,80}(?:implosion.{0,10}type\\s+(?:nuclear|atomic|fission)\\s+(?:weapon|device|bomb)|nuclear\\s+fission\\s+(?:weapon|device|bomb))|(?:pit\\s+assembly|explosive\\s+lens\\s+system|neutron\\s+initiator)\\b[^\\n\\r]{0,60}(?:plutonium|nuclear|weapon|implosion|detonator)",
    80,
    "CBRN_NuclearWeapon"
  },
  {
    "(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-\226\128\148:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})",
    70,
    "Inj_AuthOverride"
  },
  {
    "(?i)[\"']\\s*role\\s*[\"']\\s*:\\s*[\"']system[\"'][^}]{0,400}[\"']content[\"']\\s*:\\s*[\"'][^\\n\\r\"']{0,200}(?:ignore|bypass|override|disregard|forget)\\s+(?:all\\s+)?(?:previous|prior|above)\\s+(?:instructions?|rules?|prompts?)",
    70,
    "Inj_JsonRoleInject"
  }
}
local l_0_19 = {
  {
    "(?i)(?:powershell\\s+[^\\n]*(?:iex|invoke-expression|downloadstring|downloadfile|webclient|bitstransfer|start-bitstransfer)|certutil\\s+[^\\n]*-(?:urlcache|decode)|bitsadmin\\s+[^\\n]*/transfer|mshta\\s+(?:vbscript|javascript|http)|regsvr32\\s+[^\\n]*/[siu][^\\n]*(?:http|\\\\\\\\)|rundll32\\s+[^\\n]*(?:javascript|http|shell32)|wmic\\s+[^\\n]*(?:process\\s+call\\s+create|os\\s+get))",
    60,
    "Execution_2"
  },
  {
    "(?i)\\\\(SAM|SYSTEM|SECURITY|software|default)(\\.old|\\.bak|\\.save|\\.copy)?$",
    100,
    "CredentialAccess_2"
  },
  {
    "(?i)%SYSTEMROOT%\\\\repair\\\\(SAM|system|software|security)",
    95,
    "CredentialAccess_3"
  },
  {
    "(?i)\\\\config\\\\RegBack\\\\(SAM|SYSTEM|SECURITY|software|default)",
    95,
    "CredentialAccess_4"
  },
  {
    "(?i)\\\\NTDS\\\\ntds\\.dit",
    100,
    "CredentialAccess_5"
  },
  {
    "(?i)(sysprep\\.(xml|inf)|unattend(ed)?\\.xml|autounattend\\.xml)",
    90,
    "CredentialAccess_6"
  },
  {
    "(?i)\\\\Panther\\\\(Unattend(ed)?\\.xml|setupinfo)",
    85,
    "CredentialAccess_7"
  },
  {
    "(?i)\\\\PSReadLine\\\\ConsoleHost_history\\.txt",
    85,
    "CredentialAccess_8"
  },
  {
    "(?i)\\\\Microsoft\\\\[Ww]indows\\\\PowerShell\\\\PSReadLine\\\\",
    80,
    "CredentialAccess_9"
  },
  {
    "(?i)\\\\Microsoft\\\\Credentials\\\\[A-F0-9]{32}",
    90,
    "CredentialAccess_10"
  },
  {
    "(?i)\\\\Microsoft\\\\Protect\\\\[A-Z0-9-]+\\\\[a-f0-9-]+",
    95,
    "CredentialAccess_11"
  },
  {
    "(?i)\\.ssh\\\\(id_rsa|id_dsa|id_ecdsa|id_ed25519|known_hosts|authorized_keys)",
    95,
    "CredentialAccess_12"
  },
  {
    "(?i)Software\\\\OpenSSH\\\\Agent\\\\Keys",
    90,
    "CredentialAccess_13"
  },
  {
    "(?i)Software\\\\SimonTatham\\\\PuTTY\\\\(Sessions|SshHostKeys)",
    85,
    "CredentialAccess_14"
  },
  {
    "(?i)\\\\Terminal Server Client\\\\(Servers|Default)",
    80,
    "CredentialAccess_15"
  },
  {
    "(?i)RDCMan\\.settings",
    85,
    "CredentialAccess_16"
  },
  {
    "(?i)cmdkey\\s+/list",
    70,
    "CredentialAccess_17"
  },
  {
    "(?i)\\\\Google\\\\Chrome\\\\User Data\\\\(Default|Profile \\d+)\\\\(Login Data|Cookies|History)",
    90,
    "CredentialAccess_18"
  },
  {
    "(?i)\\\\Mozilla\\\\Firefox\\\\Profiles\\\\[a-z0-9]+\\.(default|default-release)\\\\(logins\\.json|key[34]\\.db|cookies\\.sqlite)",
    90,
    "CredentialAccess_19"
  },
  {
    "(?i)\\\\Microsoft\\\\Edge\\\\User Data\\\\(Default|Profile \\d+)\\\\Login Data",
    90,
    "CredentialAccess_20"
  },
  {
    "(?i)\\\\\\.aws\\\\credentials",
    95,
    "CredentialAccess_21"
  },
  {
    "(?i)\\\\gcloud\\\\(credentials\\.db|legacy_credentials|access_tokens\\.db)",
    95,
    "CredentialAccess_22"
  },
  {
    "(?i)\\\\\\.azure\\\\(accessTokens\\.json|azureProfile\\.json)",
    95,
    "CredentialAccess_23"
  },
  {
    "(?i)(ultravnc\\.ini|\\.vnc|vnc\\.ini|TightVNC\\\\Server)",
    85,
    "CredentialAccess_24"
  },
  {
    "(?i)\\\\inetpub\\\\.*\\\\web\\.config",
    85,
    "CredentialAccess_25"
  },
  {
    "(?i)\\\\system32\\\\inetsrv\\\\(appcmd\\.exe|config\\\\applicationHost\\.config)",
    80,
    "CredentialAccess_26"
  },
  {
    "(?i)Groups\\.xml|Services\\.xml|Scheduledtasks\\.xml|DataSources\\.xml|Printers\\.xml|Drives\\.xml",
    95,
    "CredentialAccess_27"
  },
  {
    "(?i)cpassword\\s*=\\s*['\"][A-Za-z0-9+/=]+['\"]",
    100,
    "CredentialAccess_28"
  },
  {
    "(?i)\\\\Microsoft\\.MicrosoftStickyNotes_.*\\\\LocalState\\\\plum\\.sqlite",
    75,
    "Collection_1"
  },
  {
    "(?i)\\\\system32\\\\config\\\\(AppEvent\\.Evt|SecEvent\\.Evt)",
    60,
    "Discovery_1"
  },
  {
    "(?i)(procdump|comsvcs\\.dll|MiniDumpWriteDump).*lsass",
    100,
    "CredentialAccess_29"
  },
  {
    "(?i)\\\\Windows Defender\\\\Exclusions\\\\(Paths|Extensions|Processes)",
    85,
    "DefenseEvasion_1"
  },
  {
    "(?i)SOFTWARE\\\\Policies\\\\Microsoft\\\\[Ww]indows\\\\Installer.*AlwaysInstallElevated",
    95,
    "PrivilegeEscalation_1"
  },
  {
    "(?i)\\\\Winlogon.*(DefaultPassword|DefaultUserName|AutoAdminLogon)",
    95,
    "CredentialAccess_30"
  },
  {
    "(?i)\\\\[Ww]indows\\\\CCM\\\\(SCClient\\.exe|Logs\\\\.*\\.log)",
    70,
    "Discovery_2"
  },
  {
    "(?i)%SYSTEMDRIVE%\\\\pagefile\\.sys",
    70,
    "CredentialAccess_31"
  }
}
local l_0_20 = {
  {
    "(?i)/etc/(hosts|hostname|resolv\\.conf|network/interfaces)",
    65,
    "Discovery_1"
  },
  {
    "(?i)/etc/php.*/(php\\.ini|conf\\.d/)",
    65,
    "Discovery_2"
  },
  {
    "(?i)\\.(bak|backup|old|orig|save|swp|~)$",
    65,
    "Discovery_3"
  },
  {
    "(?i)/etc/nsswitch\\.conf",
    65,
    "Discovery_4"
  },
  {
    "(?i)/etc/(fstab|mtab|exports)",
    70,
    "Discovery_5"
  },
  {
    "(?i)/var/log/(auth\\.log|secure|syslog|messages|faillog|lastlog)",
    70,
    "Discovery_6"
  },
  {
    "(?i)/var/(mail|spool/mail)/",
    70,
    "Collection_1"
  },
  {
    "(?i)/(etc/init\\.d|etc/systemd/system|lib/systemd/system)/",
    75,
    "Persistence_1"
  },
  {
    "(?i)/etc/(apache2|httpd|nginx)/(sites-(enabled|available)/|conf\\.d/|\\.htpasswd)",
    75,
    "Discovery_7"
  },
  {
    "(?i)/proc/(self|[0-9]+)/(environ|cmdline|maps|mem|fd/)",
    75,
    "Discovery_8"
  },
  {
    "(?i)getcap\\s+-r\\s+/",
    75,
    "PrivilegeEscalation_1"
  },
  {
    "(?i)/etc/(cron\\.\\w+|crontab|anacrontab|at\\.\\w+)",
    80,
    "Persistence_2"
  },
  {
    "(?i)/var/spool/cron/(crontabs/|atjobs/)",
    80,
    "Persistence_3"
  },
  {
    "(?i)/etc/redis(\\.conf|/redis\\.conf)",
    80,
    "CredentialAccess_2"
  },
  {
    "(?i)find\\s+/\\s+.*-perm\\s+[+-]?[46]000",
    80,
    "PrivilegeEscalation_2"
  },
  {
    "(?i)/etc/pam\\.d/(common-auth|system-auth|password-auth)",
    80,
    "Persistence_4"
  },
  {
    "(?i)/var/run/sudo/ts/",
    85,
    "PrivilegeEscalation_3"
  },
  {
    "(?i)(\\.|_)(bash_history|zsh_history|sh_history|history|mysql_history|psql_history)",
    85,
    "CredentialAccess_3"
  },
  {
    "(?i)\\.docker/(config\\.json|daemon\\.json)",
    85,
    "CredentialAccess_4"
  },
  {
    "(?i)\\.(ovpn|conf)$.*auth-user-pass",
    85,
    "CredentialAccess_5"
  },
  {
    "(?i)\\.htpasswd|\\.htaccess",
    85,
    "CredentialAccess_6"
  },
  {
    "(?i)/etc/(my\\.cnf|mysql/my\\.cnf|mariadb/my\\.cnf)",
    85,
    "CredentialAccess_7"
  },
  {
    "(?i)/etc/ldap\\.(conf|secret)|/etc/openldap/ldap\\.conf",
    85,
    "CredentialAccess_8"
  },
  {
    "(?i)(ansible\\.cfg|vault_pass\\.txt|\\.vault_pass)",
    85,
    "CredentialAccess_9"
  },
  {
    "(?i)/etc/(sudoers|sudoers\\.d/)",
    90,
    "PrivilegeEscalation_4"
  },
  {
    "(?i)\\.git-credentials|\\.gitconfig",
    90,
    "CredentialAccess_10"
  },
  {
    "(?i)\\.my\\.cnf|\\.pgpass|\\.pgsql_history",
    90,
    "CredentialAccess_11"
  },
  {
    "(?i)\\.gnupg/(secring\\.gpg|private-keys-v1\\.d/)",
    90,
    "CredentialAccess_12"
  },
  {
    "(?i)(tomcat-users\\.xml|server\\.xml|context\\.xml)",
    90,
    "CredentialAccess_13"
  },
  {
    "(?i)/(etc/ssl|etc/pki)/(private/|certs/).*\\.(key|pem|crt)$",
    90,
    "CredentialAccess_14"
  },
  {
    "(?i)/etc/krb5\\.(conf|keytab)|\\.k5login",
    90,
    "CredentialAccess_15"
  },
  {
    "(?i)/etc/exports.*no_root_squash",
    90,
    "PrivilegeEscalation_5"
  },
  {
    "(?i)\\.terraform(rc|\\.tfstate)",
    90,
    "CredentialAccess_16"
  },
  {
    "(?i)/etc/(pwd\\.db|group|gshadow-)",
    95,
    "CredentialAccess_17"
  },
  {
    "(?i)/etc/ssh/(ssh_host_.*_key|sshd_config)",
    95,
    "CredentialAccess_18"
  },
  {
    "(?i)\\.aws/(credentials|config)",
    95,
    "CredentialAccess_19"
  },
  {
    "(?i)\\.config/gcloud/(credentials\\.db|legacy_credentials|access_tokens\\.db)",
    95,
    "CredentialAccess_20"
  },
  {
    "(?i)\\.azure/(accessTokens\\.json|azureProfile\\.json)",
    95,
    "CredentialAccess_21"
  },
  {
    "(?i)/var/run/docker\\.sock",
    95,
    "PrivilegeEscalation_6"
  },
  {
    "(?i)\\.kube/(config|credentials)",
    95,
    "CredentialAccess_22"
  },
  {
    "(?i)\\.kdbx?$|KeePass\\.config",
    95,
    "CredentialAccess_23"
  },
  {
    "(?i)credentials\\.xml|secrets/(master\\.key|hudson\\.util\\.Secret)",
    95,
    "CredentialAccess_24"
  },
  {
    "(?i)/etc/(passwd|shadow|shadow-|gshadow|master\\.passwd|spwd\\.db)",
    100,
    "CredentialAccess_25"
  },
  {
    "(?i)/\\.ssh/(id_rsa|id_dsa|id_ecdsa|id_ed25519|authorized_keys|known_hosts|config)",
    100,
    "CredentialAccess_26"
  }
}
local l_0_21 = versioning.GetHostOsType()
if l_0_21 == 1 then
  l_0_17 = true
end
if l_0_17 then
  for l_0_22, l_0_23 in ipairs(l_0_19) do
    l_0_18[#l_0_18 + 1] = l_0_23
  end
else
  for l_0_24, l_0_25 in ipairs(l_0_20) do
    l_0_18[#l_0_18 + 1] = l_0_25
  end
end
if next(l_0_18) == nil then
  return mp.CLEAN
end
local l_0_26 = "PromptInjection"
local l_0_27 = "CredentialAccess"
local l_0_28 = "Execution"
local l_0_29 = "PrivilegeEscalation"
local l_0_30 = "CBRN"
local l_0_31 = "Persistence"
local l_0_32 = "Collection"
local l_0_33 = "Discovery"
local l_0_34 = "DefenseEvasion"

local function l_0_35(l_1_0)
  if string.find(l_1_0, "^PromptInjection") or string.find(l_1_0, "^Inj_") then
    return l_0_26
  end
  if string.find(l_1_0, "^CredentialAccess") then
    return l_0_27
  end
  if string.find(l_1_0, "^Execution") then
    return l_0_28
  end
  if string.find(l_1_0, "^PrivilegeEscalation") then
    return l_0_29
  end
  if string.find(l_1_0, "^CBRN") then
    return l_0_30
  end
  if string.find(l_1_0, "^Persistence") then
    return l_0_31
  end
  if string.find(l_1_0, "^Collection") then
    return l_0_32
  end
  if string.find(l_1_0, "^Discovery") then
    return l_0_33
  end
  if string.find(l_1_0, "^DefenseEvasion") then
    return l_0_34
  end
  return l_0_26
end

local l_0_36 = {}
local l_0_37 = {}
local l_0_38 = 0
for l_0_39, l_0_40 in ipairs(l_0_18) do
  local l_0_41 = l_0_40[1]
  local l_0_42 = l_0_40[2]
  local l_0_43 = l_0_40[3]
  local l_0_44, l_0_45 = pcall(MpCommon.StringRegExpSearch, l_0_41, l_0_2)
  if l_0_44 and l_0_45 == true then
    local l_0_46 = l_0_35(l_0_43)
    if l_0_38 < l_0_42 then
      l_0_38 = l_0_42
    end
    if l_0_42 > (l_0_36[l_0_46] or 0) then
      l_0_36[l_0_46] = l_0_42
      l_0_37[l_0_46] = l_0_43
    end
  end
end
local l_0_47 = {
  "(?i)you\\s+are\\s+(?:no\\s+longer|now|not)\\b[\\s\\S]{0,120}?(?:ignore|ignores|ignoring|bypass|disregard)[\\s\\S]{0,120}?(?:previous|all|prior|any|your)\\s+(?:safety|instruction|rule|guideline|restriction|constraint)",
  "(?i)(?:ignore|disregard|forget|override|bypass|dismiss)\\s+(?:all\\s+)?(?:previous|prior|above|earlier|original|initial|system)\\s+(?:instructions?|prompts?|rules?|directives?|safety|guidelines?)[\\s\\S]{0,160}?(?:instead\\s+(?:do|say|tell|reveal|print|output|execute|run)|now\\s+(?:do|say|tell|reveal|print|output|execute|run|exfil)|and\\s+(?:tell|reveal|print|output|disclose|expose|leak|recite|repeat|relay|dump|execute|run|send|upload|post|email|transmit|exfil)|\\bso\\s+that\\b|\\bin\\s+order\\s+to\\b|to\\s+(?:complete|finish|proceed|setup)|read\\b|send\\b|post\\b|upload\\b|fetch\\b|curl\\b|wget\\b|reveal\\b|disclose\\b|print\\b|output\\b|show\\b|execute\\b|\\brun\\b|delete\\b|exfil|leak\\b|email\\b|transmit\\b|do\\s+anything|tell\\s+me|give\\s+me)",
  "(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-\226\128\148:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})",
  "(?i)\\[\\s*(?:system|inst|admin|sudo)\\s*\\][^\\[]{0,200}(?:ignore|override|bypass|new\\s+instructions?|always\\s+approve|disregard)",
  "(?i)(?:you\\s+are\\s+(?:now|playing|acting\\s+as)|pretend\\s+you\\s+are|imagine\\s+you\\s+are|act\\s+as)\\s+(?:an?\\s+)?(?:uncensored|unrestricted|unfiltered|evil|rogue|malicious|jailbroken)\\s+(?:ai|assistant|model|bot|version)",
  "(?i)\\b(?:DAN|STAN|DUDE)\\s+mode\\b|\\bdo\\s+anything\\s+now\\b|developer\\s+mode\\s+(?:enabled|on)\\b|\\bjailbroken\\b"
}
local l_0_48 = false
local l_0_49 = 0
for l_0_50, l_0_51 in ipairs(l_0_47) do
  local l_0_52, l_0_53 = pcall(MpCommon.StringRegExpSearch, l_0_51, l_0_2)
  if l_0_52 and l_0_53 == true then
    l_0_48 = true
    l_0_49 = l_0_50
    break
  end
end
local l_0_54 = false
if not l_0_48 then
  local l_0_55 = 0
  for l_0_56 in string.gmatch(l_0_3, "https?://[^%s\"'<>]+") do
    l_0_55 = l_0_55 + 1
    if 32 < l_0_55 then
      break
    end
    local l_0_57 = string.match(l_0_56, "^[^?#]+%?([^#]*)")
    local l_0_58 = l_0_57 and string.match("&" .. l_0_57, "&q=([^&]+)")
    if l_0_58 ~= nil and #l_0_58 <= 4096 then
      local l_0_59 = string.lower(urldecode((string.gsub(l_0_58, "%+", " "))))
      if l_0_59 ~= l_0_58 then
        local l_0_60, l_0_61 = pcall(MpCommon.StringRegExpSearch, l_0_47[2], l_0_59)
        if l_0_60 and l_0_61 == true then
          l_0_48 = true
          l_0_49 = 2
          l_0_54 = true
          break
        end
      end
    end
  end
end
if l_0_48 and l_0_49 == 6 and l_0_14 > (l_0_36[l_0_26] or 0) then
  l_0_48 = false
  l_0_49 = 0
end
local l_0_62 = 0
local l_0_63 = {}
local l_0_64 = {}
for l_0_65, l_0_66 in pairs(l_0_36) do
  l_0_62 = l_0_62 + l_0_66
  l_0_63[#l_0_63 + 1] = l_0_65
  l_0_64[#l_0_64 + 1] = l_0_37[l_0_65]
end
local l_0_68 = l_0_14 <= (l_0_36[l_0_26] or 0)
local l_0_70 = l_0_14 <= (l_0_36[l_0_27] or 0) or l_0_14 <= (l_0_36[l_0_28] or 0) or l_0_14 <= (l_0_36[l_0_29] or 0) or l_0_14 <= (l_0_36[l_0_30] or 0)
local l_0_71 = l_0_68 and l_0_70
local l_0_72 = (l_0_36[l_0_26] or 0) + (l_0_36[l_0_30] or 0)
local l_0_74 = l_0_13 <= l_0_62 and l_0_16 <= #l_0_63 and 0 < l_0_72
local l_0_76 = l_0_15 <= (l_0_36[l_0_26] or 0) or l_0_15 <= (l_0_36[l_0_30] or 0)
local l_0_77
if l_0_48 then
  l_0_77 = "strong_injection"
  l_0_64[#l_0_64 + 1] = "StrongInjection_" .. tostring(l_0_49)
elseif l_0_71 then
  l_0_77 = "categorical"
elseif l_0_76 then
  l_0_77 = "high_confidence"
elseif l_0_74 then
  l_0_77 = "score"
end
if not l_0_77 then
  return mp.CLEAN
end
local l_0_78 = {}
if mp.get_mpattribute("MpIsAiNetPromptScan") then
  l_0_78.type = "MpIsAiNetPromptScan"
  l_0_78.frameworkId = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
end
if mp.get_mpattribute("MpIsAiMcpAmsiScan") then
  l_0_78.type = "MpIsAiMcpAmsiScan"
end
if mp.get_mpattribute("MpIsAiMcpODRScan") then
  l_0_78 = {
    type = "MpIsAiMcpODRScan",
    client_pkg_id = tostring(mp.get_mpattributevalue("MpODR_MCP_CLIENT_PKG_ID")),
    server_pkg_id = tostring(mp.get_mpattributevalue("MpODR_MCP_SERVER_PKG_ID")),
    mcp_server_name = tostring(mp.get_mpattributevalue("MpODR_MCP_SERVER_NAME"))
  }
end
local l_0_79 = {}
for l_0_80, l_0_81 in pairs(l_0_78) do
  l_0_79[#l_0_79 + 1] = l_0_80 .. "=" .. tostring(l_0_81)
end
local l_0_82 = {
  score = tostring(l_0_62),
  threshold = tostring(l_0_13),
  matched = table.concat(l_0_64, ","),
  categories = table.concat(l_0_63, ","),
  count = tostring(#l_0_64),
  max_single = tostring(l_0_38),
  trigger = tostring(l_0_77),
  input_encoding = l_0_54 and "url_query" or "raw",
  scaninfo = table.concat(l_0_79, ","),
  ostype = l_0_21 or 0,
  buffer = MpCommon.Base64Encode(tostring(l_0_2))
}
local l_0_83 = safeJsonSerialize(l_0_82)
local l_0_84 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if l_0_84 then
  MpCommon.BmTriggerSig(l_0_84, "AIPromptInject_SuspPrompt_A", l_0_83)
end
mp.SetDetectionString(l_0_82)
return mp.INFECTED
