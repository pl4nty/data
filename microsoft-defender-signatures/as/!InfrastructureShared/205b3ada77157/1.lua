-- Threat: !InfrastructureShared
-- Name: 205b3ada77157
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = ""
local l_0_1 = this_sigattrlog[9].matched and this_sigattrlog[9].utf8p2
if not l_0_1 then
  return mp.CLEAN
end
l_0_0 = string.match(l_0_1, "Uri=([^;]+)")
if not l_0_0 then
  return mp.CLEAN
end
local l_0_2 = {}
l_0_2.SIG_CONTEXT = "LummaC2_lolbin"
l_0_2.CONTENT_SOURCE = "BM"
l_0_2.TAG = "INTERFLOW"
local l_0_3, l_0_4 = mp.CheckUrl(l_0_0)
if l_0_3 == 1 and l_0_4 == 1 then
  return mp.CLEAN
end
local l_0_5 = SafeGetUrlReputation({l_0_0}, l_0_2, false, 2000)
if l_0_5.urls[l_0_0] and l_0_5.urls[l_0_0].determination == 2 then
  return mp.INFECTED
end
if l_0_5.urls[l_0_0] and l_0_5.urls[l_0_0].determination then
  if l_0_5.urls[l_0_0].determination == 1 then
    return mp.CLEAN
  end
  if l_0_5.urls[l_0_0].determination == 4 then
    return mp.CLEAN
  end
  bm.trigger_sig("LummaC2_lolbin_All_1", tostring(l_0_5.urls[l_0_0].determination))
end
return mp.CLEAN
