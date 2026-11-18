-- Threat: !InfrastructureShared
-- Name: 245b36dca3778
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if MpCommon.NidSearch(mp.NID_ENABLE_EXTENDED_BAFS, 6) then
  bm.add_related_string("AdditionalInfo", "E5EmergencyAntiTampering", bm.RelatedStringBMReport)
  return mp.INFECTED
end
local l_0_0 = {
  {"wttsvc.exe", ""},
  {"TeamViewer", ""},
  {"UEMS_Agent", ""}
}
local l_0_1 = bm.get_current_process_startup_info()
if not l_0_1 or not l_0_1.ppid then
  return mp.CLEAN
end
local l_0_2, l_0_3, l_0_4, l_0_5 = checkParentCmdlineCaseInsensitive(l_0_1.ppid, l_0_0, 4)
if l_0_2 then
  return mp.CLEAN
end
local l_0_6 = {
  "bcdedit.exe",
  "reg.exe"
}
local l_0_7 = bm.get_imagepath():match("([^\\]+)$")
if not l_0_7 then
  return mp.CLEAN
end
l_0_7 = l_0_7:lower()
for l_0_8, l_0_9 in ipairs(l_0_6) do
  if string.find(l_0_7, l_0_9) then
    local l_0_10 = add_parents()
    local l_0_11 = {}
    for l_0_12, l_0_13 in ipairs(l_0_10) do
      local l_0_14 = l_0_13:match("([^\\]+)$")
      table.insert(l_0_11, l_0_14)
    end
    local l_0_15 = GetRollingQueueKeys("NewlyRegisteredServices")
    if l_0_15 then
      for l_0_16, l_0_17 in ipairs(l_0_15) do
        if contains(l_0_17, l_0_11) then
          bm.add_related_string("RegisteredSrv", l_0_17, bm.RelatedStringBMReport)
          break
        end
      end
    end
    local l_0_18 = reportRelevantUntrustedEntities(0)
    if l_0_18 and next(l_0_18) then
      bm.add_related_string("HasUntrustedEntities", "true", bm.RelatedStringBMReport)
      bm.add_related_string("UntrustedEntities", safeJsonSerialize(l_0_18), bm.RelatedStringBMReport)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
