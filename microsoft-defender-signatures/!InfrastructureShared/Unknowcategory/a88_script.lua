-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a88_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil and l_0_0.image_path ~= nil and l_0_0.ppid ~= nil and (string.find)(l_0_0.image_path, "/bin/bash", 1, true) then
    local l_0_1 = (mp.GetParentProcInfo)(l_0_0.ppid)
    if l_0_1 ~= nil and l_0_1.image_path ~= nil and l_0_1.ppid ~= nil and (string.find)(l_0_1.image_path, "/opt/attackiq/agent/engine/", 1, true) then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

