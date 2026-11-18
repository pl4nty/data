-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/ClickFixMRU.SA
-- Type: 13
-- Includes: BMLuaLib, ResearchData
-- ProcessAttributes: StartedViaRUNMRU

local l_0_0 = false
local l_0_1 = false
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = MpCommon.PathToWin32Path(l_0_4)
local l_0_6 = l_0_5 .. "\\" .. l_0_3
l_0_6 = string.lower(l_0_6)
local l_0_7 = mp.GetProcessCommandLine(l_0_2) or ""
if #l_0_7 < 70 then
  return mp.CLEAN
end
if string.find(l_0_6, "powershell", 1, true) then
  l_0_0 = true
end
if string.find(l_0_6, "mshta", 1, true) then
  l_0_0 = true
end
if not l_0_0 then
  return mp.CLEAN
end
l_0_1 = NormalizeCmdline("powershell", l_0_7)
local l_0_8, l_0_9 = MpCommon.StringRegExpSearch("(https?:\\/\\/[^\\s\\x22\\x27]+)", l_0_1)
if not l_0_8 then
  return mp.CLEAN
end
if not l_0_9 then
  return mp.CLEAN
end
local l_0_10 = {
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
  ".party/",
  ".pro/",
  ".press/",
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
local l_0_11 = {
  "iex",
  "iwr",
  "http",
  "irm",
  "curl",
  "invoke-restmethod",
  "invoke-webrequest",
  "invoke-expression",
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
  "# "
}
local l_0_12, l_0_13 = MpCommon.StringRegExpSearch("-w[indowstyle]*\\s+(?:h[iden]*|1)\\s+", l_0_1)
if contains(l_0_9, l_0_10) and (contains(l_0_1, l_0_11) or l_0_12) then
  set_research_data("ClickFixMRU.SA", tostring(l_0_1), false)
  return mp.INFECTED
end
return mp.CLEAN
