-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4fd798eba453\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetProcessCommandLine)(l_0_0)):lower()
do
  do
    if l_0_1 ~= nil then
      local l_0_2 = {}
      -- DECOMPILER ERROR at PC25: No list found for R2 , SetList fails

      -- DECOMPILER ERROR at PC26: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC27: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC28: Overwrote pending register: R5 in 'AssignReg'

      if not ("msmpeng.exe")("ntrtscan.exe", "avp.exe") then
        return mp.CLEAN
      end
    end
    do return mp.INFECTED end
    -- WARNING: undefined locals caused missing assignments!
  end
end

