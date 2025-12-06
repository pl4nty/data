-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\9ab36409c479\1.luac 

-- params : ...
-- function num : 0
if ((bm.get_current_process_startup_info)()).integrity_level <= MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
if (this_sigattrlog[3]).utf8p1 == nil or (this_sigattrlog[2]).utf8p2 == nil then
  return mp.CLEAN
end
local l_0_1 = nil
local l_0_2 = (this_sigattrlog[2]).utf8p2
if not l_0_2 or not (this_sigattrlog[3]).utf8p1 then
  return mp.CLEAN
end
local l_0_3 = nil
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if not l_1_0 then
    return nil
  end
  l_1_0 = ((((l_1_0:lower()):gsub("/", "\\")):gsub("^\"%s*", "")):gsub("%s*\"$", "")):gsub("\\+", "\\")
  if #l_1_0 > 3 then
    l_1_0 = l_1_0:gsub("\\+$", "")
  end
  return l_1_0
end

local l_0_5 = nil
do
  local l_0_6 = (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_r3
  do
    if not l_2_0:match("%-o\"([^\"]+)\"") then
      local l_2_1 = l_2_0:match("%-o([^%s]+)")
    end
    -- DECOMPILER ERROR at PC8: Confused about usage of register: R1 in 'UnsetPending'

    -- DECOMPILER ERROR at PC11: Confused about usage of register: R1 in 'UnsetPending'

    return l_2_1 and l_0_r3(l_2_1) or nil
  end
end
)(l_0_2)
  if not l_0_6 or not l_0_0(l_0_3) then
    return mp.CLEAN
  end
  if l_0_6:sub(-1) ~= "\\" then
    l_0_6 = l_0_6 .. "\\"
  end
  if (l_0_0(l_0_3)):sub(1, #l_0_6) ~= l_0_6 then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC73: freeLocal<0 in 'ReleaseLocals'

end

