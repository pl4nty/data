-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFScriptUrlShortcutA!ibt\0x00001a92_luac 

-- params : ...
-- function num : 0
if mp.HEADERPAGE_SZ < 32 then
  return mp.CLEAN
end
if not (mp.get_mpattribute)("Lua:LastFolder0!downloads") then
  return mp.CLEAN
end
local l_0_0 = split(((string.lower)(tostring(headerpage))):sub(21), "\r\n")
local l_0_1 = {}
for l_0_5,l_0_6 in ipairs(l_0_0) do
  if (l_0_6:sub(1, 1)):byte() > 32 and (l_0_6:sub(1, 1)):byte() < 126 then
    kvsplit(l_0_6, "=", l_0_1)
  end
end
if l_0_1.url ~= "" and l_0_1.showcommand and l_0_1.iconindex and l_0_1.iconfile ~= "" then
  local l_0_7, l_0_8 = pcall(mp.GetMOTWHostUrl)
  local l_0_9, l_0_10 = pcall(mp.GetMOTWReferrerUrl)
  l_0_1.motwhosturl = l_0_8 or ""
  l_0_1.motwreferrerurl = l_0_10 or ""
  ;
  (mp.set_mpattribute)((string.format)("MpInternal_researchdata=CC_iShortcutData=%s", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_1))))
  return mp.INFECTED
end
do
  do
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC103: freeLocal<0 in 'ReleaseLocals'

  end
end

