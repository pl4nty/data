-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c9b373ce9a99\0x00000e0f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if not l_0_0 or not l_0_0.ppid then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if l_0_1 and contains(l_0_1, "TiWorker") then
  return mp.CLEAN
else
  local l_0_2 = {}
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC31: No list found for R3 , SetList fails

  local l_0_4 = {}
  -- DECOMPILER ERROR at PC33: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC35: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC36: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC39: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC40: Overwrote pending register: R6 in 'AssignReg'

  l_0_3 = l_0_3(l_0_4, "TiWorker", "")
  if l_0_3 then
    l_0_3 = mp
    l_0_3 = l_0_3.CLEAN
    return l_0_3
  end
end
do
  -- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

  if (this_sigattrlog[6]).matched and not (string.find)((this_sigattrlog[6]).p1, l_0_4, 1, true) then
    return mp.CLEAN
  end
  return mp.INFECTED
end

