-- Threat: !InfrastructureShared
-- Name: 1cdb35d746922
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeEdr")
if l_0_0 and next(l_0_0) then
  bm.add_related_string("NewMinifilterServiceRegistered", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
if this_sigattrlog[1].matched or this_sigattrlog[2].matched then
  SetPersistContextNoPath("SymLinkCreatedForMDE", "AV")
else
  SetPersistContextNoPath("SymLinkCreatedForMDE", "EDR")
end
return mp.INFECTED
