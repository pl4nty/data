-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\185_luac 

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
if #l_0_1 < 50 then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if l_0_2 == nil or l_0_2.image_path == nil then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") == "explorer.exe" then
  return mp.INFECTED
end
return mp.CLEAN

