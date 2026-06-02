-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd7734511a5\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
do
  if l_0_0.image_path then
    local l_0_1, l_0_2, l_0_3 = (string.lower)(l_0_0.image_path)
  end
  -- DECOMPILER ERROR at PC15: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC17: Confused about usage of register: R1 in 'UnsetPending'

  if l_0_1 == nil or #l_0_1 <= 7 then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC30: Confused about usage of register: R1 in 'UnsetPending'

  if StringEndsWith(l_0_1, "\\setup.exe") or StringEndsWith(l_0_1, "\\open.exe") then
    return mp.INFECTED
  end
  return mp.CLEAN
end

