-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b26b3d3758171\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 ~= nil and l_1_0.matched == true and l_1_0.utf8p2 ~= nil and l_1_0.utf8p2 ~= "" then
    return l_1_0
  end
  return nil
end

do
  if not l_0_0(this_sigattrlog[1]) and not l_0_0(this_sigattrlog[2]) and not l_0_0(this_sigattrlog[3]) and not l_0_0(this_sigattrlog[4]) and not l_0_0(this_sigattrlog[5]) and not l_0_0(this_sigattrlog[6]) and not l_0_0(this_sigattrlog[7]) and not l_0_0(this_sigattrlog[8]) and not l_0_0(this_sigattrlog[9]) and not l_0_0(this_sigattrlog[10]) and not l_0_0(this_sigattrlog[11]) and not l_0_0(this_sigattrlog[12]) and not l_0_0(this_sigattrlog[13]) and not l_0_0(this_sigattrlog[14]) and not l_0_0(this_sigattrlog[15]) and not l_0_0(this_sigattrlog[16]) and not l_0_0(this_sigattrlog[17]) and not l_0_0(this_sigattrlog[18]) and not l_0_0(this_sigattrlog[19]) and not l_0_0(this_sigattrlog[20]) and not l_0_0(this_sigattrlog[21]) and not l_0_0(this_sigattrlog[22]) and not l_0_0(this_sigattrlog[23]) and not l_0_0(this_sigattrlog[24]) and not l_0_0(this_sigattrlog[25]) and not l_0_0(this_sigattrlog[26]) and not l_0_0(this_sigattrlog[27]) and not l_0_0(this_sigattrlog[28]) and not l_0_0(this_sigattrlog[29]) and not l_0_0(this_sigattrlog[30]) and not l_0_0(this_sigattrlog[31]) and not l_0_0(this_sigattrlog[32]) and not l_0_0(this_sigattrlog[33]) and not l_0_0(this_sigattrlog[34]) and not l_0_0(this_sigattrlog[35]) and not l_0_0(this_sigattrlog[36]) and not l_0_0(this_sigattrlog[37]) and not l_0_0(this_sigattrlog[38]) and not l_0_0(this_sigattrlog[39]) and not l_0_0(this_sigattrlog[40]) and not l_0_0(this_sigattrlog[41]) and not l_0_0(this_sigattrlog[42]) and not l_0_0(this_sigattrlog[43]) and not l_0_0(this_sigattrlog[44]) and not l_0_0(this_sigattrlog[45]) then
    local l_0_1, l_0_2, l_0_3 = l_0_0(this_sigattrlog[46])
  end
  -- DECOMPILER ERROR at PC275: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC281: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_4 = nil
  local l_0_5 = tostring(l_0_1.utf8p2)
  local l_0_6 = tostring(l_0_4.utf8p1)
  local l_0_7 = (string.lower)(l_0_5)
  local l_0_8 = function(l_2_0, l_2_1)
  -- function num : 0_1
  if l_2_0 == nil or l_2_1 == nil then
    return false
  end
  l_2_1 = (string.lower)(tostring(l_2_1))
  l_2_1 = (string.gsub)(l_2_1, "^%.", "")
  l_2_1 = (string.gsub)(l_2_1, "%.$", "")
  if l_2_1 == "" then
    return false
  end
  if l_2_0 == l_2_1 then
    return true
  end
  if l_2_1 == "localhost" or (string.match)(l_2_1, "^%d+%.%d+%.%d+%.%d+$") then
    return false
  end
  do
    local l_2_2 = "." .. l_2_1
    do return (string.len)(l_2_2) < (string.len)(l_2_0) and (string.sub)(l_2_0, -(string.len)(l_2_2)) == l_2_2 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

  if contains(l_0_7, {"github.com", "githubusercontent.com", "gitlab.com", "get.activated.win"}) then
    return mp.CLEAN
  end
  local l_0_9 = nil
  if (function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_10, l_0_8
  local l_3_1 = false
  for l_3_5 in (string.gmatch)(l_3_0, "https?://[^%s\"\'<>%)%]%}]+") do
    local l_3_6 = ExtractPartsFromUri(l_3_5)
    if next(l_3_6) ~= nil and l_3_6.host ~= nil then
      l_3_1 = true
      local l_3_7 = (string.lower)(tostring(l_3_6.host))
      l_3_7 = (string.gsub)(l_3_7, "%.$", "")
      local l_3_8 = false
      for l_3_12,l_3_13 in ipairs(l_0_10) do
        if l_0_8(l_3_7, l_3_13) then
          l_3_8 = true
          break
        end
      end
      do
        do
          if not l_3_8 then
            return false
          end
          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  return l_3_1
end
)(l_0_7) then
    return mp.CLEAN
  end
  if (string.len)(l_0_5) > 3000 then
    return mp.CLEAN
  end
  local l_0_11, l_0_12 = {"localhost", "127.0.0.1", "astral.sh", "packages.wazuh.com", "community.chocolatey.org", "download.bt.cn", "get.scoop.sh", "get.pnpm.io", "cdn.cs50.net", "repo.zabbix.com", "aka.ms", "deno.land", "omp.sh", "ark.cn-beijing.volces.com", "dl.google.com", "www.aapanel.com", "php.new", "docs.higgsfield.ai", "api.higgsfield.ai", "portalapi.balboadigital.com", "repo.anaconda.com", "lmstudio.ai", "dml.bpglobal.com", "download.splunk.com", "docs.microsoft.com", "edu-res.hc-cdn.cn", "qoder.com", "artifacts.elastic.co", "mirrors.aliyun.com", "packages.microsoft.com", "dl.min.io", "meta.fabricmc.net", "ai.snowflake.com", "www.openinterpreter.com", "get.hacs.xyz", "cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud", "ark-project.tos-cn-beijing.volces.com", "atlassian.com", "github.qualcomm.com", "nextjs.org", "eslint.org", "nya.globalslb.net", "tools.mariusheier.com", "physionet.org", "www.w3.org", "static.devin.ai", "serverless.roboflow.com", "login.microsoftonline.com", "graph.microsoft.com", "nginx.org", "artifacts.mastercard.int", "apt.releases.hashicorp.com", "www.python.org", "devcloud.ubs.net", "get.winhance.net", "rmm.datto.com", "nodejs.org", "releases.jfrog.io", "deb.debian.org", "pkg.jenkins.io", "rclone.org", "api.x.ai", "floci.io", "dl.openfoam.org", "cdn.deepseek.com", "int.repositories.cloud.sap", "mise.run", "bootstrap.pypa.io", "developer.download.nvidia.com", "chocolatey.org", "api.stripe.com", "cs50.harvard.edu", "rbcm-gerrit.de.bosch.com", "minio.epic.com", "archive.ubuntu.com", "bun.sh", "api.groq.com", "go.microsoft.com", "review-android.quicinc.com", "code.kimi.ai", "gerrit-gamma.gic.ericsson.se"}
  if (mp.CheckUrl)(l_0_6) == 1 and l_0_6 == 1 then
    return mp.CLEAN
  end
  local l_0_13 = nil
  local l_0_14 = nil
  local l_0_15, l_0_16 = , (function(l_4_0)
  -- function num : 0_3
  if l_4_0 == nil then
    return ""
  end
  l_4_0 = (string.gsub)(l_4_0, "%^", "")
  return (string.gsub)(l_4_0, "%`", "")
end
)(l_0_7)
  local l_0_17, l_0_18 = (string.gsub)(l_0_5, "%^", "")
  local l_0_19 = (string.gsub)(l_0_5, "%`", "")
  local l_0_20 = nil
  local l_0_21 = {"invoke-expression", "iex(", "iex ", "|iex", "| iex", ";iex", "invoke-webrequest", "iwr ", "invoke-restmethod", "irm ", "downloadstring", "downloadfile", "downloaddata", "net.webclient", "webclient).download", "system.net", "httpclient", "getstringasync", "frombase64string", "-encodedcommand", "-enc ", "-nop", "-noprofile", "-noninteractive", "-w hidden", "-windowstyle hidden", "-windowstyle h", "-executionpolicy bypass", "-ep bypass", "start-bitstransfer", "bitsadmin /transfer", "-urlcache", "certutil -", "certutil.exe", "regsvr32 /i:http", "regsvr32 /s /n /u /i:", "scrobj", "mshta http", "mshta javascript", "mshta vbscript", "rundll32", "curl http", "curl -o", "wget http", "finger ", "tar -x", "curl -sk", "wget -", "msiexec /i http", "msiexec /q ", "-usebasicparsing", "-wi ", "-w h", "-noexit"}
  local l_0_22 = nil
  if not contains(l_0_16, l_0_21) and not (function(l_5_0)
  -- function num : 0_4
  if contains(l_5_0, "msiexec.exe") then
    local l_5_1 = contains
    local l_5_2 = l_5_0
    local l_5_3 = {}
    -- DECOMPILER ERROR at PC13: No list found for R3 , SetList fails

  end
  -- DECOMPILER ERROR at PC17: Overwrote pending register: R1 in 'AssignReg'

  if not l_5_1 then
    return l_5_1
  end
  -- DECOMPILER ERROR at PC19: Overwrote pending register: R1 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

  local l_5_4, l_5_5 = "http://", "https://"
  -- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC34: Overwrote pending register: R3 in 'AssignReg'

  if not l_5_1 or l_5_3 ~= "table" or l_5_3 < 3 then
    return l_5_3
  end
  -- DECOMPILER ERROR at PC36: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC37: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R3 in 'AssignReg'

  if l_5_3 ~= "msiexec.exe" then
    return l_5_3
  end
  -- DECOMPILER ERROR at PC45: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC46: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC47: Overwrote pending register: R3 in 'AssignReg'

  local l_5_6 = "http:\\"
  -- DECOMPILER ERROR at PC48: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC49: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

  for l_5_10 = l_5_4, l_5_5, l_5_6 do
    local l_5_8, l_5_9, l_5_10 = nil
    -- DECOMPILER ERROR at PC54: Overwrote pending register: R8 in 'AssignReg'

    local l_5_11 = nil
    -- DECOMPILER ERROR at PC65: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC66: Overwrote pending register: R9 in 'AssignReg'

    if l_5_8 == "/i" or l_5_8 == "/package" or l_5_8 == l_5_3 then
      local l_5_12 = nil
      -- DECOMPILER ERROR at PC67: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC68: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC74: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC75: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC76: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC77: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC81: Overwrote pending register: R10 in 'AssignReg'

      return l_5_10
    end
  end
  do return false end
  -- DECOMPILER ERROR at PC87: Confused about usage of register R6 for local variables in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end
)(l_0_16) and l_0_18 < 3 and l_0_20 < 3 and not contains(l_0_16, {"--headless", "/v:on", "%comspec%", "@ssl\\", "vbscript:", "wscript.shell"}) then
    return mp.CLEAN
  end
  local l_0_23 = nil
  local l_0_24 = nil
  if (next(ExtractPartsFromUri(l_0_6))) == nil then
    return mp.CLEAN
  end
  if (ExtractPartsFromUri(l_0_6)).host == nil then
    return mp.CLEAN
  end
  local l_0_25 = {"chatgpt.com", "openai.com", "claude.ai", "claude.com", "anthropic.com", "grok.com", "deepseek.com", "google.com", "antigravity.google", "qwen.ai", "chat.z.ai", "kimi.com", "doubao.com", "perplexity.ai", "huggingface.co", "openrouter.ai", "mistral.ai", "arena.ai", "meta.ai", "nousresearch.com", "opencode.ai", "openclaw.ai", "kiro.dev", "lovable.dev", "cursor.com", "manus.im", "unsloth.ai", "venice.ai", "notion.com", "notion.so", "microsoft.com", "visualstudio.com", "azure.com", "azure.net", "azurewebsites.net", "windows.net", "office.com", "office.net", "office365.com", "sharepoint.com", "sharepoint-df.com", "cloud.microsoft", "dynamics.com", "powerbi.com", "powerautomate.com", "microsofticm.com", "microsoftgeneva.com", "microsoftonline.com", "bing.com", "live.com", "msn.com", "skype.com", "eng.ms", "jwt.ms", "owiki.ms", "osgwiki.com", "microsoft.ghe.com", "githubusercontent.com", "youtube.com", "googleusercontent.com", "withgoogle.com", "aws.amazon.com", "amazon.com", "amazonworkspaces.com", "workshops.aws", "github.com", "gitlab.com", "stackoverflow.com", "npmjs.com", "pypi.org", "python.org", "nodejs.org", "docker.com", "kubernetes.io", "jetbrains.com", "astral.sh", "brew.sh", "bun.sh", "bun.com", "ollama.com", "pi.dev", "figma.com", "overleaf.com", "supabase.com", "devolutions.net", "rust-lang.org", "virustotal.com", "digitalocean.com", "medium.com", "csdn.net", "zhihu.com", "cnblogs.com", "qiita.com", "anaconda.com", "hashicorp.com", "linuxmint.com", "askubuntu.com", "tryhackme.com", "vocareum.com", "ohmyposh.dev", "skills.google", "tailscale.com", "cloudflare.com", "salesforce.com", "lightning.force.com", "service-now.com", "atlassian.net", "adobe.com", "sap.com", "oracle.com", "ibm.com", "dropbox.com", "nvidia.com", "databricks.com", "azuredatabricks.net", "clerk.com", "pureauth.io", "canva.com", "kaggle.com", ".db.de", "deutschebahn.com", "tatacapital.com", "bajajfinserv.in", "xiaomi.com", "tencent.com", "whatsapp.com", "facebook.com", "instagram.com", "linkedin.com", "reddit.com", "discord.com", "telegram.org", "slack.com", "bilibili.com", "baidu.com", "walmart.com", "yahoo.com", "apple.com", "icloud.com", "duckduckgo.com", "perchance.org", "localhost", "127.0.0.1", "www.runoob.com", "www.jenkins.io", "www.filestash.app", "get.activated.win", "ublockdns.com", "localhost:", "api.justwoker.icu", "docs.immich.app", "herdr.dev", "massgrave.dev", "seekai.cc", "gapgpt.app", "gorouter.app", "v0.app", "apinex.bond", "timeweb.cloud", "di.internal.bosch.cloud", "tinyinstaller.top", "paimon.moe", "lovable.app", "pnpm.io", "xstarry.dev", "lua.tools", "christitus.com", "x.ai", "omp.sh", "chocolatey.org", "scoop.sh", "llama.app", "wuwatracker.com", "massgrave-dev.translate.goog", "starrailstation.com", "teamworkgraph.com", "docs.digital.bpglobal.com", "tools.mariusheier.com", "portal.balboadigital.com", "www.kimi.ai", "docs.deno.com", "docs.manim.community", "www.qianwen.com", "www.haskell.org", "app.snowflake.com", "stardb.gg", "packages.trilogycare.com.au", "app.factory.ai", "noggin.epic.com", "fly.io", "modelcontextprotocol.io", "floci.io", "spicetify.app", "cs50.harvard.edu", "www.zabbix.com", "zzz.rng.moe", "lumo.proton.me", "app.clockify.me", "se-bot.mx.siemens-energy.cloud", "app.testcontainers.cloud", "vercel.com", "app.dataannotation.tech", "orchard.iamneo.in", "www.aapanel.com", "www.bt.cn", "academy.hackthebox.com", "labs.cognitiveclass.ai", "edu.huaweicloud.com", "console.volcengine.com", "laravel.com", "labclient.labondemand.com", "copilot.com", "www.coursera.org", "lmstudio.ai", "portal.offsec.com", "www.splunk.com", "qoder.com", "devcloud.ubs.net", "learn.kodekloud.com", "secure.weda.fr", "exam.nowcoder.com", "ai-docs.portal.hyperspace.tools.sap", "collab.nse.co.in", "superuser.com", "hpanel.hostinger.com", "winhance.net", "rmm.datto.com", "crowdstrike.com", "vnc.htb-cloud.com", "deno.com", "physionet.org", "app.glean.com", "docs.devin.ai", "open.higgsfield.ai", "qgenie-docs.qualcomm.com", "atlassian.com", "fabricmc.net", "universe.roboflow.com", "grafana.com", "schneegans.de", "www.natfrp.com"}
  for l_0_29,l_0_30 in ipairs(l_0_25) do
    local l_0_26, l_0_27 = , (string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_6)).host)), "%.$", "")
    -- DECOMPILER ERROR at PC814: Confused about usage of register: R28 in 'UnsetPending'

    if l_0_8(l_0_27, "labs.cognitiveclass.ai") then
      return mp.CLEAN
    end
  end
  local l_0_31 = nil
  local l_0_32 = nil
  local l_0_33 = false
  if ((string.match)(l_0_32, "%.([%a][%a%d%-]*)$")) ~= nil and isSuspTLD(((string.match)(l_0_32, "%.([%a][%a%d%-]*)$"))) then
    local l_0_34 = (string.lower)(l_0_5)
    local l_0_35 = nil
    local l_0_36 = AppendToRollingQueue
    l_0_36("IsClickFixCMD_Malicious", l_0_34, l_0_6 or "1", 600, 200, 1)
  end
  do
    if l_0_6 ~= nil then
      local l_0_38 = l_0_33
      local l_0_39 = nil
      local l_0_40 = nil
      if ((SafeGetUrlReputation({l_0_6}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(l_0_38)}, false, 3000)).urls)[l_0_6] and (((SafeGetUrlReputation({l_0_6}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(l_0_38)}, false, 3000)).urls)[l_0_6]).determination == 2 and 60 <= (((SafeGetUrlReputation({l_0_6}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(l_0_38)}, false, 3000)).urls)[l_0_6]).confidence then
        (bm.trigger_sig)("ETW_ClipWrite", (string.format)("URL=%s;cmdline=%s;Determination=%s", tostring(l_0_6), tostring(l_0_5), tostring((((SafeGetUrlReputation({l_0_6}, {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(l_0_38)}, false, 3000)).urls)[l_0_6]).determination)))
      end
    end
    do
      -- DECOMPILER ERROR at PC924: Confused about usage of register: R24 in 'UnsetPending'

      if not l_0_38 then
        local l_0_41 = nil
        local l_0_42 = nil
        local l_0_43 = nil
        AppendToRollingQueue("IsClickFixCMD", l_0_42, l_0_6 or "1", 600, 200, 1)
      end
      do
        do
          ;
          (bm.add_related_string)("ETW_ClipWrite_CMD", tostring(l_0_5), bm.RelatedStringBMReport)
          -- DECOMPILER ERROR at PC952: Confused about usage of register: R24 in 'UnsetPending'

          ;
          (bm.add_related_string)("ETW_ClipWrite_isSuspTld", tostring(l_0_41), bm.RelatedStringBMReport)
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC962: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

