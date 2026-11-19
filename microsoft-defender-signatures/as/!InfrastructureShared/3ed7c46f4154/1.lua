-- Threat: !InfrastructureShared
-- Name: 3ed7c46f4154
-- Type: 21
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers

local l_0_0 = add_parents_mp()
set_research_data("AdditionalInfo", MpCommon.Base64Encode(safeJsonSerialize(l_0_0)))
return mp.INFECTED
