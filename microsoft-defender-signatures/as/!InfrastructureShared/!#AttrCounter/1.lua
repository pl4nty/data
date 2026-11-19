-- Threat: !InfrastructureShared
-- Name: !#AttrCounter
-- Type: 13
-- Includes: SetAttributeFromClassifierScoresEx

local l_0_0 = mp.enum_mpattributesubstring("AnalysisProcName")
if l_0_0 and type(l_0_0) == "table" then
  SetAttributeFromClassifierScoresEx(#l_0_0, {
    60,
    30,
    20,
    10,
    5,
    1
  }, "Lua:AnalysisProcNamesApprox:")
end
return mp.CLEAN
