-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13bd7129a46e6\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0.image_path == nil then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = contains
local l_0_3 = l_0_1
do
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC24: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC28: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC29: Overwrote pending register: R2 in 'AssignReg'

  if not l_0_2 then
    return l_0_2
  end
  -- DECOMPILER ERROR at PC31: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  do return l_0_2 end
  -- WARNING: undefined locals caused missing assignments!
end

