-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\b1eb3f728d6e1\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (versioning.GetOrgID)()
if l_0_0 == nil or l_0_0 == "" or l_0_0:lower() ~= "767a35f6-ae33-4609-8630-c7d7a86ed134" then
  return mp.CLEAN
end
local l_0_1 = (bm.get_imagepath)()
if l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
local l_0_2 = (bm.get_current_process_startup_info)()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = l_0_2.command_line
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_3) or IsExcludedByImagePathMacOS(l_0_1) then
  return mp.CLEAN
end
reportRelatedBmHits()
return mp.INFECTED

