-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43d71034a011\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 == nil or l_0_0.image_path == nil or l_0_0.ppid == nil then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetProcessCommandLine)(l_0_0.ppid)):lower()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if l_0_1:find("-r .\\preflight.js .\\app.jsc", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN

