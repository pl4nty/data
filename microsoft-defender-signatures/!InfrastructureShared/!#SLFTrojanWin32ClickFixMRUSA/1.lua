-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32ClickFixMRUSA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = false
local l_0_2 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_4 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = (MpCommon.PathToWin32Path)(l_0_4)
local l_0_6 = l_0_5 .. "\\" .. l_0_3
l_0_6 = (string.lower)(l_0_6)
do
  local l_0_7, l_0_8 = (mp.GetProcessCommandLine)(l_0_2) or ""
  -- DECOMPILER ERROR at PC49: Confused about usage of register: R7 in 'UnsetPending'

  if #l_0_7 < 70 then
    return mp.CLEAN
  end
  if (string.find)(l_0_6, "powershell", 1, true) then
    l_0_0 = true
  end
  if (string.find)(l_0_6, "mshta", 1, true) then
    l_0_0 = true
  end
  if not l_0_0 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC82: Confused about usage of register: R7 in 'UnsetPending'

  l_0_1 = NormalizeCmdline("powershell", l_0_7)
  local l_0_9, l_0_10 = , (MpCommon.StringRegExpSearch)("(https?:\\/\\/[^\\s\\x22\\x27]+)", l_0_1)
  if not l_0_10 then
    return mp.CLEAN
  end
  if not "(https?:\\/\\/[^\\s\\x22\\x27]+)" then
    return mp.CLEAN
  end
  local l_0_11 = nil
  local l_0_12 = {".activitydmy/", ".bet/", ".biz/", ".blog/", ".bond/", ".buzz/", ".cam/", ".cda/", ".click/", ".club/", ".country/", ".culture/", ".cyou/", ".dat/", ".digital/", ".download/", ".employerdbz/", ".eps/", ".forest/", ".flv/", ".fun/", ".gdn/", ".hair/", ".help/", ".icu/", ".info/", ".lat/", ".life/", ".link/", ".loan/", ".live/", ".m4a/", ".mdb/", ".me/", ".mp3/", ".mp4/", ".my/", ".online/", ".party/", ".pro/", ".press/", ".pw/", ".racing/", ".ren/", ".reise/", ".review/", ".run/", ".sbs/", ".science/", ".shop/", ".site/", ".space/", ".store/", ".stream/", ".study/", ".tech/", ".technology/", ".terrifyenyb/", ".today/", ".top/", ".vip/", ".work/", ".world/", ".xll/", ".xyz/", ".yokohama/"}
  local l_0_13, l_0_14 = {"iex", "iwr", "http", "irm", "curl", "invoke-restmethod", "invoke-webrequest", "invoke-expression", "start-process", "verif", " ray", " recaptcha", " re captcha", " rcaptcha", "press enter", " clip free", " over free", "robot: r", "robot - r", "robot - cloudflare", "robot: cloudflare", "robot: captcha", "robot - captcha", "human - r", "human: r", "human: captcha", "human - captcha", "microsoft windows: fix internet dns service reconnect", "restart dns service in the microsoft windows system", "# "}, (MpCommon.StringRegExpSearch)("-w[indowstyle]*\\s+(?:h[iden]*|1)\\s+", l_0_1)
  if contains(l_0_11, l_0_12) and (contains(l_0_1, l_0_13) or l_0_14) then
    set_research_data("ClickFixMRU.SA", tostring(l_0_1), false)
    return mp.INFECTED
  end
  return mp.CLEAN
end

