-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\364d735e79351\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
if not l_0_0.image_path then
  local l_0_1 = (string.lower)(isnull(l_0_0) or "")
  if (string.find)(l_0_1, "\\windows\\system32\\dllhost.exe", 1, true) and (MpCommon.GetPersistContextCountNoPath)("UACBypassRegSet.B") > 0 then
    local l_0_2 = (MpCommon.GetPersistContextNoPath)("UACBypassRegSet.B")
    if l_0_2 then
      for l_0_6,l_0_7 in ipairs(l_0_2) do
        if (string.lower)(l_0_7) == (string.lower)(l_0_0.ppid) then
          if (versioning.GetCloudBlockLevel)() >= 4 then
            return mp.INFECTED
          end
          return mp.LOWFI
        end
      end
    end
  end
  do
    l_0_1 = mp
    l_0_1 = l_0_1.CLEAN
    return l_0_1
  end
end

