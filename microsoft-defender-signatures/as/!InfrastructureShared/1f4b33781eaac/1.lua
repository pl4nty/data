-- Threat: !InfrastructureShared
-- Name: 1f4b33781eaac
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, TechniqueTracker

local l_0_0
local l_0_1 = string.lower(bm.get_imagepath())
local l_0_2 = false
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = this_sigattrlog[2].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 then
  l_0_0 = this_sigattrlog[5].utf8p2
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p2 then
  l_0_0 = this_sigattrlog[7].utf8p2
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 then
  l_0_0 = this_sigattrlog[8].utf8p2
end
if not l_0_0 then
  return mp.CLEAN
end
if not l_0_1 then
  return mp.CLEAN
end
local l_0_3, l_0_4 = pcall(MpCommon.CommandLineToArgv, l_0_0)
if not l_0_3 or isnull(l_0_4) or type(l_0_4) ~= "table" or isnull(#l_0_4) then
  return mp.CLEAN
end
if #l_0_4 == 1 or l_0_4[1] == nil then
  return mp.CLEAN
end
local l_0_5, l_0_6 = bm.get_process_relationships()
for l_0_7, l_0_8 in ipairs(l_0_5) do
  if l_0_8.image_path ~= nil and mp.bitand(l_0_8.reason_ex, 1) == 1 and string.lower(string.sub(l_0_8.image_path, -13)) == "\\explorer.exe" then
    l_0_2 = true
    break
  end
end
if not l_0_2 then
  return mp.CLEAN
end
local l_0_9
if StringEndsWith(l_0_1, "cmd.exe") then
  l_0_9 = "cmd"
end
if StringEndsWith(l_0_1, "powershell.exe") then
  l_0_9 = "powershell"
end
if l_0_9 then
  l_0_0 = NormalizeCmdline(l_0_9, l_0_0)
  if not l_0_0 then
    return mp.CLEAN
  end
end
if contains(l_0_0, {".ps1", ".hta"}) then
  return mp.CLEAN
end
local l_0_10, l_0_11 = MpCommon.StringRegExpSearch("(https?:\\/\\/[^\\s\\x22\\x27]+)", l_0_0)
if not l_0_10 then
  return mp.CLEAN
end
if not l_0_11 then
  return mp.CLEAN
end
local l_0_12 = {
  ".activitydmy/",
  ".bet/",
  ".biz/",
  ".blog/",
  ".bond/",
  ".buzz/",
  ".cam/",
  ".cda/",
  ".click/",
  ".club/",
  ".country/",
  ".culture/",
  ".cyou/",
  ".dat/",
  ".digital/",
  ".download/",
  ".employerdbz/",
  ".eps/",
  ".forest/",
  ".flv/",
  ".fun/",
  ".gdn/",
  ".hair/",
  ".help/",
  ".icu/",
  ".info/",
  ".lat/",
  ".life/",
  ".link/",
  ".loan/",
  ".live/",
  ".m4a/",
  ".mdb/",
  ".me/",
  ".mp3/",
  ".mp4/",
  ".my/",
  ".online/",
  ".org/",
  ".party/",
  ".pro/",
  ".pw/",
  ".racing/",
  ".ren/",
  ".reise/",
  ".review/",
  ".run/",
  ".sbs/",
  ".science/",
  ".shop/",
  ".site/",
  ".space/",
  ".store/",
  ".stream/",
  ".study/",
  ".tech/",
  ".technology/",
  ".terrifyenyb/",
  ".today/",
  ".top/",
  ".vip/",
  ".work/",
  ".world/",
  ".xll/",
  ".xyz/",
  ".yokohama/"
}
local l_0_13 = {
  "iex",
  "iwr",
  "http",
  "irm",
  "curl",
  "invoke-restmethod",
  "invoke-webrequest",
  "invoke-expression",
  "windowsinstaller.installer",
  "start-process",
  "verif",
  " ray",
  " recaptcha",
  " re captcha",
  " rcaptcha",
  "press enter",
  " clip free",
  " over free",
  "robot: r",
  "robot - r",
  "robot - cloudflare",
  "robot: cloudflare",
  "robot: captcha",
  "robot - captcha",
  "human - r",
  "human: r",
  "human: captcha",
  "human - captcha",
  "microsoft windows: fix internet dns service reconnect",
  "restart dns service in the microsoft windows system",
  "# ",
  "identificate"
}
local l_0_14, l_0_15 = MpCommon.StringRegExpSearch("(?i)[^\\w\\d\\s]w[indowstyle]*\\s+(?:h[iden]*|1|m[inimized]*)\\s+", l_0_0)
if contains(l_0_11, l_0_12) and (contains(l_0_0, l_0_13) or l_0_14) then
  return mp.INFECTED
end
return mp.CLEAN
