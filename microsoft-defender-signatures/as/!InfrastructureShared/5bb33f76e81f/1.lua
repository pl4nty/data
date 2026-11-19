-- Threat: !InfrastructureShared
-- Name: 5bb33f76e81f
-- Type: 21

local function l_0_0(l_1_0)
  if l_1_0 == nil or #l_1_0 <= 3 then
    return false
  end
  local l_1_1 = MpCommon.GetPersistContextCount(l_1_0)
  if l_1_1 == nil or l_1_1 <= 0 then
    return false
  end
  if MpCommon.QueryPersistContext(l_1_0, "MpNewlyCreatedHint_2h") and sysio.IsFileExists(l_1_0) and mp.IsKnownFriendlyFile(l_1_0, true, false) == false then
    bm.add_threat_file(l_1_0)
    return true
  end
  return false
end

local l_0_1
if this_sigattrlog[1].matched then
  l_0_1 = this_sigattrlog[1].utf8p2
else
  return mp.CLEAN
end
if l_0_1 == nil or string.len(l_0_1) == 0 then
  return mp.CLEAN
end
local l_0_2 = false
for l_0_3 in l_0_1:gmatch("([^\r\n]*)\n?") do
  l_0_3 = mp.ContextualExpandEnvironmentVariables(l_0_3)
  if l_0_0(l_0_3) == true then
    l_0_2 = true
  end
end
if l_0_2 == true then
  return mp.INFECTED
end
return mp.CLEAN
