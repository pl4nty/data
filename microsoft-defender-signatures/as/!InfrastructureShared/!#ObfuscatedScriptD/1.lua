-- Threat: !InfrastructureShared
-- Name: !#ObfuscatedScriptD
-- Type: 13
-- Includes: ObfuscatedScriptHistogramInfra

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = string.lower(string.sub(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME), -3))
local l_0_2 = string.lower(string.sub(mp.get_contextdata(mp.CONTEXT_DATA_FILENAME), -4))
if l_0_1 ~= ".js" and l_0_2 ~= ".vbs" and l_0_2 ~= ".ps1" and l_0_2 ~= ".wsf" then
  return mp.CLEAN
end
local l_0_3 = BuildHexadecimalHistogram()
local l_0_4 = l_0_3[1]
if l_0_4 == 0 or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3[2]
local l_0_6 = 0
local l_0_7 = 0
for l_0_8, l_0_9 in pairs(l_0_5) do
  if 3 < l_0_8 then
    if l_0_9 > l_0_6 then
      l_0_7 = l_0_6
      l_0_6 = l_0_9
    elseif l_0_9 < l_0_6 and l_0_9 > l_0_7 then
      l_0_7 = l_0_9
    end
  end
end
local l_0_10 = BuildAlphaNumericHistogram()
local l_0_11 = l_0_10[1]
if l_0_11 == 0 or l_0_11 == nil then
  return mp.CLEAN
end
local l_0_12 = l_0_10[2]
local l_0_13 = 0
local l_0_14 = 0
for l_0_15, l_0_16 in pairs(l_0_12) do
  if 3 < l_0_15 then
    if l_0_16 > l_0_13 then
      l_0_14 = l_0_13
      l_0_13 = l_0_16
    elseif l_0_16 < l_0_13 and l_0_16 > l_0_14 then
      l_0_14 = l_0_16
    end
  end
end
if l_0_4 * 100 / l_0_11 >= 30 or (l_0_6 + l_0_7) * 100 / l_0_11 >= 25 or l_0_6 * 100 / l_0_11 >= 20 or (l_0_13 + l_0_14) * 100 / l_0_11 >= 40 or l_0_13 * 100 / l_0_11 >= 25 then
  return mp.INFECTED
end
return mp.CLEAN
