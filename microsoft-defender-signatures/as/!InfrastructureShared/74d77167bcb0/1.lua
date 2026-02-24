-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\74d77167bcb0\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = (string.lower)(l_0_1)
if not (string.find)(l_0_1, "\\microsoft\\templates\\", 1, true) and not (string.find)(l_0_1, "\\word\\startup\\", 1, true) then
  return mp.CLEAN
end
if not (string.find)(l_0_1, ".hta", 1, true) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if not l_0_2.image_path then
  do
    local l_0_3 = (string.lower)(l_0_2 == nil or "")
    if (string.find)(l_0_3, "\\windows defender\\msmpeng.exe", 1, true) then
      return mp.CLEAN
    end
    TrackPidAndTechniqueBM("CMDHSTR", "T1218.005", "mshta_template_exec")
    TrackPidAndTechniqueBM("CMDHSTR", "T1137", "office_template_persistence")
    return mp.INFECTED
  end
end

