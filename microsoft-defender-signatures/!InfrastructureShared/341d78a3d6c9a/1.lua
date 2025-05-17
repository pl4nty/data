-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\341d78a3d6c9a\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if isnull(l_0_0) then
  return mp.CLEAN
end
if isnull(l_0_0.image_path) then
  return mp.CLEAN
end
local l_0_1 = (string.lower)(l_0_0.image_path)
local l_0_2 = (MpCommon.QueryPersistContext)(l_0_1, "NewWrittenBySystemProcessDetected")
if l_0_2 then
  local l_0_3 = (mp.GetParentProcInfo)(l_0_0.ppid)
  if not isnull(l_0_3) then
    local l_0_4 = (string.lower)(l_0_3.image_path)
    if (string.find)(l_0_4, "\\system32\\services.exe", 1, true) then
      TrackPidAndTechnique("CMDHSTR", "T1021.002", "remoteservice_created_c")
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

