-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\51d70f739302\0x0000baf5_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = ((mp.GetProcessCommandLine)(l_0_0)):lower()
if not isIEXfound(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
do
  if l_0_2 ~= nil and l_0_2.image_path ~= nil then
    local l_0_3 = (string.lower)(l_0_2.image_path)
    if l_0_3:match("([^\\]+)$") == "explorer.exe" then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

