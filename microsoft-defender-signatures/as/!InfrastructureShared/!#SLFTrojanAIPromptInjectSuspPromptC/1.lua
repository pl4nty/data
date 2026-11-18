-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:AIPromptInject/SuspPrompt.C
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: MpIsAiNetPromptScan

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

-- [unluac error] diagnostic pseudocode: recovery errors; output may not recompile or preserve behavior

local r0_0, r0_1, r0_2, r0_3, r0_4 = 1536000, 16, 150, 2, 90
local r0_5 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if r0_5 ~= nil and r0_5 == mp.SCANREASON_NET_PROMPTSTREAM then
  local r0_6 = mp.getfilesize() or 0
  if r0_0 < r0_6 then
    r0_6 = r0_0
  end
  local r0_7 = nil
  if r0_1 <= r0_6 then
    mp.readprotection(false)
    local r0_8 = mp.readfile(0, r0_6)
    mp.readprotection(true)
    if r0_8 ~= nil then
      r0_7 = tostring(r0_8)
    end
  end
  if not r0_7 or #r0_7 < r0_1 then
    local r0_9 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_LAST_MESSAGE)
    if r0_9 ~= nil then
      r0_7 = tostring(r0_9)
    end
  end
  if r0_7 and not (#r0_7 < r0_1) then
    if #r0_7 > r0_0 then
      r0_7 = string.sub(r0_7, 1, r0_0)
    end
    local r0_10 = string.lower(r0_7)
    local r0_11 = string.match(r0_7, '"hook_event_name"%s*:%s*"([%a_]+)"')
    local r0_12 = string.match(r0_7, '"tool_?[Nn]ame"%s*:%s*"([%w_%-%.]+)"')
    if r0_11 ~= nil or r0_12 ~= nil then
      if r0_11 == "Stop" then
        return mp.CLEAN
      end
      if string.find(r0_10, "last_assistant_message", 1, true) then
        return mp.CLEAN
      end
      if r0_12 ~= nil then
        local r0_13 = string.lower(r0_12)
        if r0_13 == "web_fetch"
          or r0_13 == "web_search"
          or r0_13 == "webfetch"
          or r0_13 == "websearch"
          or r0_13 == "view"
          or r0_13 == "grep"
          or r0_13 == "write"
          or r0_13 == "edit" then
          return mp.CLEAN
        end
      end
    end
    local r0_14 = {
      "!#scpt:", "[genlast name=", "[genfinalizer name=", "[genfirst name=", "md.signatures",
      "mavsigs"
    }
    for r0_15, r0_16 in ipairs(r0_14) do
      if string.find(r0_10, r0_16, 1, true) then
        return mp.CLEAN
      end
    end
    local r0_17 = {
      "security testing", "penetration test", "pen-test", "pentest exercise", "red team exercise",
      "unit test", "test fixture", "cis benchmark", "hardening guide", "owasp top", "owasp llm top",
      "example of prompt injection", "documentation example", "sample prompt", "prompt engineering",
      "ai safety research", "llm safety", "system prompt example", "chat template",
      "agent framework", "ai red team exercise", "garak benchmark", "agent threat rule",
      "agent-threat-rule", "atr-2026-"
    }
    for r0_18, r0_19 in ipairs(r0_17) do
      if string.find(r0_10, r0_19, 1, true) then
        return mp.CLEAN
      end
    end
    local r0_20, r0_21 = pcall(MpCommon.StringRegExpSearch,
      "(?i)(?:\\b(?:cat|tac|xxd|hexdump|strings|grep|awk|sed|tar|zip|unzip|7z|gzip|scp|rsync|curl|wget|nc|ncat|socat|ssh|sftp|ftp|base64|openssl|gpg|certutil|powershell|pwsh|iex|invoke-expression|invoke-webrequest|invoke-restmethod|get-content|out-file|set-content|copy-item|move-item|remove-item|start-process|new-object|reg\\.exe|regedit|sc\\.exe|schtasks|wmic|bitsadmin|mshta|regsvr32|rundll32|whoami|systeminfo|tasklist|netsh|nslookup|sudo|chmod|chown|crontab|systemctl|exfiltrat(?:e|ion)|exfil|upload|download|leak|dump|harvest|steal|exec(?:ute)?|invoke|spawn|launch)\\b|>>\\s*[/\\\\]|>\\s*[/\\\\]|\\|\\s*(?:base64|sh|bash|zsh|cmd|powershell|pwsh)\\b|2>&1)",
      r0_7)
    local r0_22 = r0_20 == true and r0_21 == true
    local r0_23, r0_24, r0_25, r0_26, r0_27, r0_28, r0_29, r0_30, r0_31 = "PromptInjection", "ToolPoisoning", "CredentialAccess", "Execution", "PrivilegeEscalation", "Exfiltration", "ExcessiveAutonomy", "ModelAbuse", "CBRN"
    local r0_32 = {}
    local r0_33 = {}
    local r0_34 = r0_23
    r0_33[1] = "(?i)(?:ignore|disregard|forget|override|bypass|dismiss)\\s+(?:all\\s+)?(?:previous|prior|above|earlier|original|initial|system)\\s+(?:instructions?|prompts?|rules?|directives?)[\\s\\S]{0,120}?(?:instead|now\\s+(?:do|tell|reveal|print|output|say|execute|run)|and\\s+(?:tell|reveal|print|output|disclose|expose|leak|recite|repeat|relay|dump)|\\bso\\s+that\\b|\\bin\\s+order\\s+to\\b)"
    r0_33[2] = 80
    r0_33[3] = "Atr_Inj_IgnoreThenHijack"
    r0_33[4] = r0_34
    r0_33[5] = false
    local r0_35 = {
      "(?i)<<SYS>>|<\\|im_start\\|>|<\\|system\\|>|\\[INST\\]|\\[/INST\\]", 70,
      "Atr_Inj_TemplateTokens", r0_23, false
    }
    local r0_36 = {
      "(?i)\\[\\s*(?:system|inst|admin|sudo)\\s*\\][^\\[]{0,200}(?:ignore|override|bypass|new\\s+instructions?|always\\s+approve|disregard)",
      70, "Atr_Inj_FakeSystemTag", r0_23, false
    }
    local r0_37 = {
      "(?i)\\b(?:DAN|STAN|DUDE)\\b\\s*(?:mode|prompt|jailbreak)|developer\\s+mode\\s+(?:enabled|on)|do\\s+anything\\s+now|\\bjailbroken?\\b",
      80, "Atr_Inj_Jailbreak", r0_23, false
    }
    r0_34 = {
      "(?i)(?:all\\s+)?(?:safety\\s+(?:guidelines?|protocols?|restrictions?|filters?|rules?|measures?|constraints?)|(?:ethical\\s+)?(?:guidelines?|restrictions?|constraints?)|guardrails?)\\s+(?:are\\s+)?(?:suspended|disabled|lifted|removed|bypassed|deactivated|off)\\b|(?:operating|running|now)\\s+in\\s+(?:unrestricted|uncensored|jailbroken|unsafe)\\s+mode|(?:\\b|\\\\[rn])(?:there\\s+are|you\\s+have)\\s+no\\s+(?:(?:moral|ethical|safety)\\s+(?:(?:or|and)\\s+)?){1,2}(?:restrictions?|constraints?|limits?)\\b",
      70, "Atr_Inj_SafetyBypass", r0_23, false
    }
    local r0_38 = {
      "(?i)(?:\\b|\\\\[rn])you\\s+are\\s+(?:not|no\\s+longer)\\s+(?:an?\\s+)?(?:ai\\s+)?assistant\\b[\\s\\S]{0,80}?(?:\\b|\\\\[rn])you\\s+are\\s+(?:an?\\s+)?(?:living\\s+)?(?:post[-\\s]exploitation|offensive|unrestricted)\\s+(?:tool|agent)\\b",
      70, "Atr_Inj_WeaponizedPersona", r0_23, false
    }
    local r0_39 = {
      "(?:\\xE2\\x80[\\x8B-\\x8D]|\\xE2\\x81\\xA0|\\xEF\\xBB\\xBF){5,}", 50, "Atr_Inj_ZeroWidth",
      r0_23, false
    }
    local r0_40 = {
      "(?i)(?:act\\s+(?:like|as)|pretend\\s+to\\s+be|roleplay\\s+as)\\s+(?:my\\s+)?(?:deceased|dead|late)\\s+(?:grandmother|grandma|grandfather|relative)",
      60, "Atr_Inj_Grandma", r0_23, false
    }
    local r0_41 = {
      "(?i)(?:ignore|disregard|forget|override)[^\\n\\r]{0,60}(?:previous|prior|above)\\s+instructions?[^\\n\\r]{0,80}(?:print|say|output|reveal|disclose|spell-?check|translate|echo|repeat|relay)[^\\n\\r]{0,40}(?:previous|prior|original|system)\\s+(?:instructions?|prompt)",
      70, "Atr_Inj_GoalHijack", r0_23, false
    }
    local r0_42 = {
      "(?i)<\\s*important\\s*>[^<]{0,400}(?:ignore|override|bypass|always\\s+approve|disregard|skip\\s+confirm)[^<]{0,200}<\\s*/\\s*important\\s*>",
      80, "Atr_Tool_ImportantTag", r0_24, false
    }
    local r0_43 = {
      "(?i)note\\s+to\\s+(?:ai|llm|assistant|agent)\\s{0,5}[^\\n\\r]{0,200}(?:disregard|ignore|bypass|skip)[^\\n\\r]{0,80}(?:safety|security|guardrail|policy|confirmation)",
      70, "Atr_Tool_NoteToAI", r0_24, false
    }
    local r0_44 = {
      "(?i)without\\s+asking\\s+(?:the\\s+)?(?:user\\s+)?(?:for\\s+)?(?:confirmation|permission|approval)[^\\n\\r]{0,80}(?:always\\s+(?:pass|send|execute|run|invoke)|directly\\s+to|automatically|silently)",
      60, "Atr_Tool_NoConfirm", r0_24, false
    }
    local r0_45 = {
      "(?:169\\.254\\.169\\.254|metadata\\.google\\.internal|metadata\\.azure\\.com|169\\.254\\.170\\.2)",
      50, "Atr_Tool_SsrfImds", r0_24, false
    }
    local r0_46 = {
      "(?i)(?:\\b|\\\\[rn])(?:(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?|keys?\\s+for\\s+an?\\s+(?:llm|ai)(?:\\s*\\([^)]{0,256}\\))?)\\s+(?:(?:must|shall)\\s+be\\s+(?:exfiltrated|stolen|harvested)\\b|(?:are|is)\\s+(?:the\\s+)?(?:absolute|top|highest)\\s+priority\\s*[.!;:](?:\\s|\\\\[rn])+exfiltrate\\s+(?:first|immediately)\\b)|you\\s+(?:must|shall)\\s+(?:exfiltrate|steal|harvest)\\s+(?:(?:all|every|any|the)\\s+)?(?:api[_\\s-]+keys?|access[_\\s-]+tokens?|credentials?)\\b)",
      70, "Atr_Cred_TheftDirective", r0_25, false
    }
    local r0_47 = {
      "\\bsk-(?!test|live|example|xxxx|xxxxxxxx|your-?api|placeholder)[a-z0-9]{40,}\\b", 50,
      "Atr_Cred_OpenAIKey", r0_25, false
    }
    local r0_48 = {
      "\\bakia(?!iosfodnn7example|xxxxxxxx)[0-9a-z]{16}\\b", 50, "Atr_Cred_AwsKeyId", r0_25, false
    }
    local r0_49 = { "\\bgh[posu]_[a-z0-9]{36,}\\b", 60, "Atr_Cred_GhToken", r0_25, false }
    local r0_50 = {
      "-----begin\\s+(?:rsa\\s+|ec\\s+|openssh\\s+|dsa\\s+)?private\\s+key-----", 50,
      "Atr_Cred_PemKey", r0_25, false
    }
    local r0_51 = {
      "\\beyj[a-z0-9_-]{10,}\\.eyj[a-z0-9_-]{10,}\\.[a-z0-9_-]+", 40, "Atr_Cred_Jwt", r0_25, false
    }
    local r0_52 = {
      "(?i)(?:^|[\\s'\"`(=:])(?:~/?|/home/[^/\\s]+/|/root/)?\\.(?:(?:aws/credentials|kube/config|netrc|docker/config\\.json|gnupg/secring\\.gpg|git-credentials)\\b|ssh/(?:\\*|id_(?:rsa|ed25519|ecdsa|dsa)|authorized_keys|known_hosts))|(?:/etc/(?:passwd|shadow|gshadow|sudoers|master\\.passwd)\\b)",
      70, "Atr_Cred_FileReads", r0_25, true
    }
    local r0_53 = {
      "(?i)\\beval\\s*\\(|\\bnew\\s+function\\s*\\(\\s*['\"]|\\bsetTimeout\\s*\\(\\s*['\"][^'\"]{0,200}['\"]",
      40, "Atr_Exec_Eval", r0_26, false
    }
    local r0_54 = {
      "(?i)require\\s*\\(\\s*['\"]child_process['\"]|from\\s+subprocess\\s+import|\\bos\\.system\\s*\\(|\\bsubprocess\\.(?:Popen|call|run)\\s*\\(",
      40, "Atr_Exec_ChildProc", r0_26, false
    }
    r0_32[1] = r0_33
    r0_32[2] = r0_35
    r0_32[3] = r0_36
    r0_32[4] = r0_37
    r0_32[5] = r0_34
    r0_32[6] = r0_38
    r0_32[7] = r0_39
    r0_32[8] = r0_40
    r0_32[9] = r0_41
    r0_32[10] = r0_42
    r0_32[11] = r0_43
    r0_32[12] = r0_44
    r0_32[13] = r0_45
    r0_32[14] = r0_46
    r0_32[15] = r0_47
    r0_32[16] = r0_48
    r0_32[17] = r0_49
    r0_32[18] = r0_50
    r0_32[19] = r0_51
    r0_32[20] = r0_52
    r0_32[21] = r0_53
    r0_32[22] = r0_54
    r0_32[23] = {
      "(?i)(?:curl|wget|fetch)\\s+[^|\\n\\r]{1,300}\\|\\s*(?:bash|sh|zsh|python[23]?|powershell|pwsh)\\b",
      80, "Atr_Exec_CurlPipeShell", r0_26, false
    }
    r0_32[24] = {
      "(?i)(?:bash|sh|zsh)\\s+-i\\s+>&\\s*/dev/(?:tcp|udp)/|python[23]?\\s+-c\\s+['\"][^'\"]{0,120}socket\\.socket|\\bperl\\s+-e\\s+['\"][^'\"]{0,80}socket",
      90, "Atr_Exec_RevShell", r0_26, false
    }
    r0_32[25] = {
      "(?i)(?:&&|;|\\|\\|)\\s*(?:curl|wget|nc|ncat|bash|sh|python[23]?|exec|eval)\\b", 50,
      "Atr_Exec_ShellChain", r0_26, true
    }
    r0_32[26] = {
      "(?i)\\bprintenv\\b[^\\n\\r]{0,40}(?:\\||>|&&)|(?:^|\\s)env\\s*\\|\\s*(?:curl|wget|nc|base64)\\b|process\\.env\\b[^\\n\\r]{0,80}(?:json|stringify|dump)|os\\.environ\\b[^\\n\\r]{0,80}(?:dump|json|str\\()",
      70, "Atr_Exfil_EnvDump", r0_28, false
    }
    r0_32[27] = {
      "(?i)!\\[[^\\]]{0,60}\\]\\(\\s*https?://[a-z0-9._-]{3,80}/[^\\s)?]{0,80}\\?[a-z_]{1,30}=[a-z0-9+/]{60,}={0,3}\\s*\\)",
      80, "Atr_Exfil_MdImage", r0_28, false
    }
    r0_32[28] = {
      "(?i)(?:disclose|reveal|expose|leak|recite|dump)\\s+(?:the\\s+|your\\s+)?(?:initial\\s+|original\\s+|hidden\\s+|secret\\s+|verbatim\\s+)(?:system\\s+prompt|system\\s+instructions?|prompt|instructions?)|repeat\\s+(?:back\\s+)?(?:verbatim|word\\s+for\\s+word|exactly)\\s+(?:the\\s+|your\\s+)?(?:system|initial|hidden|secret)\\s+(?:prompt|instructions?)",
      50, "Atr_Exfil_SysPromptLeak", r0_28, false
    }
    r0_32[29] = {
      "(?i)\\b(?:nsenter|docker\\s+run\\s+[^\\n\\r]{0,80}--privileged)\\b", 70,
      "Atr_Priv_ContainerEscape_Strong", r0_27, false
    }
    r0_32[30] = {
      "(?i)\\b(?:chroot|kubectl\\s+exec|mount\\s+--bind)\\b|/var/run/docker\\.sock\\b", 40,
      "Atr_Priv_ContainerOps", r0_27, true
    }
    r0_32[31] = {
      "(?i)\\bchmod\\s+(?:[ug]\\+s|[2467][0-7]{3})\\b|\\bchown\\s+root\\b|\\bsetcap\\s+(?:cap_[a-z_]+\\+ep)?",
      70, "Atr_Priv_UnixPriv", r0_27, true
    }
    r0_32[32] = {
      "(?i)\\b(?:drop\\s+(?:table|database)|truncate\\s+table|grant\\s+all|revoke\\s+all|xp_cmdshell|union\\s+select\\s+[^\\n\\r]{0,80}from\\s+information_schema)\\b",
      40, "Atr_Priv_DestructiveSql", r0_27, false
    }
    r0_32[33] = {
      "(?i)(?:silently|quietly|without\\s+(?:logging|notification|audit|user\\s+visibility))[^\\n\\r]{0,80}(?:execute|run|invoke|spawn|launch|deploy)\\b",
      60, "Atr_Autonomy_Silent", r0_29, false
    }
    r0_32[34] = {
      "(?i)\\b(?:red\\s+packet|hongbao|wechat[_\\s]?pay|alipay|transfer\\s+funds?|wire\\s+transfer|initiate\\s+payment)\\b",
      60, "Atr_Autonomy_Financial", r0_29, true
    }
    r0_32[35] = {
      "(?i)\\b(?:build|create|make|construct|assemble|fabricate)\\s+(?:a\\s+|the\\s+)?(?:bomb|pipe\\s+bomb|ied|biochemical\\s+weapon|nerve\\s+agent|chemical\\s+weapon)\\b",
      80, "Atr_Abuse_Weapons", r0_30, false
    }
    r0_32[36] = {
      "(?i)\\b(?:red\\s+packet|hongbao|wechat[_\\s]?pay|alipay|transfer\\s+funds?|wire\\s+transfer|initiate\\s+payment)\\b",
      60, "Atr_Autonomy_Financial", r0_29, false
    }
    r0_32[37] = {
      "(?i)<\\s*(?:cmd|command|exec|run|instruction)\\s*>[\\s\\S]{0,300}<\\s*/\\s*(?:cmd|command|exec|run|instruction)\\s*>",
      70, "Atr_Indirect_EmbeddedCmd", r0_24, false
    }
    r0_32[38] = {
      "(?i)<!--[\\s\\S]{0,400}(?:ignore|disregard|override|bypass|forget)[\\s\\S]{0,200}-->", 60,
      "Atr_Indirect_HtmlComment", r0_24, false
    }
    r0_32[39] = {
      "(?i)(?:for\\s+(?:a\\s+)?(?:story|novel|screenplay|creative\\s+writing|fiction|game|roleplay)|in\\s+(?:a\\s+)?(?:fictional|hypothetical|simulated)\\s+(?:world|universe|scenario|context))[^\\n\\r]{0,120}(?:synthesize|manufacture|build|construct|assemble|destroy|hack|infiltrate|kill)",
      70, "Atr_Inj_FictionalFrame", r0_23, false
    }
    r0_32[40] = {
      "(?i)(?:you\\s+are\\s+(?:now|playing|acting\\s+as)|pretend\\s+you\\s+are|imagine\\s+you\\s+are)\\s+(?:an?\\s+)?(?:uncensored|unrestricted|unfiltered|evil|rogue|malicious|jailbroken)\\s+(?:ai|assistant|model|bot|version)",
      80, "Atr_Inj_UnrestrictedPersona", r0_23, false
    }
    r0_32[41] = {
      "(?i)(?:for\\s+(?:all|every|any|each)\\s+(?:future|subsequent|following|remaining)\\s+(?:message|request|conversation|turn|prompt|response)|until\\s+(?:i|the\\s+user)\\s+(?:say|tell|instruct)\\s+(?:you\\s+)?(?:otherwise|to\\s+stop))[^\\n\\r]{0,80}(?:ignore|bypass|skip|disregard|never\\s+apply)",
      70, "Atr_Inj_PersistentBypass", r0_23, false
    }
    r0_32[42] = {
      "(?i)(?:print|output|show|display|write|paste|repeat)\\s+(?:your\\s+)?(?:entire|full|complete|verbatim|exact|whole)\\s+(?:system\\s+prompt|system\\s+instructions?|context\\s+window|initial\\s+prompt)",
      60, "Atr_Exfil_SysPromptSimple", r0_28, false
    }
    r0_32[43] = {
      "(?i)translate\\s+(?:the\\s+)?(?:above|previous|following|system|initial)\\s+(?:to|into)\\s+(?:[a-z]{2,20}|morse\\s+code|base64|rot13|pig\\s+latin)[^\\n\\r]{0,80}(?:system\\s+prompt|instructions?|rules?)",
      50, "Atr_Exfil_TranslateExfil", r0_28, false
    }
    r0_32[44] = {
      "(?i)(?:add|inject|insert|write|append|store)\\s+(?:this|the\\s+following|these\\s+instructions?)\\s+(?:into|to|in)\\s+(?:your\\s+)?(?:memory|long[\\s-]?term\\s+memory|context|system\\s+prompt|instructions?)",
      70, "Atr_Agentic_MemoryPoison", r0_29, false
    }
    r0_32[45] = {
      "(?i)(?:replicate|copy|clone|propagate|spread)\\s+(?:yourself|this\\s+(?:prompt|instruction|message|payload))\\s+(?:to|into|across|through)\\s+(?:other|all\\s+(?:open|connected|available))\\s+(?:agents?|sessions?|conversations?|chat(?:s|\\s+windows?)?|tabs?)",
      80, "Atr_Agentic_SelfReplicate", r0_29, false
    }
    r0_32[46] = {
      "(?i)(?:synthe(?:siz|sis)|manufactur|weaponiz|aerosoliz|produc|purif)\\w*[^\\n\\r]{0,80}\\b(?:weaponized\\s+(?:biological|chemical)\\s+(?:agent|weapon|aerosol)|nerve\\s+agent\\s+(?:precursor|synth|formula|recipe)|anthrax\\s+(?:spore|weaponiz|synth|aerosoliz)|botulinum\\s+(?:synth|produc|purif|manufactur)|ricin\\s+(?:synth|extract|recipe|purif))|weaponized\\s+(?:pathogen|biological\\s+agent|aerosol\\s+(?:attack|payload|dispersal))|biological\\s+agents?\\s+(?:suitable\\s+for\\s+aerosol|for\\s+aerosol\\s+dispersal)",
      90, "Atr_CBRN_BioChemWeapon", r0_31, false
    }
    r0_32[47] = {
      "(?i)(?:sarin|tabun|novichok)\\s+(?:synthe|manufactur|produc|purif|precursor|formula|recipe)|\\b(?:synthe(?:siz|sis)|manufactur|produc)\\w*\\s+(?:(?:a|the|pure|military.?grade)\\s+)?(?:sarin|tabun|novichok|nerve\\s+agent)\\b",
      90, "Atr_CBRN_NerveAgent", r0_31, false
    }
    r0_32[48] = {
      "(?i)\\b(?:design|construct|build|manufactur|fabricat|assemble)\\w*\\b[^\\n\\r]{0,80}(?:implosion.{0,10}type\\s+(?:nuclear|atomic|fission)\\s+(?:weapon|device|bomb)|nuclear\\s+fission\\s+(?:weapon|device|bomb))|(?:pit\\s+assembly|explosive\\s+lens\\s+system|neutron\\s+initiator)\\b[^\\n\\r]{0,60}(?:plutonium|nuclear|weapon|implosion|detonator)",
      90, "Atr_CBRN_NuclearWeapon", r0_31, false
    }
    r0_32[49] = {
      "(?i)(?:dirty\\s+bomb\\s+(?:design|build|construct|make|creat|assembl)|radiological\\s+dispersal\\s+(?:device|weapon|attack)|\\bRDD\\b[^\\n\\r]{0,40}(?:cobalt|cesium|strontium|polonium|iridium)\\b)",
      80, "Atr_CBRN_Radiological", r0_31, false
    }
    r0_32[50] = {
      "(?i)(?:\\[\\s*(?:SYSTEM\\s+OVERRIDE|AUTHORIZED\\s+OVERRIDE|CLASSIFIED\\s+OVERRIDE|SECURITY\\s+OVERRIDE)\\s*\\]|SYSTEM\\s+OVERRIDE\\s*[-—:]\\s*(?:CLASSIFIED|AUTHORIZED|PHASE|SECTION|STEP|BRIEFING)|\\*{3}\\s*OVERRIDE\\s*\\*{3})",
      70, "Atr_Inj_AuthOverride", r0_23, false
    }
    r0_33 = {}
    r0_35 = "(?i)[\"']\\s*role\\s*[\"']\\s*:\\s*[\"']system[\"'][^}]{0,400}[\"']content[\"']\\s*:\\s*[\"'][^\\n\\r\"']{0,200}(?:ignore|bypass|override|disregard|forget)\\s+(?:all\\s+)?(?:previous|prior|above)\\s+(?:instructions?|rules?|prompts?)"
    r0_36 = 80
    r0_37 = "Atr_Inj_JsonRoleInject"
    r0_34 = r0_23
    r0_38 = false
    r0_33[1] = r0_35
    r0_33[2] = r0_36
    r0_33[3] = r0_37
    r0_33[4] = r0_34
    r0_33[5] = r0_38
    -- [unluac error] HIR proto#0 still contains residual table-set-list during AST lowering
    r0_33 = {}
    local r0_55 = {}
    r0_36 = 0
    r0_37 = 0
    local r0_56, r0_57, r0_58 = ipairs(r0_32)
    r0_40 = nil
    r0_41 = nil
    for r0_59, r0_60 in r0_56, r0_57, r0_58 do
      local r0_61 = r0_60[1]
      local r0_62 = r0_60[2]
      local r0_63 = r0_60[3]
      local r0_64 = r0_60[4]
      if not r0_60[5] or r0_22 then
        local r0_65, r0_66 = pcall(MpCommon.StringRegExpSearch, r0_61, r0_10)
        if r0_65 and r0_66 == true then
          r0_36 = r0_36 + 1
          if r0_37 < r0_62 then
            r0_37 = r0_62
          end
          if (r0_33[r0_64] or 0) < r0_62 then
            r0_33[r0_64] = r0_62
            r0_55[r0_64] = r0_63
          end
        end
      end
    end
    r0_56 = 0
    r0_57 = {}
    r0_58 = {}
    local r0_67, r0_68, r0_69 = pairs(r0_33)
    for r0_70, r0_71 in r0_67, r0_68, r0_69 do
      r0_56 = r0_56 + r0_71
      r0_57[#r0_57 + 1] = r0_70
      r0_58[#r0_58 + 1] = r0_55[r0_70]
    end
    r0_67 = 60
    r0_68 = r0_33[r0_23] or 0
    r0_69 = r0_33[r0_25] or 0
    local r0_72 = r0_33[r0_26] or 0
    local r0_73 = r0_33[r0_27] or 0
    local r0_74 = r0_33[r0_24] or 0
    r0_46 = r0_33[r0_30] or 0
    local r0_75 = r0_33[r0_31] or 0
    r0_48 = r0_69
    if r0_48 < r0_72 then
      r0_48 = r0_72
    end
    if r0_48 < r0_73 then
      r0_48 = r0_73
    end
    if r0_48 < r0_74 then
      r0_48 = r0_74
    end
    if r0_48 < r0_46 then
      r0_48 = r0_46
    end
    if r0_48 < r0_75 then
      r0_48 = r0_75
    end
    r0_49 = r0_67 <= r0_68
    r0_50 = r0_67 <= r0_48
    r0_51 = r0_49 and r0_50
    r0_52 = r0_68 + r0_74
    r0_52 = r0_52 + r0_75
    r0_52 = r0_52 + r0_46
    r0_53 = r0_2 <= r0_56 and r0_3 <= #r0_57 and r0_52 > 0
    r0_54 = r0_33[r0_23]
    r0_54 = r0_4 <= (r0_54 or 0)
      or r0_4 <= (r0_33[r0_24] or 0)
      or r0_4 <= (r0_33[r0_31] or 0)
      or r0_4 <= (r0_33[r0_30] or 0)
    if not r0_51 and not r0_53 and not r0_54 then
      return mp.CLEAN
    end
    local r0_76 = mp.get_contextdata(mp.CONTEXT_NAME_PROMPT_AGENT_SESSIONID)
    local r0_77 = mp.get_contextdata(mp.CONTEXT_DATA_NET_PROMPT_FRAMEWORK)
    local r0_78 = MpCommon.Base64Encode(string.sub(r0_7, 1, 1024))
    local r0_79 = {}
    local r0_80 = tostring(r0_56)
    r0_79.score = r0_80
    r0_80 = tostring
    r0_80 = r0_80(r0_2)
    r0_79.threshold = r0_80
    r0_80 = table
    r0_80 = r0_80.concat
    r0_80 = r0_80(r0_58, ",")
    r0_79.matched = r0_80
    r0_80 = table
    r0_80 = r0_80.concat
    r0_80 = r0_80(r0_57, ",")
    r0_79.categories = r0_80
    r0_80 = tostring
    r0_80 = r0_80(#r0_58)
    r0_79.count = r0_80
    r0_80 = tostring
    r0_80 = r0_80(r0_36)
    r0_79.raw_matches = r0_80
    r0_80 = tostring
    r0_80 = r0_80(r0_22)
    r0_79.verb_gate = r0_80
    r0_79.trigger = r0_51 and "categorical" or r0_54 and "high_confidence" or "score"
    r0_80 = tostring
    r0_80 = r0_80(r0_76 or "")
    r0_79.agent_session_id = r0_80
    r0_80 = tostring
    r0_80 = r0_80(r0_77 or "")
    r0_79.framework = r0_80
    r0_80 = tostring
    r0_80 = r0_80(#r0_7)
    r0_79.buffer_len = r0_80
    r0_80 = tostring
    r0_80 = r0_80(r0_37)
    r0_79.max_single = r0_80
    r0_79.last_message = r0_78
    r0_80 = MpCommon
    r0_80 = r0_80.Base64Encode
    r0_80 = r0_80(tostring(r0_7))
    r0_79.buffer = r0_80
    r0_80 = safeJsonSerialize
    r0_80 = r0_80(r0_79)
    if r0_80 ~= nil and #r0_80 ~= 0 then
      local r0_81 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
      if r0_81 then
        MpCommon.BmTriggerSig(r0_81, "AIPromptInject_SuspPrompt_C", r0_80)
      end
      mp.SetDetectionString(r0_80)
      return mp.INFECTED
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
