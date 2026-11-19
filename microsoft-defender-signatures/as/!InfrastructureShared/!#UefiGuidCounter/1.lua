-- Threat: !InfrastructureShared
-- Name: !#UefiGuidCounter
-- Type: 13
-- Includes: SetAttributeFromClassifierScoresEx
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.enum_mpattributesubstring("EFI_")
if l_0_0 and type(l_0_0) == "table" then
  SetAttributeFromClassifierScoresEx(#l_0_0, {
    30,
    20,
    15,
    10,
    5,
    1
  }, "Lua:EfiGuidsApprox:")
end
return mp.CLEAN
