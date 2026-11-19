-- Threat: !InfrastructureShared
-- Name: 2bfb3163b7095
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_0 then
  local l_0_1 = this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 and this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 and this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 and this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2
  if l_0_1 then
    local l_0_2 = string.match(l_0_1, "Uri=([^;]+)")
    if isnull(l_0_2) then
      return mp.CLEAN
    end
    local l_0_3 = {}
    l_0_3.SIG_CONTEXT = "BM"
    l_0_3.CONTENT_SOURCE = "ALLOCVM_SETTHREADCONTEXT"
    if string.match(l_0_2, "^https?://") then
      local l_0_4, l_0_5 = mp.CheckUrl(l_0_2)
      if l_0_4 == 1 and l_0_5 == 1 then
        return mp.CLEAN
      end
      local l_0_6 = SafeGetUrlReputation({l_0_2}, l_0_3, false, 3000)
      if l_0_6.urls[l_0_2] and l_0_6.urls[l_0_2].determination == 2 and l_0_6.urls[l_0_2].confidence >= 60 then
        local l_0_7, l_0_8 = pcall(string.match, l_0_0, "vmbaseaddress:(%d+)")
        if not l_0_7 or isnull(l_0_8) then
          return mp.CLEAN
        end
        local l_0_9, l_0_10 = pcall(string.match, l_0_0, "vmbytescopied:(%d+)")
        if not l_0_9 or isnull(l_0_10) then
          return mp.CLEAN
        end
        bm.add_related_string("SHELLCODE BYTES: ", l_0_10, bm.RelatedStringBMReport)
        bm.add_related_string("SHELLCODE ADDRESS: ", l_0_8, bm.RelatedStringBMReport)
        bm.add_related_string("MALICIOUS URL: ", l_0_2, bm.RelatedStringBMReport)
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
