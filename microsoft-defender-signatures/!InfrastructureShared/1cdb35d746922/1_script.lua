-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1cdb35d746922\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeEdr")
if l_0_0 and next(l_0_0) then
  (bm.add_related_string)("NewMinifilterServiceRegistered", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
if (this_sigattrlog[1]).matched or (this_sigattrlog[2]).matched then
  SetPersistContextNoPath("SymLinkCreatedForMDE", "AV")
else
  SetPersistContextNoPath("SymLinkCreatedForMDE", "EDR")
end
return mp.INFECTED

