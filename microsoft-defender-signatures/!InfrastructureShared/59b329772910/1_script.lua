-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\59b329772910\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeAV")
if l_0_0 and next(l_0_0) then
  (bm.add_related_string)("NewMinifilterServiceRegistered", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
SetPersistContextNoPath("SymLinkCreatedForMDE", "AV")
return mp.INFECTED

