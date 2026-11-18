-- Threat: !InfrastructureShared
-- Name: !#SLF:Script/UrlShortcut.A!ibt
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: RPF:TopLevelFile & Lua:URLExt

if mp.HEADERPAGE_SZ < 32 then
  return mp.CLEAN
end
if not mp.get_mpattribute("Lua:LastFolder0!downloads") then
  return mp.CLEAN
end
local l_0_0 = split(string.lower(tostring(headerpage)):sub(21), "\r\n")
local l_0_1 = {}
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if 32 < l_0_3:sub(1, 1):byte() and l_0_3:sub(1, 1):byte() < 126 then
    kvsplit(l_0_3, "=", l_0_1)
  end
end
if l_0_1.url ~= "" and l_0_1.showcommand and l_0_1.iconindex and l_0_1.iconfile ~= "" then
  local l_0_4, l_0_5 = pcall(mp.GetMOTWHostUrl)
  local l_0_6, l_0_7 = pcall(mp.GetMOTWReferrerUrl)
  l_0_1.motwhosturl = l_0_5 or ""
  l_0_1.motwreferrerurl = l_0_7 or ""
  mp.set_mpattribute(string.format("MpInternal_researchdata=CC_iShortcutData=%s", MpCommon.Base64Encode(safeJsonSerialize(l_0_1))))
  return mp.INFECTED
end
return mp.CLEAN
