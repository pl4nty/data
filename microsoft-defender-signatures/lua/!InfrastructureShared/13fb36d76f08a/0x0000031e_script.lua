-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\13fb36d76f08a\0x0000031e_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5 = nil, nil, nil
local l_0_6 = {}
-- DECOMPILER ERROR at PC45: No list found for R6 , SetList fails

-- DECOMPILER ERROR at PC46: Overwrote pending register: R7 in 'AssignReg'

-- DECOMPILER ERROR at PC82: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC101: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC120: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

-- DECOMPILER ERROR at PC149: Unhandled construct in 'MakeBoolean' P3

if ((((((("pdf")[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil and (this_sigattrlog[2]).utf8p2 ~= "" and not (this_sigattrlog[3]).matched) or (this_sigattrlog[4]).matched) and not (this_sigattrlog[5]).matched) or (this_sigattrlog[7]).matched) and l_0_3 == nil) or l_0_5 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC152: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC160: Overwrote pending register: R10 in 'AssignReg'

if (string.find)(l_0_3, l_0_4, "xls", true) and (l_0_4:match("[^.+%.].+%.zip$") or l_0_4:match("[^.+%.].+%.dmg$") or l_0_4:match("[^.+%.].+%.pkg$")) then
  local l_0_7 = l_0_4:match("[^.+]%.(.+)%.+")
  for l_0_11,l_0_12 in pairs(l_0_6) do
    -- DECOMPILER ERROR at PC189: Overwrote pending register: R13 in 'AssignReg'

    if l_0_7 == l_0_12 then
      return ("pptx").INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC195: Overwrote pending register: R7 in 'AssignReg'

    do return l_0_7 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

