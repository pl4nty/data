-- Threat: \xac!SuspGolang.O
-- Type: 11
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: (RPF:GoLang:pclntab_magic_unknown & pea_amd64_image) & (RPF:TopLevelFile & RPF:AnyFileHasIOAVURL)

local l_0_0, l_0_1 = pcall(mp.IOAVGetDownloadUrl)
if l_0_0 and not isnull(l_0_1) then
  local l_0_2 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
  if isnull(l_0_2) then
    return mp.CLEAN
  end
  local l_0_3 = {
    4294967280,
    4294967291,
    4294967290,
    4294967281
  }
  local l_0_4 = false
  for l_0_5, l_0_6 in ipairs(l_0_3) do
    if mp.bitand(l_0_2, l_0_6) ~= l_0_6 then
      l_0_4 = true
      break
    end
  end
  if l_0_4 then
    local l_0_7 = {}
    l_0_7.SIG_CONTEXT = "GoLang"
    l_0_7.CONTENT_SOURCE = "IOA_GOLANG_64_WITH_TAMPERED_PCLNTAB_MAGIC"
    local l_0_8, l_0_9 = mp.CheckUrl(l_0_1)
    if l_0_8 == 1 and l_0_9 == 1 then
      return mp.CLEAN
    end
    local l_0_10 = SafeGetUrlReputation({l_0_1}, l_0_7, false, 3000)
    if l_0_10.urls[l_0_1] and l_0_10.urls[l_0_1].determination ~= 1 and l_0_10.urls[l_0_1].confidence ~= 90 then
      if mp.IsTrustedFile(false) == true then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
