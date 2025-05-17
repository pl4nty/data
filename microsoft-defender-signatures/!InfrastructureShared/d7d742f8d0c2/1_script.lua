-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\d7d742f8d0c2\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = nil
if hstrlog and (hstrlog[1]).matched then
  l_0_2 = SetPersistContextNoPath("SymLinkCreatedForMDE_AV", "true")
else
  l_0_2 = SetPersistContextNoPath("SymLinkCreatedForMDE_EDR", "true")
end
if not l_0_2 then
  set_research_data("Error", "Failed to persist NewSymlinkAddedForMDE attrib", false)
end
set_research_data("Link_Added", (MpCommon.Base64Encode)(l_0_1), false)
local l_0_3 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeEdr")
if l_0_3 then
  set_research_data("NewServiceRegistered_LoadsBeforeEdr", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_3)), false)
end
l_0_3 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeAV")
if l_0_3 then
  set_research_data("NewServiceRegistered_LoadsBeforeAV", (MpCommon.Base64Encode)(safeJsonSerialize(l_0_3)), false)
end
return mp.INFECTED

