-- Threat: !InfrastructureShared
-- Name: b9b3324dfa46
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if not versioning.IsSeville() and not versioning.IsServer() and versioning.IsSampled(11000, true, true, true) == false then
  return mp.CLEAN
end
local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil then
    local l_0_4 = string.lower(MpCommon.PathToWin32Path(l_0_3.image_path))
    if sysio.IsFileExists(l_0_4) and not mp.IsKnownFriendlyFile(l_0_4, true, false) and l_0_3.ppid ~= nil then
      bm.add_threat_process(l_0_3.ppid)
    end
  end
end
for l_0_5, l_0_6 in ipairs(l_0_1) do
  if l_0_6.image_path ~= nil then
    local l_0_7 = string.lower(MpCommon.PathToWin32Path(l_0_6.image_path))
    if sysio.IsFileExists(l_0_7) and not mp.IsKnownFriendlyFile(l_0_7, true, false) and l_0_6.ppid ~= nil then
      bm.add_threat_process(l_0_6.ppid)
    end
  end
end
local l_0_8, l_0_9, l_0_10 = getCurrentProcessInjectors()
if l_0_10 ~= nil then
  bm.add_related_string("GenRansom_injected", safeJsonSerialize(l_0_10), bm.RelatedStringBMReport)
end
if l_0_9 ~= nil then
  bm.add_related_string("GenRansom_injector", safeJsonSerialize(l_0_9), bm.RelatedStringBMReport)
end
if this_sigattrlog[8].matched and this_sigattrlog[8].utf8p2 and reportGenericRansomware(this_sigattrlog[8].utf8p2) == mp.INFECTED then
  reportTimingData()
  return mp.INFECTED
end
return mp.CLEAN
