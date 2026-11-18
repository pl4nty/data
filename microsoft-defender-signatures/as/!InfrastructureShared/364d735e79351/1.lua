-- Threat: !InfrastructureShared
-- Name: 364d735e79351
-- Type: 21
-- Includes: BMLuaLib

local l_0_0 = mp.GetParentProcInfo()
if not isnull(l_0_0) then
  local l_0_1 = string.lower(l_0_0.image_path or "")
  if string.find(l_0_1, "\\windows\\system32\\dllhost.exe", 1, true) and MpCommon.GetPersistContextCountNoPath("UACBypassRegSet.B") > 0 then
    local l_0_2 = MpCommon.GetPersistContextNoPath("UACBypassRegSet.B")
    if l_0_2 then
      for l_0_3, l_0_4 in ipairs(l_0_2) do
        if string.lower(l_0_4) == string.lower(l_0_0.ppid) then
          if versioning.GetCloudBlockLevel() >= 4 then
            return mp.INFECTED
          end
          return mp.LOWFI
        end
      end
    end
  end
end
return mp.CLEAN
