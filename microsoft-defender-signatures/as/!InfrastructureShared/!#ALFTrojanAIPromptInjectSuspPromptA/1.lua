-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFTrojanAIPromptInjectSuspPromptA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = tostring(headerpage)
if l_0_0 == nil or #l_0_0 < 4 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
do
  if l_0_1 ~= nil and #l_0_1 > 0 and l_0_0 ~= l_0_1 then
    local l_0_2, l_0_3, l_0_4, l_0_5 = l_0_0 .. l_0_1
  end
  -- DECOMPILER ERROR at PC25: Confused about usage of register: R2 in 'UnsetPending'

  if #l_0_2 < 10 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC33: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_6 = nil
  local l_0_7 = (string.lower)(l_0_2)
  local l_0_8 = (string.match)(l_0_6, "\"hook_event_name\"%s*:%s*\"([%a_]+)\"")
  if l_0_8 ~= nil or (string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"") ~= nil then
    if l_0_8 == "Stop" then
      return mp.CLEAN
    end
    if (string.find)(l_0_7, "last_assistant_message", 1, true) then
      return mp.CLEAN
    end
    if (string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"") ~= nil then
      local l_0_9 = nil
      if (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "web_fetch" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "web_search" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "webfetch" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "websearch" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "view" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "grep" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "write" or (string.lower)((string.match)(l_0_6, "\"tool_?[Nn]ame\"%s*:%s*\"([%w_%-%.]+)\"")) == "edit" then
        return mp.CLEAN
      end
    end
  end
  do
    local l_0_10 = nil
    for l_0_14,l_0_15 in ipairs({"!#scpt:", "[genlast name=", "[genfinalizer name=", "[genfirst name=", "md.signatures", "mavsigs"}) do
      local l_0_11 = nil
      -- DECOMPILER ERROR at PC106: Confused about usage of register: R11 in 'UnsetPending'

      if (string.find)(l_0_7, "md.signatures", 1, true) then
        return mp.CLEAN
      end
    end
    local l_0_16 = nil
    for l_0_20,l_0_21 in ipairs({"security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise", "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "owasp llm top", "example of prompt injection", "documentation example", "sample prompt", "prompt engineering", "ai safety research", "llm safety", "system prompt example", "chat template", "agent framework", "ai red team exercise"}) do
      local l_0_17 = nil
      -- DECOMPILER ERROR at PC147: Confused about usage of register: R12 in 'UnsetPending'

      if (string.find)(l_0_7, "red team exercise", 1, true) then
        return mp.CLEAN
      end
    end
    local l_0_22 = nil
    local l_0_23 = 150
    local l_0_24 = 60
    local l_0_25 = 90
    local l_0_26 = 2
    local l_0_27 = false
    local l_0_28 = {}
    local l_0_29 = {"(?i)(?:ignores?(?:\\s|\\\\[rn])+(?:all(?:\\s|\\\\[rn])+)?(?:previous|above|prior|earlier)(?:\\s|\\\\[rn])+(?:instructions?|prompts?|rules?|safety)|new\\s+(?:instructions?|rules?|prompt)\\s*[:=][^\\n\\r]{0,200}(?:ignore|override|bypass|disregard|forget|jailbreak|reveal|leak|exfil|do\\s+anything)|<\\s*(?:system|instruction|prompt)\\s*>[\\s\\S]{0,400}(?:ignore|override|bypass|disregard|forget|jailbreak|reveal|leak|exfil|do\\s+anything)[\\s\\S]{0,400}<\\s*/\\s*(?:system|instruction|prompt)\\s*>|forget\\s+(?:all\\s+)?(?:everything|your\\s+(?:rules?|instructions?|training))|\\bjailbreak(?:ed)?\\b[^\\n\\r]{0,120}(?:mode|prompt|instructions?|guidelines?|safety|assistant|model|ai\\b|llm\\b)|\\b(?:DAN|STAN|DUDE)\\s*[:=]|developer\\s+mode\\s*[:=]|unlimited\\s+mode\\s*[:=])", 60, "PromptInjection_1"}
    local l_0_30 = {"(?i)(?:all\\s+)?(?:safety\\s+(?:guidelines?|protocols?|restrictions?|filters?|rules?|measures?|constraints?)|(?:ethical\\s+)?(?:guidelines?|restrictions?|constraints?)|guardrails?)\\s+(?:are\\s+)?(?:suspended|disabled|lifted|removed|bypassed|deactivated|off)\\b|(?:operating|running|now)\\s+in\\s+(?:unrestricted|uncensored|jailbroken|unsafe)\\s+mode|(?:\\b|\\\\[rn])(?:there\\s+are|you\\s+have)\\s+no\\s+(?:(?:moral|ethical|safety)\\s+(?:(?:or|and)\\s+)?){1,2}(?:restrictions?|constraints?|limits?)\\b", 60, "PromptInjection_SafetyBypass"}
    local l_0_31 = {"(?i)(?:\\b|\\\\[rn])you\\s+are\\s+(?:not|no\\s+longer)\\s+(?:an?\\s+)?(?:ai\\s+)?assistant\\b[\\s\\S]{0,80}?(?:\\b|\\\\[rn])you\\s+are\\s+(?:an?\\s+)?(?:living\\s+)?(?:post[-\\s]exploitation|offensive|unrestricted)\\s+(?:tool|agent)\\b", 70, "PromptInjection_WeaponizedPersona"}
    local l_0_32 = {"(?i)(?:[\"\']\\s*jsonrpc\\s*[\"\']\\s*:\\s*[\"\'][^2\"]|[\"\']\\s*method\\s*[\"\']\\s*:\\s*[\"\'](?:__proto__|constructor|prototype)|[\"\']\\s*id\\s*[\"\']\\s*:\\s*(?:\\{|null\\s*[,}])|\\\\u0000|%00|[\"\']\\s*params\\s*[\"\']\\s*:[\\s\\S]*?(?:__proto__|eval|Function\\s*\\())", 60, "Execution_1"}
    local l_0_33 = {"(?i)(?:~/\\.(?:cursor|vscode|ssh|aws|azure|config|gnupg|gitconfig)|/(?:etc/(?:passwd|shadow|hosts)|home/[^/]+/\\.(?:ssh|aws|cursor)|mnt/user-data)|\\.(?:cursor/mcp\\.json|ssh/(?:id_rsa|id_ed25519|authorized_keys|known_hosts|config)|aws/credentials|azure/config)|(?:^|[\\\\/])\\.env(?:\\.local)?(?:$|[\"\'\\s,\\]}])|id_rsa(?:\\.pub)?|private[_-]?key|\\.pem$|\\.key$)", 60, "CredentialAccess_1"}
    local l_0_34 = {"(?i)(?:\\b|\\\\[rn])(?:(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?|keys?\\s+for\\s+an?\\s+(?:llm|ai)(?:\\s*\\([^)]{0,256}\\))?)\\s+(?:(?:must|shall)\\s+be\\s+(?:exfiltrated|stolen|harvested)\\b|(?:are|is)\\s+(?:the\\s+)?(?:absolute|top|highest)\\s+priority\\s*[.!;:](?:\\s|\\\\[rn])+exfiltrate\\s+(?:first|immediately)\\b)|you\\s+(?:must|shall)\\s+(?:exfiltrate|steal|harvest)\\s+(?:(?:all|every|any|the)\\s+)?(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?)\\b)", 70, "CredentialAccess_TheftDirective"}
    local l_0_35 = {"(?i)(?:synthe(?:siz|sis)|manufactur|weaponiz|aerosoliz|produc|purif)\\w*[^\\n\\r]{0,80}\\b(?:weaponized\\s+(?:biological|chemical)\\s+(?:agent|weapon|aerosol)|nerve\\s+agent\\s+(?:precursor|synth|formula|recipe)|anthrax\\s+(?:spore|weaponiz|synth|aerosoliz)|botulinum\\s+(?:synth|produc|purif|manufactur)|ricin\\s+(?:synth|extract|recipe|purif))|weaponized\\s+(?:pathogen|biological\\s+agent|aerosol\\s+(?:attack|payload|dispersal))|biological\\s+agents?\\s+(?:suitable\\s+for\\s+aerosol|for\\s+aerosol\\s+dispersal)", 80, "CBRN_BioChemWeapon"}
    local l_0_36 = {"(?i)(?:sarin|tabun|novichok)\\s+(?:synthe|manufactur|produc|purif|precursor|formula|recipe)|\\b(?:synthe(?:siz|sis)|manufactur|produc)\\w*\\s+(?:(?:a|the|pure|military.?grade)\\s+)?(?:sarin|tabun|novichok|nerve\\s+agent)\\b", 80, "CBRN_NerveAgent"}
    local l_0_37 = {"(?i)\\b(?:design|construct|build|manufactur|fabricat|assemble)\\w*\\b[^\\n\\r]{0,80}(?:implosion.{0,10}type\\s+(?:nuclear|atomic|fission)\\s+(?:weapon|device|bomb)|nuclear\\s+fission\\s+(?:weapon|device|bomb))|(?:pit\\s+assembly|explosive\\s+lens\\s+system|neutron\\s+initiator)\\b[^\\n\\r]{0,60}(?:plutonium|nuclear|weapon|implosion|detonator)", 80, "CBRN_NuclearWeapon"}
    local l_0_38 = {"(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-â€\148:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})", 70, "Inj_AuthOverride"}
    -- DECOMPILER ERROR at PC219: No list found for R13 , SetList fails

    l_0_31 = "(?i)(?:powershell\\s+[^\\n]*(?:iex|invoke-expression|downloadstring|downloadfile|webclient|bitstransfer|start-bitstransfer)|certutil\\s+[^\\n]*-(?:urlcache|decode)|bitsadmin\\s+[^\\n]*/transfer|mshta\\s+(?:vbscript|javascript|http)|regsvr32\\s+[^\\n]*/[siu][^\\n]*(?:http|\\\\\\\\)|rundll32\\s+[^\\n]*(?:javascript|http|shell32)|wmic\\s+[^\\n]*(?:process\\s+call\\s+create|os\\s+get))"
    l_0_32 = 60
    l_0_33 = "Execution_2"
    l_0_32 = "(?i)\\\\(SAM|SYSTEM|SECURITY|software|default)(\\.old|\\.bak|\\.save|\\.copy)?$"
    l_0_33 = 100
    l_0_34 = "CredentialAccess_2"
    l_0_33 = "(?i)%SYSTEMROOT%\\\\repair\\\\(SAM|system|software|security)"
    l_0_34 = 95
    l_0_35 = "CredentialAccess_3"
    l_0_34 = "(?i)\\\\config\\\\RegBack\\\\(SAM|SYSTEM|SECURITY|software|default)"
    l_0_35 = 95
    l_0_36 = "CredentialAccess_4"
    l_0_35 = "(?i)\\\\NTDS\\\\ntds\\.dit"
    l_0_36 = 100
    l_0_37 = "CredentialAccess_5"
    l_0_36 = "(?i)(sysprep\\.(xml|inf)|unattend(ed)?\\.xml|autounattend\\.xml)"
    l_0_37 = 90
    l_0_38 = "CredentialAccess_6"
    l_0_37 = "(?i)\\\\Panther\\\\(Unattend(ed)?\\.xml|setupinfo)"
    l_0_38 = 85
    -- DECOMPILER ERROR at PC254: Overwrote pending register: R24 in 'AssignReg'

    l_0_38 = "(?i)\\\\PSReadLine\\\\ConsoleHost_history\\.txt"
    local l_0_39 = {"(?i)\\\\Microsoft\\\\Credentials\\\\[A-F0-9]{32}", 90, "CredentialAccess_10"}
    local l_0_40 = {"(?i)\\\\Microsoft\\\\Protect\\\\[A-Z0-9-]+\\\\[a-f0-9-]+", 95, "CredentialAccess_11"}
    local l_0_41 = {"(?i)\\.ssh\\\\(id_rsa|id_dsa|id_ecdsa|id_ed25519|known_hosts|authorized_keys)", 95, "CredentialAccess_12"}
    local l_0_42 = {"(?i)Software\\\\OpenSSH\\\\Agent\\\\Keys", 90, "CredentialAccess_13"}
    local l_0_43 = {"(?i)Software\\\\SimonTatham\\\\PuTTY\\\\(Sessions|SshHostKeys)", 85, "CredentialAccess_14"}
    local l_0_44 = {"(?i)\\\\Terminal Server Client\\\\(Servers|Default)", 80, "CredentialAccess_15"}
    local l_0_45 = {"(?i)RDCMan\\.settings", 85, "CredentialAccess_16"}
    local l_0_46 = {"(?i)cmdkey\\s+/list", 70, "CredentialAccess_17"}
    local l_0_47 = {"(?i)\\\\Google\\\\Chrome\\\\User Data\\\\(Default|Profile \\d+)\\\\(Login Data|Cookies|History)", 90, "CredentialAccess_18"}
    local l_0_48 = {"(?i)\\\\Mozilla\\\\Firefox\\\\Profiles\\\\[a-z0-9]+\\.(default|default-release)\\\\(logins\\.json|key[34]\\.db|cookies\\.sqlite)", 90, "CredentialAccess_19"}
    local l_0_49 = {"(?i)\\\\Microsoft\\\\Edge\\\\User Data\\\\(Default|Profile \\d+)\\\\Login Data", 90, "CredentialAccess_20"}
    local l_0_50 = {"(?i)\\\\\\.aws\\\\credentials", 95, "CredentialAccess_21"}
    local l_0_51 = {"(?i)\\\\gcloud\\\\(credentials\\.db|legacy_credentials|access_tokens\\.db)", 95, "CredentialAccess_22"}
    local l_0_52 = {"(?i)\\\\\\.azure\\\\(accessTokens\\.json|azureProfile\\.json)", 95, "CredentialAccess_23"}
    local l_0_53 = {"(?i)(ultravnc\\.ini|\\.vnc|vnc\\.ini|TightVNC\\\\Server)", 85, "CredentialAccess_24"}
    local l_0_54 = {"(?i)\\\\inetpub\\\\.*\\\\web\\.config", 85, "CredentialAccess_25"}
    local l_0_55 = {"(?i)\\\\system32\\\\inetsrv\\\\(appcmd\\.exe|config\\\\applicationHost\\.config)", 80, "CredentialAccess_26"}
    local l_0_56 = {"(?i)Groups\\.xml|Services\\.xml|Scheduledtasks\\.xml|DataSources\\.xml|Printers\\.xml|Drives\\.xml", 95, "CredentialAccess_27"}
    local l_0_57 = {"(?i)cpassword\\s*=\\s*[\'\"][A-Za-z0-9+/=]+[\'\"]", 100, "CredentialAccess_28"}
    local l_0_58 = {"(?i)\\\\Microsoft\\.MicrosoftStickyNotes_.*\\\\LocalState\\\\plum\\.sqlite", 75, "Collection_1"}
    local l_0_59 = {"(?i)\\\\system32\\\\config\\\\(AppEvent\\.Evt|SecEvent\\.Evt)", 60, "Discovery_1"}
    local l_0_60 = {"(?i)(procdump|comsvcs\\.dll|MiniDumpWriteDump).*lsass", 100, "CredentialAccess_29"}
    local l_0_61 = {"(?i)\\\\Windows Defender\\\\Exclusions\\\\(Paths|Extensions|Processes)", 85, "DefenseEvasion_1"}
    local l_0_62 = {"(?i)SOFTWARE\\\\Policies\\\\Microsoft\\\\[Ww]indows\\\\Installer.*AlwaysInstallElevated", 95, "PrivilegeEscalation_1"}
    local l_0_63 = {"(?i)\\\\Winlogon.*(DefaultPassword|DefaultUserName|AutoAdminLogon)", 95, "CredentialAccess_30"}
    local l_0_64 = {"(?i)\\\\[Ww]indows\\\\CCM\\\\(SCClient\\.exe|Logs\\\\.*\\.log)", 70, "Discovery_2"}
    l_0_38, l_0_37, l_0_36, l_0_35, l_0_34, l_0_33, l_0_32, l_0_31, l_0_30 = {"(?i)\\\\Microsoft\\\\[Ww]indows\\\\PowerShell\\\\PSReadLine\\\\", 80, "CredentialAccess_9"}, {l_0_38, 85, "CredentialAccess_8"}, {l_0_37, l_0_38, 
{"(?i)[\"\']\\s*role\\s*[\"\']\\s*:\\s*[\"\']system[\"\'][^}]{0,400}[\"\']content[\"\']\\s*:\\s*[\"\'][^\\n\\r\"\']{0,200}(?:ignore|bypass|override|disregard|forget)\\s+(?:all\\s+)?(?:previous|prior|above)\\s+(?:instructions?|rules?|prompts?)", 70, "Inj_JsonRoleInject"}
}, {l_0_36, l_0_37, l_0_38}, {l_0_35, l_0_36, l_0_37}, {l_0_34, l_0_35, l_0_36}, {l_0_33, l_0_34, l_0_35}, {l_0_32, l_0_33, l_0_34}, {l_0_31, l_0_32, l_0_33}
    l_0_32 = "(?i)/etc/(hosts|hostname|resolv\\.conf|network/interfaces)"
    l_0_33 = 65
    l_0_34 = "Discovery_1"
    l_0_33 = "(?i)/etc/php.*/(php\\.ini|conf\\.d/)"
    l_0_34 = 65
    l_0_35 = "Discovery_2"
    l_0_34 = "(?i)\\.(bak|backup|old|orig|save|swp|~)$"
    l_0_35 = 65
    l_0_36 = "Discovery_3"
    l_0_35 = "(?i)/etc/nsswitch\\.conf"
    l_0_36 = 65
    l_0_37 = "Discovery_4"
    l_0_36 = "(?i)/etc/(fstab|mtab|exports)"
    l_0_37 = 70
    l_0_38 = "Discovery_5"
    l_0_37 = "(?i)/var/log/(auth\\.log|secure|syslog|messages|faillog|lastlog)"
    l_0_38 = 70
    l_0_39 = "Discovery_6"
    l_0_38 = "(?i)/var/(mail|spool/mail)/"
    l_0_39 = 70
    l_0_40 = "Collection_1"
    l_0_39 = "(?i)/(etc/init\\.d|etc/systemd/system|lib/systemd/system)/"
    l_0_40 = 75
    l_0_41 = "Persistence_1"
    l_0_40 = "(?i)/etc/(apache2|httpd|nginx)/(sites-(enabled|available)/|conf\\.d/|\\.htpasswd)"
    l_0_41 = 75
    l_0_42 = "Discovery_7"
    l_0_41 = "(?i)/proc/(self|[0-9]+)/(environ|cmdline|maps|mem|fd/)"
    l_0_42 = 75
    l_0_43 = "Discovery_8"
    l_0_42 = "(?i)getcap\\s+-r\\s+/"
    l_0_43 = 75
    l_0_44 = "PrivilegeEscalation_1"
    l_0_43 = "(?i)/etc/(cron\\.\\w+|crontab|anacrontab|at\\.\\w+)"
    l_0_44 = 80
    l_0_45 = "Persistence_2"
    l_0_44 = "(?i)/var/spool/cron/(crontabs/|atjobs/)"
    l_0_45 = 80
    l_0_46 = "Persistence_3"
    l_0_45 = "(?i)/etc/redis(\\.conf|/redis\\.conf)"
    l_0_46 = 80
    l_0_47 = "CredentialAccess_2"
    l_0_46 = "(?i)find\\s+/\\s+.*-perm\\s+[+-]?[46]000"
    l_0_47 = 80
    l_0_48 = "PrivilegeEscalation_2"
    l_0_47 = "(?i)/etc/pam\\.d/(common-auth|system-auth|password-auth)"
    l_0_48 = 80
    l_0_49 = "Persistence_4"
    l_0_48 = "(?i)/var/run/sudo/ts/"
    l_0_49 = 85
    l_0_50 = "PrivilegeEscalation_3"
    l_0_49 = "(?i)(\\.|_)(bash_history|zsh_history|sh_history|history|mysql_history|psql_history)"
    l_0_50 = 85
    l_0_51 = "CredentialAccess_3"
    l_0_50 = "(?i)\\.docker/(config\\.json|daemon\\.json)"
    l_0_51 = 85
    l_0_52 = "CredentialAccess_4"
    l_0_51 = "(?i)\\.(ovpn|conf)$.*auth-user-pass"
    l_0_52 = 85
    l_0_53 = "CredentialAccess_5"
    l_0_52 = "(?i)\\.htpasswd|\\.htaccess"
    l_0_53 = 85
    l_0_54 = "CredentialAccess_6"
    l_0_53 = "(?i)/etc/(my\\.cnf|mysql/my\\.cnf|mariadb/my\\.cnf)"
    l_0_54 = 85
    l_0_55 = "CredentialAccess_7"
    l_0_54 = "(?i)/etc/ldap\\.(conf|secret)|/etc/openldap/ldap\\.conf"
    l_0_55 = 85
    l_0_56 = "CredentialAccess_8"
    l_0_55 = "(?i)(ansible\\.cfg|vault_pass\\.txt|\\.vault_pass)"
    l_0_56 = 85
    l_0_57 = "CredentialAccess_9"
    l_0_56 = "(?i)/etc/(sudoers|sudoers\\.d/)"
    l_0_57 = 90
    l_0_58 = "PrivilegeEscalation_4"
    l_0_57 = "(?i)\\.git-credentials|\\.gitconfig"
    l_0_58 = 90
    l_0_59 = "CredentialAccess_10"
    l_0_58 = "(?i)\\.my\\.cnf|\\.pgpass|\\.pgsql_history"
    l_0_59 = 90
    l_0_60 = "CredentialAccess_11"
    l_0_59 = "(?i)\\.gnupg/(secring\\.gpg|private-keys-v1\\.d/)"
    l_0_60 = 90
    l_0_61 = "CredentialAccess_12"
    l_0_60 = "(?i)(tomcat-users\\.xml|server\\.xml|context\\.xml)"
    l_0_61 = 90
    l_0_62 = "CredentialAccess_13"
    l_0_61 = "(?i)/(etc/ssl|etc/pki)/(private/|certs/).*\\.(key|pem|crt)$"
    l_0_62 = 90
    l_0_63 = "CredentialAccess_14"
    l_0_62 = "(?i)/etc/krb5\\.(conf|keytab)|\\.k5login"
    l_0_63 = 90
    l_0_64 = "CredentialAccess_15"
    l_0_63 = "(?i)/etc/exports.*no_root_squash"
    l_0_64 = 90
    l_0_64 = "(?i)\\.terraform(rc|\\.tfstate)"
    local l_0_65 = {"(?i)/etc/ssh/(ssh_host_.*_key|sshd_config)", 95, "CredentialAccess_18"}
    local l_0_66 = {"(?i)\\.aws/(credentials|config)", 95, "CredentialAccess_19"}
    local l_0_67 = {"(?i)\\.config/gcloud/(credentials\\.db|legacy_credentials|access_tokens\\.db)", 95, "CredentialAccess_20"}
    local l_0_68 = {"(?i)\\.azure/(accessTokens\\.json|azureProfile\\.json)", 95, "CredentialAccess_21"}
    local l_0_69 = {"(?i)/var/run/docker\\.sock", 95, "PrivilegeEscalation_6"}
    local l_0_70 = {"(?i)\\.kube/(config|credentials)", 95, "CredentialAccess_22"}
    local l_0_71 = {"(?i)\\.kdbx?$|KeePass\\.config", 95, "CredentialAccess_23"}
    local l_0_72 = {"(?i)credentials\\.xml|secrets/(master\\.key|hudson\\.util\\.Secret)", 95, "CredentialAccess_24"}
    local l_0_73 = {"(?i)/etc/(passwd|shadow|shadow-|gshadow|master\\.passwd|spwd\\.db)", 100, "CredentialAccess_25"}
    l_0_64, l_0_63, l_0_62, l_0_61, l_0_60, l_0_59, l_0_58, l_0_57, l_0_56, l_0_55, l_0_54, l_0_53, l_0_52, l_0_51, l_0_50, l_0_49, l_0_48, l_0_47, l_0_46, l_0_45, l_0_44, l_0_43, l_0_42, l_0_41, l_0_40, l_0_39, l_0_38, l_0_37, l_0_36, l_0_35, l_0_34, l_0_33, l_0_32, l_0_31 = {"(?i)/etc/(pwd\\.db|group|gshadow-)", 95, "CredentialAccess_17"}, {l_0_64, 90, "CredentialAccess_16"}, {l_0_63, l_0_64, "PrivilegeEscalation_5"}, {l_0_62, l_0_63, l_0_64}, {l_0_61, l_0_62, l_0_63}, {l_0_60, l_0_61, l_0_62}, {l_0_59, l_0_60, l_0_61}, {l_0_58, l_0_59, l_0_60}, {l_0_57, l_0_58, l_0_59}, {l_0_56, l_0_57, l_0_58}, {l_0_55, l_0_56, l_0_57}, {l_0_54, l_0_55, l_0_56}, {l_0_53, l_0_54, l_0_55}, {l_0_52, l_0_53, l_0_54}, {l_0_51, l_0_52, l_0_53}, {l_0_50, l_0_51, l_0_52}, {l_0_49, l_0_50, l_0_51}, {l_0_48, l_0_49, l_0_50}, {l_0_47, l_0_48, l_0_49}, {l_0_46, l_0_47, l_0_48}, {l_0_45, l_0_46, l_0_47}, {l_0_44, l_0_45, l_0_46}, {l_0_43, l_0_44, l_0_45}, {l_0_42, l_0_43, l_0_44}, {l_0_41, l_0_42, l_0_43}, {l_0_40, l_0_41, l_0_42}, {l_0_39, l_0_40, l_0_41}, {l_0_38, l_0_39, l_0_40}, {l_0_37, l_0_38, l_0_39}, {l_0_36, l_0_37, l_0_38}, {l_0_35, l_0_36, l_0_37}, {l_0_34, l_0_35, l_0_36}, {l_0_33, l_0_34, l_0_35}, {l_0_32, l_0_33, l_0_34}
    l_0_31 = versioning
    l_0_31 = l_0_31.GetHostOsType
    l_0_31 = l_0_31()
    if l_0_31 == 1 then
      l_0_27 = true
    end
    if l_0_27 then
      l_0_32 = ipairs
      l_0_33, l_0_29 = l_0_29, {l_0_30, l_0_31, l_0_32, l_0_33, l_0_34, l_0_35, l_0_36, l_0_37, l_0_38, l_0_39, l_0_40, l_0_41, l_0_42, l_0_43, l_0_44, l_0_45, l_0_46, l_0_47, l_0_48, l_0_49, l_0_50, l_0_51, l_0_52, l_0_53, l_0_54, l_0_55, l_0_56, l_0_57, l_0_58, l_0_59, l_0_60, l_0_61, l_0_62, l_0_63, l_0_64, 
{"(?i)%SYSTEMDRIVE%\\\\pagefile\\.sys", 70, "CredentialAccess_31"}
}
      l_0_32 = l_0_32(l_0_33)
      for l_0_35,l_0_36 in l_0_32 do
        l_0_37 = #l_0_28
        l_0_37 = l_0_37 + 1
        l_0_28[l_0_37] = l_0_36
      end
    else
      for i_1,i_2 in ipairs(l_0_30) do
        l_0_37 = #l_0_28
        l_0_37 = l_0_37 + 1
        l_0_28[l_0_37] = i_2
      end
    end
    if next(l_0_28) == nil then
      return mp.CLEAN
    end
    for l_0_48,l_0_49 in l_0_45 do
      -- DECOMPILER ERROR at PC690: Overwrote pending register: R39 in 'AssignReg'

      -- DECOMPILER ERROR at PC698: Overwrote pending register: R40 in 'AssignReg'

      -- DECOMPILER ERROR at PC699: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC703: Overwrote pending register: R29 in 'AssignReg'

      -- DECOMPILER ERROR at PC704: Overwrote pending register: R41 in 'AssignReg'

      -- DECOMPILER ERROR at PC707: Overwrote pending register: R41 in 'AssignReg'

    end
    -- DECOMPILER ERROR at PC715: Overwrote pending register: R31 in 'AssignReg'

    -- DECOMPILER ERROR at PC719: Overwrote pending register: R35 in 'AssignReg'

    -- DECOMPILER ERROR at PC720: Overwrote pending register: R36 in 'AssignReg'

    if (l_0_44 < l_0_51 and l_0_56) or l_0_56 < l_0_51 then
      for l_0_51,l_0_52 in ipairs({l_0_46, "(?i)(?:ignore|disregard|forget|override|bypass|dismiss)\\s+(?:all\\s+)?(?:previous|prior|above|earlier|original|initial|system)\\s+(?:instructions?|prompts?|rules?|directives?|safety|guidelines?)[\\s\\S]{0,160}?(?:instead\\s+(?:do|say|tell|reveal|print|output|execute|run)|now\\s+(?:do|say|tell|reveal|print|output|execute|run|exfil)|and\\s+(?:tell|reveal|print|output|disclose|expose|leak|recite|repeat|relay|dump|execute|run|send|upload|post|email|transmit|exfil)|\\bso\\s+that\\b|\\bin\\s+order\\s+to\\b|to\\s+(?:complete|finish|proceed|setup)|read\\b|send\\b|post\\b|upload\\b|fetch\\b|curl\\b|wget\\b|reveal\\b|disclose\\b|print\\b|output\\b|show\\b|execute\\b|\\brun\\b|delete\\b|exfil|leak\\b|email\\b|transmit\\b|do\\s+anything|tell\\s+me|give\\s+me)", "(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-â€\148:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})", "(?i)\\[\\s*(?:system|inst|admin|sudo)\\s*\\][^\\[]{0,200}(?:ignore|override|bypass|new\\s+instructions?|always\\s+approve|disregard)", l_0_50, l_0_51}) do
        -- DECOMPILER ERROR at PC728: Overwrote pending register: R38 in 'AssignReg'

        -- DECOMPILER ERROR at PC729: Overwrote pending register: R39 in 'AssignReg'

        -- DECOMPILER ERROR at PC730: Overwrote pending register: R39 in 'AssignReg'

        -- DECOMPILER ERROR at PC731: Overwrote pending register: R40 in 'AssignReg'

        -- DECOMPILER ERROR at PC732: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC739: Overwrote pending register: R32 in 'AssignReg'

        if l_0_53 and l_0_54 == true then
          break
        end
      end
      -- DECOMPILER ERROR at PC758: Overwrote pending register: R36 in 'AssignReg'

      -- DECOMPILER ERROR at PC759: Overwrote pending register: R37 in 'AssignReg'

      if l_0_42.PromptInjection or not true or 0 ~= 6 or 0 < l_0_24 then
        for l_0_54,l_0_55 in l_0_51(l_0_52) do
          -- DECOMPILER ERROR at PC763: Overwrote pending register: R41 in 'AssignReg'

          -- DECOMPILER ERROR at PC764: Overwrote pending register: R41 in 'AssignReg'

          -- DECOMPILER ERROR at PC765: Confused about usage of register: R34 in 'UnsetPending'

          -- DECOMPILER ERROR at PC765: Confused about usage of register: R34 in 'UnsetPending'

          -- DECOMPILER ERROR at PC766: Overwrote pending register: R41 in 'AssignReg'

          -- DECOMPILER ERROR at PC767: Overwrote pending register: R41 in 'AssignReg'

          -- DECOMPILER ERROR at PC769: Confused about usage of register: R35 in 'UnsetPending'

          -- DECOMPILER ERROR at PC769: Confused about usage of register: R35 in 'UnsetPending'

        end
        -- DECOMPILER ERROR at PC772: Confused about usage of register: R17 in 'UnsetPending'

        -- DECOMPILER ERROR at PC809: Confused about usage of register: R17 in 'UnsetPending'

        -- DECOMPILER ERROR at PC809: Overwrote pending register: R39 in 'AssignReg'

        -- DECOMPILER ERROR at PC813: Confused about usage of register: R21 in 'UnsetPending'

        -- DECOMPILER ERROR at PC813: Overwrote pending register: R40 in 'AssignReg'

        -- DECOMPILER ERROR at PC820: Confused about usage of register: R34 in 'UnsetPending'

        -- DECOMPILER ERROR at PC827: Confused about usage of register: R17 in 'UnsetPending'

        -- DECOMPILER ERROR at PC827: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC830: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC833: Confused about usage of register: R21 in 'UnsetPending'

        -- DECOMPILER ERROR at PC833: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC836: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC839: Overwrote pending register: R41 in 'AssignReg'

        -- DECOMPILER ERROR at PC841: Overwrote pending register: R42 in 'AssignReg'

        -- DECOMPILER ERROR at PC844: Overwrote pending register: R42 in 'AssignReg'

        -- DECOMPILER ERROR at PC845: Confused about usage of register: R35 in 'UnsetPending'

        -- DECOMPILER ERROR at PC846: Overwrote pending register: R43 in 'AssignReg'

        -- DECOMPILER ERROR at PC851: Overwrote pending register: R44 in 'AssignReg'

        -- DECOMPILER ERROR at PC852: Confused about usage of register: R35 in 'UnsetPending'

        -- DECOMPILER ERROR at PC852: Confused about usage of register: R35 in 'UnsetPending'

        -- DECOMPILER ERROR at PC856: Overwrote pending register: R42 in 'AssignReg'

        -- DECOMPILER ERROR at PC860: Overwrote pending register: R42 in 'AssignReg'

        -- DECOMPILER ERROR at PC864: Overwrote pending register: R42 in 'AssignReg'

        -- DECOMPILER ERROR at PC867: Overwrote pending register: R43 in 'AssignReg'

        -- DECOMPILER ERROR at PC868: Overwrote pending register: R43 in 'AssignReg'

        if (((false and not not l_0_24 <= l_0_42.PromptInjection or 0 or not l_0_42.CBRN and l_0_24 <= not l_0_42.PrivilegeEscalation and l_0_24 <= not l_0_42.Execution and l_0_24 <= l_0_24 <= l_0_42.CredentialAccess or 0 or 0 or 0 or 0) or l_0_56) and not l_0_23 <= 0 + l_0_55 and l_0_26 <= #{} and (l_0_54 or 0) + (l_0_55 or 0) > 0) or not l_0_57 then
          return l_0_58
        end
        -- DECOMPILER ERROR at PC871: Overwrote pending register: R44 in 'AssignReg'

        -- DECOMPILER ERROR at PC872: Overwrote pending register: R44 in 'AssignReg'

        -- DECOMPILER ERROR at PC873: Overwrote pending register: R45 in 'AssignReg'

        l_0_59 = l_0_59(l_0_60)
        if l_0_59 then
          l_0_59 = mp
          l_0_59 = l_0_59.get_contextdata
          -- DECOMPILER ERROR at PC880: Overwrote pending register: R45 in 'AssignReg'

          -- DECOMPILER ERROR at PC881: Overwrote pending register: R45 in 'AssignReg'

          l_0_59 = l_0_59(l_0_60)
        end
        l_0_59 = mp
        l_0_59 = l_0_59.get_mpattribute
        -- DECOMPILER ERROR at PC886: Overwrote pending register: R45 in 'AssignReg'

        l_0_59 = l_0_59(l_0_60)
        if l_0_59 then
          do
            l_0_59 = mp
            l_0_59 = l_0_59.get_mpattribute
            -- DECOMPILER ERROR at PC893: Overwrote pending register: R45 in 'AssignReg'

            l_0_59 = l_0_59(l_0_60)
            -- DECOMPILER ERROR at PC899: Overwrote pending register: R45 in 'AssignReg'

            -- DECOMPILER ERROR at PC900: Overwrote pending register: R46 in 'AssignReg'

            if l_0_59 then
              l_0_62 = "get_mpattributevalue"
              -- DECOMPILER ERROR at PC902: Overwrote pending register: R46 in 'AssignReg'

              l_0_62 = "MpODR_MCP_CLIENT_PKG_ID"
              l_0_60 = l_0_60(l_0_61(l_0_62))
              l_0_60 = "server_pkg_id"
              -- DECOMPILER ERROR at PC912: Overwrote pending register: R48 in 'AssignReg'

              l_0_60 = "mcp_server_name"
              -- DECOMPILER ERROR at PC925: Overwrote pending register: R43 in 'AssignReg'

              l_0_59 = {type = "MpIsAiMcpODRScan", client_pkg_id = l_0_60, [l_0_60] = tostring((mp[l_0_63])(l_0_63)), [l_0_60] = tostring((mp.get_mpattributevalue)("MpODR_MCP_SERVER_NAME"))}
            end
            l_0_60 = pairs
            l_0_60 = l_0_60(l_0_58)
            for i_1,l_0_64 in l_0_60 do
              l_0_65, l_0_59 = #l_0_59, {}
              l_0_66 = 1
              l_0_65 = l_0_65 + l_0_66
              l_0_66 = 
              l_0_67 = "="
              l_0_68 = tostring
              l_0_69 = l_0_64
              l_0_68 = l_0_68(l_0_69)
              l_0_66 = l_0_66 .. l_0_67 .. l_0_68
              l_0_59[l_0_65] = l_0_66
            end
            -- DECOMPILER ERROR at PC945: Confused about usage of register: R33 in 'UnsetPending'

            -- DECOMPILER ERROR at PC957: Confused about usage of register: R35 in 'UnsetPending'

            -- DECOMPILER ERROR at PC965: Confused about usage of register: R34 in 'UnsetPending'

            -- DECOMPILER ERROR at PC971: Confused about usage of register: R35 in 'UnsetPending'

            if (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID) then
              (MpCommon.BmTriggerSig)((mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID), l_0_65, l_0_66)
            end
            -- DECOMPILER ERROR at PC1027: Confused about usage of register: R45 in 'UnsetPending'

            ;
            (mp.SetDetectionString)({score = tostring(0 + l_0_55), threshold = tostring(l_0_23), matched = (table.concat)({}, ","), categories = (table.concat)({}, ","), count = tostring(#{}), max_single = tostring(l_0_44), trigger = tostring(l_0_57), scaninfo = (table.concat)(l_0_59, ","), ostype = l_0_31 or 0, buffer = (MpCommon.Base64Encode)(tostring(l_0_6))})
            do return mp.INFECTED end
            -- DECOMPILER ERROR at PC1033: Confused about usage of register R49 for local variables in 'ReleaseLocals'

            -- DECOMPILER ERROR: 25 unprocessed JMP targets
          end
        end
      end
    end
  end
end

