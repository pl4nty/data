-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ObfuscatedScriptA\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONOPEN and l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((string.sub)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME), -3))
local l_0_2 = (string.lower)((string.sub)((mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME), -4))
if l_0_1 ~= ".js" and l_0_2 ~= ".vbs" and l_0_2 ~= ".ps1" and l_0_2 ~= ".wsf" then
  return mp.CLEAN
end
local l_0_3 = BuildTokenLengthHistogram()
local l_0_4 = l_0_3[1]
if l_0_4 == 0 or l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = l_0_3[2]
local l_0_6 = 0
local l_0_7 = 0
for l_0_11,l_0_12 in pairs(l_0_5) do
  if l_0_11 <= 5 then
    if l_0_6 < l_0_12 then
      l_0_7 = l_0_6
      l_0_6 = l_0_12
    else
      if l_0_12 < l_0_6 and l_0_7 < l_0_12 then
        l_0_7 = l_0_12
      end
    end
  end
end
do
  if l_0_6 * 100 / l_0_4 >= 75 or (l_0_6 + l_0_7) * 100 / l_0_4 >= 95 then
    return mp.INFECTED
  end
  return mp.CLEAN
end

