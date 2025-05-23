-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5bb33f76e81f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil or #l_1_0 <= 3 then
    return false
  end
  local l_1_1 = (MpCommon.GetPersistContextCount)(l_1_0)
  if l_1_1 == nil or l_1_1 <= 0 then
    return false
  end
  if (MpCommon.QueryPersistContext)(l_1_0, "MpNewlyCreatedHint_2h") and (sysio.IsFileExists)(l_1_0) and (mp.IsKnownFriendlyFile)(l_1_0, true, false) == false then
    (bm.add_threat_file)(l_1_0)
    return true
  end
  return false
end

local l_0_1 = nil
if (this_sigattrlog[1]).matched then
  l_0_1 = (this_sigattrlog[1]).utf8p2
else
  return mp.CLEAN
end
if l_0_1 == nil or (string.len)(l_0_1) == 0 then
  return mp.CLEAN
end
local l_0_2 = false
for l_0_6 in l_0_1:gmatch("([^\r\n]*)\n?") do
  l_0_6 = (mp.ContextualExpandEnvironmentVariables)(l_0_6)
  if l_0_0(l_0_6) == true then
    l_0_2 = true
  end
end
if l_0_2 == true then
  return mp.INFECTED
end
return mp.CLEAN

