-- Threat: !InfrastructureShared
-- Name: 6f9b3682a418a
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local function l_0_0(l_1_0)
  if l_1_0 ~= nil and l_1_0.matched == true and l_1_0.utf8p2 ~= nil and l_1_0.utf8p2 ~= "" and l_1_0.utf8p1 ~= nil and l_1_0.utf8p1 ~= "" then
    return l_1_0
  end
  return nil
end

local l_0_1 = l_0_0(this_sigattrlog[1]) or l_0_0(this_sigattrlog[2]) or l_0_0(this_sigattrlog[3]) or l_0_0(this_sigattrlog[4]) or l_0_0(this_sigattrlog[5]) or l_0_0(this_sigattrlog[6]) or l_0_0(this_sigattrlog[7]) or l_0_0(this_sigattrlog[8]) or l_0_0(this_sigattrlog[9]) or l_0_0(this_sigattrlog[10]) or l_0_0(this_sigattrlog[11]) or l_0_0(this_sigattrlog[12]) or l_0_0(this_sigattrlog[13]) or l_0_0(this_sigattrlog[14]) or l_0_0(this_sigattrlog[15]) or l_0_0(this_sigattrlog[16]) or l_0_0(this_sigattrlog[17]) or l_0_0(this_sigattrlog[18]) or l_0_0(this_sigattrlog[19]) or l_0_0(this_sigattrlog[20]) or l_0_0(this_sigattrlog[21]) or l_0_0(this_sigattrlog[22]) or l_0_0(this_sigattrlog[23]) or l_0_0(this_sigattrlog[24]) or l_0_0(this_sigattrlog[25]) or l_0_0(this_sigattrlog[26]) or l_0_0(this_sigattrlog[27])
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1.utf8p2)
local l_0_3 = tostring(l_0_1.utf8p1)
local l_0_4, l_0_5 = mp.CheckUrl(l_0_3)
if l_0_4 == 1 and l_0_5 == 1 then
  return mp.CLEAN
end

local function l_0_6(l_2_0)
  if l_2_0 == nil then
    return ""
  end
  return (string.gsub(string.lower(l_2_0), "%`", ""))
end

local l_0_7 = l_0_6(l_0_2)
local l_0_8, l_0_9 = string.gsub(l_0_2, "%`", "")
local l_0_10 = {
  "invoke-expression",
  "iex(",
  "iex ",
  "|iex",
  "| iex",
  ";iex",
  "invoke-webrequest",
  "iwr ",
  "invoke-restmethod",
  "irm ",
  "downloadstring",
  "downloadfile",
  "downloaddata",
  "net.webclient",
  "webclient).download",
  "system.net",
  "frombase64string",
  "-encodedcommand",
  "-enc ",
  "-nop",
  "-noprofile",
  "-noninteractive",
  "-w hidden",
  "-windowstyle hidden",
  "-windowstyle h",
  "-executionpolicy bypass",
  "-ep bypass",
  "start-bitstransfer",
  "bitsadmin /transfer",
  "-urlcache",
  "certutil -",
  "certutil.exe",
  "regsvr32 /i:http",
  "regsvr32 /s /n /u /i:",
  "scrobj",
  "mshta http",
  "mshta javascript",
  "mshta vbscript",
  "rundll32",
  "curl http",
  "curl -o",
  "wget http",
  "finger ",
  "tar -x",
  "curl -sk",
  "wget -",
  "msiexec /i http",
  "msiexec /q ",
  "-usebasicparsing",
  "-wi ",
  "-w h",
  "-noexit"
}
local l_0_11 = {
  "--headless",
  "/v:on",
  "%comspec%",
  "@ssl\\",
  "vbscript:",
  "wscript.shell"
}
if not contains(l_0_7, l_0_10) and not (3 <= l_0_9) and not contains(l_0_7, l_0_11) then
  return mp.CLEAN
