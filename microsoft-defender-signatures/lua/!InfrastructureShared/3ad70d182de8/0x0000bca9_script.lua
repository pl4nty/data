-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3ad70d182de8\0x0000bca9_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if (string.find)(l_0_1:lower(), "�\174", 1, true) then
  local l_0_2 = (mp.GetParentProcInfo)()
  if l_0_2 then
    local l_0_3 = l_0_2.image_path
    if l_0_3 == nil then
      return mp.CLEAN
    end
    l_0_3 = (string.lower)(l_0_3)
    if checkFileLastWriteTime(l_0_3, 120) ~= false then
      return mp.CLEAN
    end
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

