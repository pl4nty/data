-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\26cb3451ec7e9\0x00000c8a_luac 

-- params : ...
-- function num : 0
local l_0_0 = 0
local l_0_1 = 0
local l_0_2 = nil
local l_0_3 = false
local l_0_4 = nil
local l_0_5 = false
local l_0_6 = {}
-- DECOMPILER ERROR at PC19: No list found for R6 , SetList fails

local l_0_7 = {}
-- DECOMPILER ERROR at PC21: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC22: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC23: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC24: Overwrote pending register: R8 in 'AssignReg'

-- DECOMPILER ERROR at PC38: Overwrote pending register: R9 in 'AssignReg'

-- DECOMPILER ERROR at PC40: Overwrote pending register: R10 in 'AssignReg'

if (("certutil")[2]).matched and (this_sigattrlog[2]).utf8p2 ~= nil then
  do
    for l_0_11 = 1, ("msiexec").SIGATTR_LOG_SZ, "regsvr32" do
      -- DECOMPILER ERROR at PC42: Overwrote pending register: R12 in 'AssignReg'

      -- DECOMPILER ERROR at PC61: Overwrote pending register: R13 in 'AssignReg'

      -- DECOMPILER ERROR at PC63: Overwrote pending register: R14 in 'AssignReg'

      if (("wmic")[l_0_11]).matched and (sigattr_head[l_0_11]).attribute == 16400 and (sigattr_head[l_0_11]).utf8p2 then
        if not l_0_3 or isnull(l_0_4) or type(l_0_4) ~= "table" or isnull(#l_0_4) then
          return mp.CLEAN
        end
        if #l_0_4 == 1 or l_0_4[1] == nil then
          return mp.CLEAN
        end
      end
    end
    if not contains(l_0_2, l_0_6) or #l_0_2 <= 70 or contains(l_0_2, l_0_7) or not l_0_1 or not l_0_0 or l_0_1 >= l_0_0 or l_0_0 - l_0_1 <= 30000000 or not l_0_5 then
      return mp.CLEAN
    end
    ;
    (bm.add_related_string)("RUNMRU_cmdline", l_0_2, bm.RelatedStringBMReport)
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

