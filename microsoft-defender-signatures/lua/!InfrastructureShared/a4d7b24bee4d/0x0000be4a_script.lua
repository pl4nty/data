-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\a4d7b24bee4d\0x0000be4a_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.ppid
local l_0_2 = (mp.GetProcessCommandLine)(l_0_1)
if l_0_2 == "" or l_0_2 == nil then
  return mp.CLEAN
end
l_0_2 = l_0_2:lower()
do
  if (string.find)(l_0_2, "wscript.exe", 1, true) and (string.find)(l_0_2, ".js", 1, true) then
    local l_0_3 = {}
    -- DECOMPILER ERROR at PC44: No list found for R3 , SetList fails

    -- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

    if ("explorer.exe")("chrome.exe", l_0_3) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

