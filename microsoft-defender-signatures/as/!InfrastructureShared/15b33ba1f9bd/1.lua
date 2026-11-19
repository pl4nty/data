-- Threat: !InfrastructureShared
-- Name: 15b33ba1f9bd
-- Type: 21

local l_0_0 = mp.enum_mpattributesubstring("Behavior:")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.INFECTED
end
for l_0_1, l_0_2 in ipairs(l_0_0) do
  if string.find(l_0_2, "Behavior:Win32/MaleficAms", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
