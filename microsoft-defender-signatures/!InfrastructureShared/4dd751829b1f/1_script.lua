-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\4dd751829b1f\1_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not l_0_0.image_path then
  local l_0_1 = (string.lower)(isnull(l_0_0) or "")
  if (string.find)(l_0_1, "\\windows\\system32\\", 1, true) and (l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe") then
    local l_0_2 = (mp.GetScannedPPID)()
    if l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = (mp.GetProcessCommandLine)(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = l_0_3:match("([^\\ ]+%.py)")
    if l_0_4 == nil then
      return mp.CLEAN
    end
    if (MpCommon.GetPersistContextCountNoPath)("UACBypassRegSetData") > 0 then
      local l_0_5 = (MpCommon.GetPersistContextNoPath)("UACBypassRegSetData")
      if l_0_5 then
        for l_0_9,l_0_10 in ipairs(l_0_5) do
          if (string.find)(l_0_10, l_0_4, 1, true) then
            return mp.INFECTED
          end
        end
        return mp.CLEAN
      end
    end
  end
  do
    return mp.CLEAN
  end
end

