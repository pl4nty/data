-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\136_luac 

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
    (bm.add_related_file)(l_1_0)
    return true
  end
  return false
end

local l_0_1 = nil
if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  l_0_1 = (string.lower)((this_sigattrlog[1]).utf8p2)
end
if l_0_1 == nil or #l_0_1 <= 3 then
  return mp.CLEAN
end
l_0_1 = (mp.ContextualExpandEnvironmentVariables)(l_0_1)
l_0_1 = (string.lower)(l_0_1)
if (string.find)(l_0_1, "c:\\programdata\\package cache\\{", 1, true) or (string.find)(l_0_1, " /burn.runonce", 1, true) or (string.find)(l_0_1, ":\\program files", 1, true) then
  return mp.CLEAN
end
if l_0_0(l_0_1) == true then
  return mp.INFECTED
end
return mp.CLEAN

