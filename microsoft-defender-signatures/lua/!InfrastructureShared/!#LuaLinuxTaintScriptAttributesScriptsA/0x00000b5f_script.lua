-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaLinuxTaintScriptAttributesScriptsA\0x00000b5f_luac 

-- params : ...
-- function num : 0
local l_0_0 = false
local l_0_1 = (mp.getfilename)(mp.FILEPATH_QUERY_FULL)
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = {}
-- DECOMPILER ERROR at PC19: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

do
  local l_0_3 = ":Python/"
  -- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC22: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in (":SH/")(":Script/") do
    local l_0_9 = (mp.enum_mpattributesubstring)(l_0_8)
    if l_0_9 ~= nil and #l_0_9 >= 1 then
      AppendToRollingQueue(l_0_3, l_0_1, (table.concat)(l_0_9, "|"))
    end
  end
  if l_0_0 == false then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

