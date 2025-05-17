-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\31bd799a5a1e2\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 ~= nil then
    local l_0_1 = (string.lower)(l_0_0.image_path)
    if (string.find)(l_0_1, "regbackup3", 2, true) or (string.find)(l_0_1, ":\\Program Files\\Sangfor\\UES\\agent\\bin\\python\\wkpd_check_app.exe", 2, false) or (string.find)(l_0_1, "\\windows defender advanced threat protection\\senseir.exe", 1, true) then
      return mp.CLEAN
    end
  end
  if IsProcNameInParentProcessTree("cmdhstr", "senseir.exe") then
    return mp.CLEAN
  end
  return mp.INFECTED
end

