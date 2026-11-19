-- Threat: !InfrastructureShared
-- Name: fdb3dc6a6b4f
-- Type: 21
-- Includes: BMLuaLib

local function l_0_0(l_1_0)
  if l_1_0 == nil then
    return false
  end
  l_1_0 = string.lower(l_1_0)
  l_1_0 = l_1_0:gsub(" %(deleted%)$", "")
  return l_1_0:match("^/var/catchpoint/agent/plugins/playwright/s%d+_%d+/%d+/%w%w%w%w%w%w%w%w%w%w%w?$") ~= nil
end

if not this_sigattrlog[5].matched and not this_sigattrlog[6].matched then
  local l_0_1
  if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
    l_0_1 = this_sigattrlog[3].utf8p1
  elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
    l_0_1 = this_sigattrlog[4].utf8p1
  end
  if l_0_0(l_0_1) then
    return mp.CLEAN
  end
end
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
