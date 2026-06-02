-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\59d7d059e927\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
do
  if l_0_0.image_path then
    local l_0_1, l_0_2 = (string.lower)(l_0_0.image_path)
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil or #l_0_1 <= 7 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  local l_0_3 = normalize_path(l_0_1)
  if l_0_3 == nil or #l_0_3 <= 7 then
    return mp.CLEAN
  end
  local l_0_4 = (MpCommon.GetOriginalFileName)(l_0_3)
  if l_0_4 == nil and #l_0_4 <= 10 then
    return mp.CLEAN
  end
  if (string.lower)(l_0_4) == "bm_renpy_exe" then
    return mp.INFECTED
  end
  return mp.CLEAN
end

