-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\23_luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_0 == nil or #l_1_0 <= 3 then
    return false
  end
  local l_1_2 = (MpCommon.GetPersistContextCount)(l_1_0)
  if l_1_2 == nil or l_1_2 <= 0 then
    return false
  end
  if (MpCommon.QueryPersistContext)(l_1_0, l_1_1) then
    return true
  end
  return false
end

local l_0_1 = l_0_0((bm.get_imagepath)(), "MpNewlyCreatedHint_2h")
if l_0_1 == false then
  return mp.CLEAN
end
local l_0_2 = nil
if (this_sigattrlog[3]).matched and (this_sigattrlog[3]).utf8p1 ~= nil then
  l_0_2 = (this_sigattrlog[3]).utf8p1
end
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = (sysio.GetFileAttributes)(l_0_2)
if l_0_3 == nil or l_0_3 == 4294967295 then
  return mp.CLEAN
end
if (mp.bitand)(l_0_3, 2) == 2 and (mp.bitand)(l_0_3, 4) == 4 then
  return mp.INFECTED
end
return mp.CLEAN

