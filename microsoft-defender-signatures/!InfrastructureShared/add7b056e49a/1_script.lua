-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\add7b056e49a\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil and l_0_0.image_path ~= nil then
    local l_0_1 = (string.lower)(l_0_0.image_path)
    if l_0_1:find("\\daragent\\", 1, true) then
      return mp.CLEAN
    end
  end
  if IsPidExcluded("CMDHSTR") then
    return mp.CLEAN
  end
  TrackPidAndTechnique("CMDHSTR", "T1218.011", "lolbin_rundll")
  if IsDetectionThresholdMet("CMDHSTR") then
    return mp.INFECTED
  end
  return mp.LOWFI
end

