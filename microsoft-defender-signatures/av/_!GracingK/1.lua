-- Threat: \xac!Gracing.K
-- Type: 11
-- Includes: LuaFuncHelper, BMLuaLib
-- MpAttributes: (RPF:GoLang:pclntab_magic_unknown & pea_amd64_image)

local l_0_0 = mp.get_mpattributevalue("RPF:GoLang:pclntab_magic_unknown")
if isnull(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = {
  4294967280,
  4294967291,
  4294967290,
  4294967281
}
local l_0_2 = false
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if mp.bitand(l_0_0, l_0_4) ~= l_0_4 then
    l_0_2 = true
    break
  end
end
if l_0_2 then
  local l_0_5, l_0_6 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REMOTE_SESSION_DOMAINNAME)
  if l_0_5 and not isnull(l_0_6) and not isValidLocalDomain(l_0_6) then
    local l_0_7 = {}
    l_0_7.SIG_CONTEXT = "GoLang"
    l_0_7.CONTENT_SOURCE = "DNS_GOLANG_64_WITH_TAMPERED_PCLNTAB_MAGIC"
    local l_0_8, l_0_9 = mp.CheckUrl(l_0_6)
    if l_0_8 == 1 and l_0_9 == 1 then
      return mp.CLEAN
    end
    local l_0_10 = SafeGetUrlReputation({l_0_6}, l_0_7, false, 3000)
    if l_0_10.urls[l_0_6] and l_0_10.urls[l_0_6].determination ~= 1 and l_0_10.urls[l_0_6].confidence ~= 90 then
      if mp.IsTrustedFile(false) == true then
        return mp.CLEAN
      end
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
