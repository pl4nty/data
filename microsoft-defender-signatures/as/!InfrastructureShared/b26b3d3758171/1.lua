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
  if (string.len)(l_0_5) > 3000 then
    return mp.CLEAN
  end
  local l_0_6, l_0_7 = , (mp.CheckUrl)(tostring(l_0_4.utf8p1))
  if l_0_7 == 1 and tostring(l_0_4.utf8p1) == 1 then
    return mp.CLEAN
  end
  local l_0_8 = nil
  local l_0_9 = nil
  local l_0_10, l_0_11 = (function(l_2_0)
  -- function num : 0_1
  if l_2_0 == nil then
    return ""
  end
  l_2_0 = (string.gsub)((string.lower)(l_2_0), "%^", "")
  return (string.gsub)(l_2_0, "%`", "")
end
)(l_0_5), (string.gsub)(l_0_5, "%^", "")
  local l_0_12, l_0_13 = , (string.gsub)(l_0_5, "%`", "")
  local l_0_14 = nil
  local l_0_15 = {"invoke-expression", "iex(", "iex ", "|iex", "| iex", ";iex", "invoke-webrequest", "iwr ", "invoke-restmethod", "irm ", "downloadstring", "downloadfile", "downloaddata", "net.webclient", "webclient).download", "system.net", "httpclient", "getstringasync", "frombase64string", "-encodedcommand", "-enc ", "-nop", "-noprofile", "-noninteractive", "-w hidden", "-windowstyle hidden", "-windowstyle h", "-executionpolicy bypass", "-ep bypass", "start-bitstransfer", "bitsadmin /transfer", "-urlcache", "certutil -", "certutil.exe", "regsvr32 /i:http", "regsvr32 /s /n /u /i:", "scrobj", "mshta http", "mshta javascript", "mshta vbscript", "rundll32", "curl http", "curl -o", "wget http", "finger ", "tar -x", "curl -sk", "wget -", "msiexec /i http", "msiexec /q ", "-usebasicparsing", "-wi ", "-w h", "-noexit"}
  if not contains(l_0_10, l_0_15) and l_0_12 < 3 and l_0_14 < 3 and not contains(l_0_10, {"--headless", "/v:on", "%comspec%", "@ssl\\", "vbscript:", "wscript.shell"}) then
    return mp.CLEAN
  end
  local l_0_16 = nil
  local l_0_17 = {"chatgpt.com", "openai.com", "claude.ai", "claude.com", "anthropic.com", "grok.com", "deepseek.com", "google.com", "antigravity.google", "qwen.ai", "chat.z.ai", "kimi.com", "doubao.com", "perplexity.ai", "huggingface.co", "openrouter.ai", "mistral.ai", "arena.ai", "meta.ai", "nousresearch.com", "opencode.ai", "openclaw.ai", "kiro.dev", "lovable.dev", "cursor.com", "manus.im", "unsloth.ai", "venice.ai", "notion.com", "notion.so", "microsoft.com", "visualstudio.com", "azure.com", "azure.net", "azurewebsites.net", "windows.net", "office.com", "office.net", "office365.com", "sharepoint.com", "sharepoint-df.com", "cloud.microsoft", "dynamics.com", "powerbi.com", "powerautomate.com", "microsofticm.com", "microsoftgeneva.com", "microsoftonline.com", "bing.com", "live.com", "msn.com", "skype.com", "eng.ms", "jwt.ms", "owiki.ms", "osgwiki.com", "microsoft.ghe.com", "githubusercontent.com", "youtube.com", "googleusercontent.com", "withgoogle.com", "aws.amazon.com", "amazon.com", "amazonworkspaces.com", "workshops.aws", "github.com", "gitlab.com", "stackoverflow.com", "npmjs.com", "pypi.org", "python.org", "nodejs.org", "docker.com", "kubernetes.io", "jetbrains.com", "astral.sh", "brew.sh", "bun.sh", "bun.com", "ollama.com", "pi.dev", "figma.com", "overleaf.com", "supabase.com", "devolutions.net", "rust-lang.org", "virustotal.com", "digitalocean.com", "medium.com", "csdn.net", "zhihu.com", "cnblogs.com", "qiita.com", "anaconda.com", "hashicorp.com", "linuxmint.com", "askubuntu.com", "tryhackme.com", "vocareum.com", "ohmyposh.dev", "skills.google", "tailscale.com", "cloudflare.com", "salesforce.com", "lightning.force.com", "service-now.com", "atlassian.net", "adobe.com", "sap.com", "oracle.com", "ibm.com", "dropbox.com", "nvidia.com", "databricks.com", "azuredatabricks.net", "clerk.com", "pureauth.io", "canva.com", "kaggle.com", ".db.de", "deutschebahn.com", "tatacapital.com", "bajajfinserv.in", "xiaomi.com", "tencent.com", "whatsapp.com", "facebook.com", "instagram.com", "linkedin.com", "reddit.com", "discord.com", "telegram.org", "slack.com", "bilibili.com", "baidu.com", "walmart.com", "yahoo.com", "apple.com", "icloud.com", "duckduckgo.com", "perchance.org", "localhost", "127.0.0.1", "www.runoob.com", "www.jenkins.io", "www.filestash.app", "get.activated.win", "ublockdns.com", "localhost:", "api.justwoker.icu", "docs.immich.app", "herdr.dev", "massgrave.dev", "seekai.cc", "gapgpt.app", "gorouter.app", "v0.app", "apinex.bond", "timeweb.cloud", "di.internal.bosch.cloud", "tinyinstaller.top"}
  local l_0_18 = function(l_3_0, l_3_1)
  -- function num : 0_2
  if l_3_0 == nil or l_3_1 == nil then
    return false
  end
  l_3_1 = (string.lower)(tostring(l_3_1))
  l_3_1 = (string.gsub)(l_3_1, "^%.", "")
  l_3_1 = (string.gsub)(l_3_1, "%.$", "")
  if l_3_1 == "" then
    return false
  end
  if l_3_0 == l_3_1 then
    return true
  end
  if l_3_1 == "localhost" or (string.match)(l_3_1, "^%d+%.%d+%.%d+%.%d+$") then
    return false
  end
  do
    local l_3_2 = "." .. l_3_1
    do return (string.len)(l_3_2) < (string.len)(l_3_0) and (string.sub)(l_3_0, -(string.len)(l_3_2)) == l_3_2 end
    -- DECOMPILER ERROR: 1 unprocessed JMP targets
  end
