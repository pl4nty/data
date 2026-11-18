-- Threat: !InfrastructureShared
-- Name: !#Lua:FeatureRPFEhLsHash
-- Type: 11
-- MpAttributes: RPF:MSVC:EH:LsHash | RPF:DWARF:EH:LsHash

local l_0_0
if mp.get_mpattribute("RPF:MSVC:EH:LsHash") then
  l_0_0 = mp.enum_mpattributesubstring("RPF:MSVC:EH:LsHash:")
elseif mp.get_mpattribute("RPF:DWARF:EH:LsHash") then
  l_0_0 = mp.enum_mpattributesubstring("RPF:DWARF:EH:LsHash:")
else
  return mp.CLEAN
end
local l_0_1 = {}
for l_0_2, l_0_3 in ipairs(l_0_0) do
  local l_0_4, l_0_5, l_0_6 = l_0_3:match(":EH:LsHash:(%x+):(%x+):(%x+)$")
  l_0_1[#l_0_1 + 1] = {
    tonumber(l_0_4, 16),
    tonumber(l_0_5, 16),
    l_0_6
  }
end
table.sort(l_0_1, function(l_1_0, l_1_1)
  return l_1_0[2] > l_1_1[2]
end)
local l_0_7 = {}
for l_0_8, l_0_9 in ipairs(l_0_1) do
  if 3 < l_0_8 then
    break
  end
  l_0_7[#l_0_7 + 1] = l_0_9[3]
end
mp.set_mpattribute("MpInternal_researchdata=FuncLsHash:NC=" .. table.concat(l_0_7, ","))
return mp.CLEAN
