-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\87d762fd35c4\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
if #l_0_1 > 450 then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = l_0_1:match("https?://(%d+%.%d+%.%d+%.%d+):?(%d*)/([a-f0-9]+)%s*$")
if l_0_2 then
  local l_0_3 = true
  for l_0_7 in l_0_2:gmatch("(%d+)") do
    if tonumber(l_0_7) > 255 then
      l_0_3 = false
      break
    end
  end
  do
    do
      if l_0_3 then
        local l_0_8 = {}
        -- DECOMPILER ERROR at PC53: No list found for R4 , SetList fails

        -- DECOMPILER ERROR at PC54: Overwrote pending register: R5 in 'AssignReg'

        if ("w3wp.exe")("cmdhstr", l_0_8) then
          return mp.INFECTED
        end
      end
      return mp.CLEAN
    end
  end
end

