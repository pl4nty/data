-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaPowershellClickFixSAS\1_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = (string.lower)(l_0_1.image_path)
if not (string.find)(l_0_2, "explorer.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = (mp.GetProcessCommandLine)(l_0_0)
if #l_0_3 < 70 then
  return mp.CLEAN
end
local l_0_4 = contains
local l_0_5 = l_0_3
local l_0_6 = {}
-- DECOMPILER ERROR at PC62: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC66: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC67: Overwrote pending register: R4 in 'AssignReg'

if l_0_4 then
  return l_0_4
end
-- DECOMPILER ERROR at PC69: Overwrote pending register: R4 in 'AssignReg'

local l_0_7 = false
-- DECOMPILER ERROR at PC73: Overwrote pending register: R8 in 'AssignReg'

if ((".hta").find)(l_0_3, " %-[eE][ncodemaNCODEMA]*%s+") then
  local l_0_8 = NormalizeCmdline("powershell", l_0_3)
  if l_0_8 == nil then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC93: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC94: Overwrote pending register: R5 in 'AssignReg'

  local l_0_9 = str_count_match
  local l_0_10 = l_0_6
  local l_0_11 = {}
  -- DECOMPILER ERROR at PC99: No list found for R11 , SetList fails

  -- DECOMPILER ERROR at PC101: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC102: Overwrote pending register: R4 in 'AssignReg'

end
do
  -- DECOMPILER ERROR at PC104: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R5 in 'AssignReg'

  if isIEXfound(l_0_9) then
    local l_0_12 = str_count_match
    local l_0_13 = l_0_6
    do
      local l_0_14 = {}
      -- DECOMPILER ERROR at PC113: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC141: No list found for R10 , SetList fails

      -- DECOMPILER ERROR at PC143: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC144: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC147: Overwrote pending register: R11 in 'AssignReg'

      -- DECOMPILER ERROR at PC148: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC151: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC161: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC162: Overwrote pending register: R8 in 'AssignReg'

      -- DECOMPILER ERROR at PC163: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC164: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC171: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC174: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC175: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC178: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC179: Overwrote pending register: R14 in 'AssignReg'

      -- DECOMPILER ERROR at PC181: Unhandled construct in 'MakeBoolean' P3

      -- DECOMPILER ERROR at PC181: Unhandled construct in 'MakeBoolean' P3

      if ((l_0_4 ~= true or l_0_5 < 3 or l_0_4 == false) and not l_0_13) or l_0_7 then
        l_0_14(l_0_0, "LUA:PShellClickFix.SAS", ("iwr ")(" //e:jscript"))
        -- DECOMPILER ERROR at PC182: Overwrote pending register: R10 in 'AssignReg'

        -- DECOMPILER ERROR at PC183: Overwrote pending register: R10 in 'AssignReg'

        return l_0_14
      end
      -- DECOMPILER ERROR at PC185: Overwrote pending register: R10 in 'AssignReg'

      -- DECOMPILER ERROR at PC186: Overwrote pending register: R10 in 'AssignReg'

      do return l_0_14 end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

