-- Threat: !InfrastructureShared
-- Name: ecb3aa687567
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = 30000000
local l_0_1 = bm.GetSignatureMatchDuration()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[6].matched and this_sigattrlog[6].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[8].utf8p2)
end
if l_0_2 ~= nil then
  local l_0_3 = mp.GetExecutablesFromCommandLine(l_0_2)
  for l_0_4, l_0_5 in ipairs(l_0_3) do
    l_0_5 = mp.ContextualExpandEnvironmentVariables(l_0_5)
    if sysio.IsFileExists(l_0_5) then
      return mp.CLEAN
    end
  end
  if string.find(l_0_2, ".py", 1, true) or string.find(l_0_2, ".pl", 1, true) or string.find(l_0_2, ".rb", 1, true) then
    return mp.CLEAN
  end
end
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
