-- Threat: !InfrastructureShared
-- Name: !#Lua:MitreAttributesMasquerading.A
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = "SLF:Win32/PossibleMasquerading.EA"
local l_0_1 = mp.enum_mpattributesubstring(l_0_0)
if l_0_1 == nil or #l_0_1 == 0 or type(l_0_1) ~= "table" then
  return mp.CLEAN
end
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if 32 < #l_0_3 then
    mp.set_mpattribute("BM_MT1036.005")
    return mp.INFECTED
  end
end
return mp.CLEAN
