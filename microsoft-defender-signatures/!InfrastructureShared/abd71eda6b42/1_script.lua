-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\abd71eda6b42\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (mp.GetScannedPPID)()
  if not l_0_1 then
    return mp.CLEAN
  end
  local l_0_2 = ((mp.GetProcessCommandLine)(l_0_1)):lower()
  if hasBase64Content(l_0_2) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

