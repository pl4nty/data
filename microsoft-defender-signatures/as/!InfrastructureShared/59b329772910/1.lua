-- Threat: !InfrastructureShared
-- Name: 59b329772910
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeAV")
if l_0_0 and next(l_0_0) then
  bm.add_related_string("NewMinifilterServiceRegistered", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
SetPersistContextNoPath("SymLinkCreatedForMDE", "AV")
return mp.INFECTED
