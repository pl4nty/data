-- Threat: !#PUA:Block:PresenokerOnly
-- Type: 13
-- MpAttributes: PUA:Block:Presenoker

local l_0_0 = mp.enum_mpattributesubstring("PUA:ML:Block")
if 0 < #l_0_0 then
  return mp.CLEAN
end
l_0_0 = mp.enum_mpattributesubstring("PUA:Block:")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.INFECTED
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if l_0_2 ~= "PUA:Block:Presenoker" then
    return mp.CLEAN
  end
end
return mp.INFECTED
