-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\8ad7f76ef763\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if l_0_0 ~= nil then
  local l_0_1 = (string.lower)(l_0_0.image_path)
  if l_0_1:match("([^\\]+)$") == "mshta.exe" then
    local l_0_2 = (mp.GetScannedPPID)()
    if not l_0_2 then
      return mp.CLEAN
    end
    local l_0_3 = ((mp.GetProcessCommandLine)(l_0_2)):lower()
    if hasBase64Content(l_0_3) then
      return mp.INFECTED
    end
  end
end
do
  return mp.CLEAN
end