end
local l_0_12 = {
  "chatgpt.com",
  "openai.com",
  "claude.ai",
  "claude.com",
  "anthropic.com",
  "grok.com",
  "deepseek.com",
  "google.com",
  "antigravity.google",
  "qwen.ai",
  "chat.z.ai",
  "kimi.com",
  "doubao.com",
  "perplexity.ai",
  "huggingface.co",
  "openrouter.ai",
  "mistral.ai",
  "arena.ai",
  "meta.ai",
  "nousresearch.com",
  "opencode.ai",
  "openclaw.ai",
  "kiro.dev",
  "lovable.dev",
  "cursor.com",
  "manus.im",
  "unsloth.ai",
  "venice.ai",
  "notion.com",
  "notion.so",
  "microsoft.com",
  "visualstudio.com",
  "azure.com",
  "azure.net",
  "azurewebsites.net",
  "windows.net",
  "office.com",
  "office.net",
  "office365.com",
  "sharepoint.com",
  "sharepoint-df.com",
  "cloud.microsoft",
  "dynamics.com",
  "powerbi.com",
  "powerautomate.com",
  "microsofticm.com",
  "microsoftgeneva.com",
  "microsoftonline.com",
  "bing.com",
  "live.com",
  "msn.com",
  "skype.com",
  "eng.ms",
  "jwt.ms",
  "owiki.ms",
  "osgwiki.com",
  "microsoft.ghe.com",
  "githubusercontent.com",
  "youtube.com",
  "googleusercontent.com",
  "withgoogle.com",
  "aws.amazon.com",
  "amazon.com",
  "amazonworkspaces.com",
  "workshops.aws",
  "github.com",
  "gitlab.com",
  "stackoverflow.com",
  "npmjs.com",
  "pypi.org",
  "python.org",
  "nodejs.org",
  "docker.com",
  "kubernetes.io",
  "jetbrains.com",
  "astral.sh",
  "brew.sh",
  "bun.sh",
  "bun.com",
  "ollama.com",
  "pi.dev",
  "figma.com",
  "overleaf.com",
  "supabase.com",
  "devolutions.net",
  "rust-lang.org",
  "virustotal.com",
  "digitalocean.com",
  "medium.com",
  "csdn.net",
  "zhihu.com",
  "cnblogs.com",
  "qiita.com",
  "tailscale.com",
  "salesforce.com",
  "lightning.force.com",
  "service-now.com",
  "atlassian.net",
  "adobe.com",
  "sap.com",
  "oracle.com",
  "ibm.com",
  "dropbox.com",
  "nvidia.com",
  "databricks.com",
  "azuredatabricks.net",
  "clerk.com",
  "pureauth.io",
  "canva.com",
  "kaggle.com",
  ".db.de",
  "deutschebahn.com",
  "tatacapital.com",
  "bajajfinserv.in",
  "xiaomi.com",
  "tencent.com",
  "whatsapp.com",
  "facebook.com",
  "instagram.com",
  "linkedin.com",
  "reddit.com",
  "discord.com",
  "telegram.org",
  "slack.com",
  "bilibili.com",
  "baidu.com",
  "walmart.com",
  "yahoo.com",
  "apple.com",
  "icloud.com",
  "duckduckgo.com",
  "perchance.org",
  "localhost",
  "127.0.0.1",
  "www.runoob.com",
  "www.jenkins.io",
  "www.filestash.app"
}
if l_0_3 ~= nil and contains(l_0_3, l_0_12) then
  return mp.CLEAN
end
local l_0_13 = string.lower(l_0_2)
if l_0_3 ~= nil then
  local l_0_14 = {}
  l_0_14.SIG_CONTEXT = "TerminalFix"
  l_0_14.CONTENT_SOURCE = "ETW_ClipWrite"
  l_0_14.TAG = "INTERFLOW"
  local l_0_15 = SafeGetUrlReputation({l_0_3}, l_0_14, false, 2000)
  if l_0_15.urls[l_0_3] and l_0_15.urls[l_0_3].determination == 2 and l_0_15.urls[l_0_3].confidence >= 60 then
    local l_0_16 = l_0_15.urls[l_0_3].determination
    bm.trigger_sig("ETW_ClipWrite", string.format("URL=%s;cmdline=%s;Determination=%s", tostring(l_0_3), tostring(l_0_2), tostring(l_0_16)))
  end
end
AppendToRollingQueue("IsTerminalFixCMD", l_0_13, l_0_3 or "1", 600, 200, 1)
bm.add_related_string("ETW_ClipWrite_CMD", tostring(l_0_2), bm.RelatedStringBMReport)
return mp.INFECTED