end

  if (next(ExtractPartsFromUri(l_0_6))) == nil then
    return mp.CLEAN
  end
  if (ExtractPartsFromUri(l_0_6)).host == nil then
    return mp.CLEAN
  end
  local l_0_19 = nil
  for l_0_23,l_0_24 in ipairs(l_0_17) do
    local l_0_20 = (string.gsub)((string.lower)(tostring((ExtractPartsFromUri(l_0_6)).host)), "%.$", "")
    -- DECOMPILER ERROR at PC614: Confused about usage of register: R22 in 'UnsetPending'

    if l_0_18(l_0_20, "apinex.bond") then
      return mp.CLEAN
    end
  end
  local l_0_25 = nil
  local l_0_26 = false
  local l_0_27 = (string.lower)(l_0_5)
  if ((string.match)(l_0_25, "%.([%a][%a%d%-]*)$")) ~= nil and isSuspTLD(((string.match)(l_0_25, "%.([%a][%a%d%-]*)$"))) then
    l_0_26 = true
    local l_0_28 = nil
    local l_0_29 = AppendToRollingQueue
    local l_0_30 = "IsClickFixCMD_Malicious"
    l_0_29(l_0_30, l_0_27, l_0_6 or "1", 600, 200, 1)
  end
  do
    if l_0_6 ~= nil then
      local l_0_32 = nil
      local l_0_33 = nil
      local l_0_34 = {SIG_CONTEXT = "ClickFix", CONTENT_SOURCE = "ETW_ClipWrite", TAG = "INTERFLOW", isSuspTld = tostring(l_0_26)}
      if ((SafeGetUrlReputation({l_0_6}, l_0_34, false, 3000)).urls)[l_0_6] and (((SafeGetUrlReputation({l_0_6}, l_0_34, false, 3000)).urls)[l_0_6]).determination == 2 and 60 <= (((SafeGetUrlReputation({l_0_6}, l_0_34, false, 3000)).urls)[l_0_6]).confidence then
        (bm.trigger_sig)("ETW_ClipWrite", (string.format)("URL=%s;cmdline=%s;Determination=%s", tostring(l_0_6), tostring(l_0_5), tostring((((SafeGetUrlReputation({l_0_6}, l_0_34, false, 3000)).urls)[l_0_6]).determination)))
      end
    end
    do
      if not l_0_26 then
        local l_0_35 = nil
        local l_0_36 = nil
        local l_0_37 = AppendToRollingQueue
        l_0_37("IsClickFixCMD", l_0_35, l_0_6 or "1", 600, 200, 1)
      end
      do
        do
          ;
          (bm.add_related_string)("ETW_ClipWrite_CMD", tostring(l_0_5), bm.RelatedStringBMReport)
          -- DECOMPILER ERROR at PC753: Confused about usage of register: R18 in 'UnsetPending'

          ;
          (bm.add_related_string)("ETW_ClipWrite_isSuspTld", tostring(l_0_26), bm.RelatedStringBMReport)
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC763: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

