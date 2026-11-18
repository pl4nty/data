-- Threat: !InfrastructureShared
-- Name: 109b3d6a4cc5c
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
local l_0_1 = GetRollingQueueKeys("Medicated64Golang")
local l_0_2 = GetRollingQueueKeys("Medicated32Golang")
if this_sigattrlog[4].matched and not isnull(this_sigattrlog[4].utf8p2) then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
end
if (l_0_1 or l_0_2) and l_0_0 then
  local l_0_3, l_0_4 = pcall(string.match, l_0_0, "DestIp=([^;]+)")
  if not l_0_3 or isnull(l_0_4) then
    return mp.CLEAN
  end
  if isPublicIP(l_0_4) then
    local l_0_5 = {
      SIG_CONTEXT = "BM",
      CONTENT_SOURCE = "SusGolang_A_SLIVER_C2"
    }
    local l_0_6, l_0_7 = mp.CheckUrl(l_0_4)
    if l_0_6 == 1 and l_0_7 == 1 then
      return mp.CLEAN
    end
    local l_0_8 = SafeGetUrlReputation({l_0_4}, l_0_5, false, 3000)
    if l_0_8.urls[l_0_4] and l_0_8.urls[l_0_4].determination ~= 1 and l_0_8.urls[l_0_4].confidence ~= 90 then
      bm.add_related_string("[i] MALICIOUS URL: ", l_0_4, bm.RelatedStringBMReport)
      add_parents()
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
