-- Threat: !InfrastructureShared
-- Name: 4dd751829b1f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = string.lower(l_0_0.image_path or "")
  if string.find(l_0_1, "\\windows\\system32\\", 1, true) and (l_0_1:match("([^\\]+)$") == "fodhelper.exe" or l_0_1:match("([^\\]+)$") == "computerdefaults.exe") then
    local l_0_2 = mp.GetScannedPPID()
    if l_0_2 == nil then
      return mp.CLEAN
    end
    local l_0_3 = mp.GetProcessCommandLine(l_0_2)
    if l_0_3 == nil then
      return mp.CLEAN
    end
    local l_0_4 = l_0_3:match("([^\\ ]+%.py)")
    if l_0_4 == nil then
      return mp.CLEAN
    end
    if MpCommon.GetPersistContextCountNoPath("UACBypassRegSetData") > 0 then
      local l_0_5 = MpCommon.GetPersistContextNoPath("UACBypassRegSetData")
      if l_0_5 then
        for l_0_6, l_0_7 in ipairs(l_0_5) do
          if string.find(l_0_7, l_0_4, 1, true) then
            return mp.INFECTED
          end
        end
        return mp.CLEAN
      end
    end
  end
end
return mp.CLEAN
