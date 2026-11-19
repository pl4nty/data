-- Threat: !InfrastructureShared
-- Name: 159b351db421e
-- Type: 21

local l_0_0
if this_sigattrlog[13].matched then
  l_0_0 = this_sigattrlog[13].utf8p1
elseif this_sigattrlog[14].matched then
  l_0_0 = this_sigattrlog[14].utf8p1
elseif this_sigattrlog[15].matched then
  l_0_0 = this_sigattrlog[15].utf8p1
elseif this_sigattrlog[16].matched then
  l_0_0 = this_sigattrlog[16].utf8p1
else
  return mp.CLEAN
end
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = -1
local l_0_2 = -1
local l_0_3 = MpCommon.GetPersistContext(l_0_0)
if l_0_3 ~= nil then
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    local l_0_6 = tonumber(string.match(l_0_5, "^Age:([0-9]+)$"))
    if l_0_6 ~= nil and l_0_1 < l_0_6 then
      l_0_1 = l_0_6
    end
    local l_0_7 = tonumber(string.match(l_0_5, "^Prevalence:([0-9]+)$"))
    if l_0_7 ~= nil and l_0_2 < l_0_7 then
      l_0_2 = l_0_7
    end
  end
  if -1 < l_0_1 and l_0_1 <= 1 and -1 < l_0_2 and l_0_2 <= 100 then
    return mp.INFECTED
  end
end
return mp.CLEAN
