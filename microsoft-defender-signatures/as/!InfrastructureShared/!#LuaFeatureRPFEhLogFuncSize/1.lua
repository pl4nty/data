-- Threat: !InfrastructureShared
-- Name: !#Lua:FeatureRPFEhLogFuncSize
-- Type: 11
-- MpAttributes: RPF:MSVC:EH:LogFuncSize | RPF:DWARF:EH:LogFuncSize

local l_0_0
if mp.get_mpattribute("RPF:MSVC:EH:LogFuncSize") then
  l_0_0 = mp.enum_mpattributesubstring("RPF:MSVC:EH:LogFuncSize:")
elseif mp.get_mpattribute("RPF:DWARF:EH:LogFuncSize") then
  l_0_0 = mp.enum_mpattributesubstring("RPF:DWARF:EH:LogFuncSize:")
else
  return mp.CLEAN
end
local l_0_1 = {}
for l_0_2, l_0_3 in ipairs(l_0_0) do
  l_0_1[#l_0_1 + 1] = l_0_3:match("RPF:MSVC:EH:LogFuncSize:(%d+:%d+)")
end
mp.set_mpattribute("MpInternal_researchdata=LogFuncSize:CD=" .. table.concat(l_0_1, ";"))
return mp.CLEAN
