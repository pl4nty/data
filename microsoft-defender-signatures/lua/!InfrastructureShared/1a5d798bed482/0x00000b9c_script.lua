-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a5d798bed482\0x00000b9c_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil and l_0_0.image_path ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC16: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC20: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R2 in 'AssignReg'

  if l_0_2 then
    return l_0_2
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

