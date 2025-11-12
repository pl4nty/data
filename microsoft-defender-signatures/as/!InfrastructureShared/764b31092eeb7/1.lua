-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\764b31092eeb7\1.luac 

-- params : ...
-- function num : 0
if IsSenseRelatedProc() == true then
  return mp.CLEAN
end
local l_0_0 = {}
-- DECOMPILER ERROR at PC13: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC14: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = (("svchost.exe").get_imagepath)()
-- DECOMPILER ERROR at PC19: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC21: Overwrote pending register: R4 in 'AssignReg'

if l_0_1 and ("microsoft")("\\installer\\", "\\appdata\\") then
  return mp.CLEAN
end
local l_0_2 = nil
-- DECOMPILER ERROR at PC45: Overwrote pending register: R2 in 'AssignReg'

if ((this_sigattrlog[7]).matched and not (this_sigattrlog[8]).matched) or not l_0_2 then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC55: Overwrote pending register: R2 in 'AssignReg'

local l_0_3 = "c:\\\\programdata\\microsoft\\\\windows defender.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$|c:\\\\.*\\\\microsoft\\\\windows defender advanced threat protection\\\\.*(\\.exe|\\.sys|\\.dll|\\.mui)(_bak)?$"
local l_0_4 = "c:\\\\programdata\\\\microsoft(_bak)?$|c:\\\\program files\\\\windows defender advanced threat protection(_bak)?$"
-- DECOMPILER ERROR at PC58: Overwrote pending register: R5 in 'AssignReg'

local l_0_5 = "Windows\\System32\\spoolsv.exe"
if (MpCommon.StringRegExpSearch)(l_0_3, l_0_2) or (MpCommon.StringRegExpSearch)(l_0_4, l_0_2) or (MpCommon.StringRegExpSearch)(l_0_5, l_0_2) then
  (bm.add_related_string)("MDE_Path", l_0_2, bm.RelatedStringBMReport)
  if not (string.find)(l_0_2, "advanced threat protection", 1, true) then
    (bm.add_related_string)("AV", "True", bm.RelatedStringBMReport)
    local l_0_6 = contains
    local l_0_7 = l_0_1
    local l_0_8 = {}
    -- DECOMPILER ERROR at PC109: No list found for R8 , SetList fails

    -- DECOMPILER ERROR at PC113: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC114: Overwrote pending register: R6 in 'AssignReg'

    if not l_0_6 then
      l_0_6(l_0_7, l_0_8)
    end
  end
  do
    -- DECOMPILER ERROR at PC118: Overwrote pending register: R6 in 'AssignReg'

    do
      do
        local l_0_9 = l_0_6()
        -- DECOMPILER ERROR at PC120: Overwrote pending register: R7 in 'AssignReg'

        -- DECOMPILER ERROR at PC122: Overwrote pending register: R8 in 'AssignReg'

        -- DECOMPILER ERROR at PC123: Overwrote pending register: R9 in 'AssignReg'

        -- DECOMPILER ERROR at PC124: Overwrote pending register: R10 in 'AssignReg'

        ;
        (l_0_7.add_related_string)(l_0_8, ("C:\\ProgramData\\")("C:\\Program Files"), bm.RelatedStringBMReport)
        do return mp.INFECTED end
        do return mp.CLEAN end
        -- WARNING: undefined locals caused missing assignments!
      end
    end
  end
end

