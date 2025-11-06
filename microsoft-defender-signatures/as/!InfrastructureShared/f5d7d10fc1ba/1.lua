-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5d7d10fc1ba\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((mp.GetProcessCommandLine)(l_0_0))
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC30: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC31: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC32: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("/opt/riskpro-scripts/")("/var/lib/cloud/instance/scripts/runcmd") do
    if (string.find)(l_0_1, l_0_7, 1, true) then
      return mp.CLEAN
    end
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

