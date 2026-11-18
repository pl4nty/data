-- Threat: !InfrastructureShared
-- Name: 2129a8bfbe62
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 < 20000 or 400000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "'..?.?.?.?.?.?.?.?.?'[,%+]")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_5 = 0
while l_0_5 < 250 do
  l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "'..?.?.?.?.?.?.?.?.?'[,%+]", l_0_3)
  if l_0_2 == nil then
    break
  end
  if l_0_3 > #l_0_1 - 20 then
    break
  end
  l_0_5 = l_0_5 + 1
end
if 200 < l_0_5 then
  return mp.INFECTED
end
return mp.CLEAN
