-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3bd7129c09db\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == "" or l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil or #l_0_1 <= 60 then
  return mp.CLEAN
end
l_0_1 = (string.gsub)((string.lower)(l_0_1), "[%\'\"]%)?%+%(?[%\'\"]", "")
l_0_1 = (string.lower)(l_0_1)
local l_0_2 = {}
-- DECOMPILER ERROR at PC39: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC40: Overwrote pending register: R3 in 'AssignReg'

if not ("net group")(l_0_1, l_0_2) then
  return mp.CLEAN
end
local l_0_3 = (mp.GetParentProcInfo)()
do
  if l_0_3 ~= nil then
    local l_0_4 = (string.lower)(l_0_3.image_path)
    if l_0_4:match("([^\\]+)$") == "cscript.exe" or l_0_4:match("([^\\]+)$") == "wscript.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

