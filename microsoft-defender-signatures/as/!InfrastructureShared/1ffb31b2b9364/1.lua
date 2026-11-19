-- Threat: !InfrastructureShared
-- Name: 1ffb31b2b9364
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = GetRollingQueueKeys("Medicated64Golang")
local l_0_1 = GetRollingQueueKeys("Medicated32Golang")
if l_0_0 or l_0_1 then
  local l_0_2
  if this_sigattrlog[7].matched and not isnull(this_sigattrlog[7].utf8p2) then
    l_0_2 = this_sigattrlog[7].utf8p2
  elseif this_sigattrlog[8].matched and not isnull(this_sigattrlog[8].utf8p2) then
    l_0_2 = this_sigattrlog[8].utf8p2
  elseif this_sigattrlog[9].matched and not isnull(this_sigattrlog[9].utf8p2) then
    l_0_2 = this_sigattrlog[9].utf8p2
  elseif this_sigattrlog[10].matched and not isnull(this_sigattrlog[10].utf8p2) then
    l_0_2 = this_sigattrlog[10].utf8p2
  elseif this_sigattrlog[11].matched and not isnull(this_sigattrlog[11].utf8p2) then
    l_0_2 = this_sigattrlog[11].utf8p2
  elseif this_sigattrlog[12].matched and not isnull(this_sigattrlog[12].utf8p2) then
    l_0_2 = this_sigattrlog[12].utf8p2
  end
  if l_0_2 then
    local l_0_3, l_0_4 = pcall(string.match, l_0_2, "Uri=([^;]+)")
    if not l_0_3 or isnull(l_0_4) then
      return mp.CLEAN
    end
    if not isValidLocalDomain(l_0_4) then
      local l_0_5 = {
        SIG_CONTEXT = "BM",
        CONTENT_SOURCE = "SusGolang_B_SLIVER_C2"
      }
      if string.match(l_0_4, "^https?://") then
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
  end
end
return mp.CLEAN
