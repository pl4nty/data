-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\119d701a2514d\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC19: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC20: Overwrote pending register: R3 in 'AssignReg'

if not ("w3wp.exe")("cmdhstr", l_0_2) then
  return mp.CLEAN
end
local l_0_3 = l_0_1:match("(%d+%.%d+%.%d+%.%d+)")
if l_0_3 then
  local l_0_4 = true
  for l_0_8 in l_0_3:gmatch("%d+") do
    if tonumber(l_0_8) > 255 then
      l_0_4 = false
      break
    end
  end
  do
    do
      if l_0_4 then
        return mp.INFECTED
      end
      return mp.CLEAN
    end
  end
end

