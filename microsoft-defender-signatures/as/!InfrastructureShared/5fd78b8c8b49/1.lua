-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\5fd78b8c8b49\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC2: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC3: Overwrote pending register: R1 in 'AssignReg'

if not ("w3wp.exe")("cmdhstr", l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetScannedPPID)()
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
l_0_2 = (string.lower)(l_0_2)
local l_0_3 = {}
-- DECOMPILER ERROR at PC39: No list found for R3 , SetList fails

-- DECOMPILER ERROR at PC40: Overwrote pending register: R4 in 'AssignReg'

-- DECOMPILER ERROR at PC41: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC42: Overwrote pending register: R6 in 'AssignReg'

if not ("invoke-webrequest")("invoke-expression", "| invoke-expression") then
  return mp.CLEAN
end
local l_0_4 = (mp.GetParentProcInfo)()
do
  do
    if l_0_4 ~= nil then
      local l_0_5 = l_0_4.ppid
      -- DECOMPILER ERROR at PC60: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC61: Overwrote pending register: R8 in 'AssignReg'

      if l_0_5 ~= "" and l_0_5 ~= nil then
        if IsTacticObservedForPid("|iex", "| iex") then
          return mp.INFECTED
        end
        return mp.CLEAN
      end
      return mp.CLEAN
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

