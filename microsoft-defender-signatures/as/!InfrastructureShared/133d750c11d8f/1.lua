-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\133d750c11d8f\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = GetRealPidForScenario("CMDHSTR")
if IsPidExcluded(l_0_0) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetParentProcInfo)()
if l_0_1 == nil or l_0_1.ppid == nil or l_0_1.image_path == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.image_path
local l_0_3 = (string.lower)(l_0_2:match("([^\\]+)$"))
local l_0_4 = {}
l_0_4["ccmexec.exe"] = true
l_0_4["gpscript.exe"] = true
l_0_4["mpcmdrun.exe"] = true
l_0_4["mssense.exe"] = true
l_0_4["senseir.exe"] = true
l_0_4["corsearch.exe"] = true
if l_0_4[l_0_3] then
  return mp.CLEAN
end
local l_0_5 = {}
-- DECOMPILER ERROR at PC47: No list found for R5 , SetList fails

-- DECOMPILER ERROR at PC48: Overwrote pending register: R6 in 'AssignReg'

if ("microsoft.bdd.tasksequencepshost40.exe")("cmdhstr", l_0_5) then
  return mp.CLEAN
end
local l_0_6 = (string.lower)(l_0_1.image_path)
if l_0_6:find("corsearch.exe", 1, true) then
  return mp.CLEAN
end
TrackPidAndTechnique(l_0_0, "T1490", "shadowcopy_delete")
if IsDetectionThresholdMet(l_0_0) then
  return mp.INFECTED
end
if IsTacticObservedForParents(l_0_0, "susp_ransomware", 2) then
  return mp.INFECTED
end
local l_0_7 = GetTacticsTableForPid(l_0_1.ppid)
if l_0_7.winrshost_childproc or l_0_7.wsmprovhost_childproc or l_0_7.remotedropexe_childproc or l_0_7.python_childproc or l_0_7.rundll32_childproc or l_0_7.cscript_childproc or l_0_7.mshta_childproc or l_0_7.webshell_childproc or l_0_7.exec_remotedroppedscript_a or l_0_7.folderguard_blk or l_0_7.folderguard_folder_blk then
  return mp.INFECTED
end
return mp.LOWFI

