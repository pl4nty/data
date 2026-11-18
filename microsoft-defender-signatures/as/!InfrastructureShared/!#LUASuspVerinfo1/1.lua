-- Threat: !InfrastructureShared
-- Name: !#LUA:SuspVerinfo1
-- Type: 10

if peattributes.ismsil == false then
  return mp.CLEAN
end
if not peattributes.no_security then
  return mp.CLEAN
end
local l_0_0 = pe.get_versioninfo()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = {"1.0.0.0"}
local l_0_2 = {"1.0.0.0"}
local l_0_3 = 0
local l_0_4 = 0
local l_0_5 = 0
for l_0_6 = 1, #l_0_1 do
  if l_0_0.FileVersion == l_0_1[l_0_6] then
    l_0_3 = l_0_3 + 1
    l_0_5 = l_0_5 + 1
  end
end
for l_0_7 = 1, #l_0_2 do
  if l_0_0.ProductVersion == l_0_2[l_0_7] then
    l_0_4 = l_0_4 + 1
    l_0_5 = l_0_5 + 1
  end
end
if 2 <= l_0_5 and 1 <= l_0_4 and 1 <= l_0_3 then
  return mp.INFECTED
end
return mp.CLEAN
