-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\93d704dd4b03\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
if l_0_1 then
  local l_0_2 = contains
  local l_0_3 = l_0_1
  local l_0_4 = {}
  -- DECOMPILER ERROR at PC27: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R2 in 'AssignReg'

  if l_0_2 then
    return l_0_2
  end
end
do
  do
    -- DECOMPILER ERROR at PC34: Overwrote pending register: R2 in 'AssignReg'

    do return l_0_2.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

