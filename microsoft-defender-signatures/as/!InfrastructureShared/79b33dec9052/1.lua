-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\79b33dec9052\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
if l_0_1 then
  l_0_1 = (string.gsub)(l_0_1, "\"", "")
  l_0_1 = (string.gsub)(l_0_1, "\'", "")
  l_0_1 = (string.gsub)(l_0_1, "\'+\'", "")
  l_0_1 = (string.gsub)(l_0_1, "\"+\"", "")
  local l_0_2 = (string.lower)(l_0_1)
  if l_0_2 == nil then
    return mp.CLEAN
  end
  local l_0_3 = contains
  local l_0_4 = l_0_2
  local l_0_5 = {}
  -- DECOMPILER ERROR at PC61: No list found for R5 , SetList fails

  -- DECOMPILER ERROR at PC65: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC66: Overwrote pending register: R3 in 'AssignReg'

  if l_0_3 then
    return l_0_3
  end
end
do
  do
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

