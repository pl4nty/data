-- Threat: !InfrastructureShared
-- Name: 102b31fd6790e
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
local l_0_1 = 0
local l_0_2 = ""
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = this_sigattrlog[1].utf8p2
  l_0_2 = "mshta"
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = this_sigattrlog[2].utf8p2
  l_0_2 = "powershell"
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = this_sigattrlog[3].utf8p2
  l_0_2 = "cmd"
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_3 = {
  "irokast",
  "cherryast",
  ".ps1",
  ".hta"
}
if contains(l_0_0, l_0_3) then
  return mp.CLEAN
end
local l_0_4 = l_0_0:lower()
if l_0_2 == "mshta" then
  return mp.INFECTED
end
local l_0_5, l_0_6 = MpCommon.StringRegExpSearch("[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_4)
if l_0_5 then
  l_0_1 = l_0_1 + 5
end
if isIEXfound(l_0_4) then
  l_0_1 = l_0_1 + 5
end
if l_0_4:match("^cmd[%w%.]*%s+/c") then
  l_0_1 = l_0_1 + 5
end
local l_0_7 = {
  "(new-object system.net.http.httpclient).getasync",
  "(new-object system.net.http.httpclient).getstringasync",
  "(new-object system.net.webclient).downloadstring",
  "(new-object system.net.webclient).downloadfile",
  "(new-object net.webclient).downloadfile",
  "(new-object net.webclient).downloadstring",
  "[net.webclient]::downloadstring",
  "curl",
  "wget",
  "invoke-restmethod",
  "irm",
  "invoke-webrequest",
  "iwr",
  "invoke-expression",
  "iex",
  "invoke-command",
  "[scriptblock]::create",
  "scriptblock::create",
  "content).invoke()",
  "invoke()",
  "start-process",
  "saps",
  "cmd /c powershell",
  "://",
  "[char]105+[char]119+[char]114",
  "([text.encoding]::utf8.getstring",
  "([system.text.encoding]::ascii.getstring",
  "[system.convert]::frombase64string",
  "[system.text.encoding]::utf8.getstring([system.convert]::frombase64string",
  "-usebasicparsing",
  " -useb",
  "-uri",
  "-response",
  "http",
  "substring",
  "downloadfile",
  "downloadstring"
}
if contains(l_0_4, l_0_7) then
  l_0_1 = l_0_1 + 5
end
local l_0_8 = {
  powershell = 5,
  mshta = 5,
  wscript = 4,
  cscript = 4,
  certutil = 4,
  rundll32 = 4,
  regsvr32 = 4,
  schtasks = 3,
  wmic = 3,
  bitsadmin = 3,
  curl = 2,
  wget = 2,
  cmd = 2,
  nslookup = 2,
  findstr = 2
}
for l_0_9, l_0_10 in pairs(l_0_8) do
  if l_0_4:find(l_0_9, 1, true) and (not l_0_2 or l_0_9 ~= l_0_2) then
    l_0_1 = l_0_1 + l_0_10
  end
end
local l_0_11 = select(2, l_0_4:gsub("%^", ""))
if 5 < l_0_11 then
  l_0_1 = l_0_1 + 3
end
if l_0_4:match("%%[%w_]+%%") then
  l_0_1 = l_0_1 + 2
end
if l_0_4:match("%%[%w_]+:~%d+,%d+%%") then
  l_0_1 = l_0_1 + 4
end
if l_0_4:lower():match("%f[%w]call%f[%W]") then
  l_0_1 = l_0_1 + 3
end
if l_0_4:lower():match("for%s+/f") then
  l_0_1 = l_0_1 + 4
end
local l_0_12 = select(2, l_0_4:gsub("\"", ""))
if 6 < l_0_12 then
  l_0_1 = l_0_1 + 2
end
if l_0_4:lower():match("|%s*cmd") then
  l_0_1 = l_0_1 + 5
end
if l_0_4:match("(%w%^)%%*%w") or l_0_4:match("\"%w\"%s*\"") then
  l_0_1 = l_0_1 + 4
end
if 10 <= l_0_1 and l_0_1 < 15 then
  bm.trigger_sig("SuspClickFix_SA", string.format("score=%s;cmdline=%s", tostring(l_0_1), tostring(l_0_0)))
end
if 15 <= l_0_1 then
  bm.add_related_string("SuspClickFix_SA", tostring(l_0_0), bm.RelatedStringBMReport)
  bm.add_related_string("SuspClickFix_SA_score", tostring(l_0_1), bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
