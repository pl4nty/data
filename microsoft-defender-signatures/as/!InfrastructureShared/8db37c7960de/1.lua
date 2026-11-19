-- Threat: !InfrastructureShared
-- Name: 8db37c7960de
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = GetPersistContextValueForKeyRegex("NewServiceRegistered_LoadsBeforeEdr")
if l_0_0 and next(l_0_0) then
  bm.add_related_string("NewMinifilterServiceRegistered", safeJsonSerialize(l_0_0), bm.RelatedStringBMReport)
end
SetPersistContextNoPath("SymLinkCreatedForMDE", "EDR")
return mp.INFECTED
