-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00000606_luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetParentProcInfo)()
do
  if l_0_0 then
    local l_0_1 = (sysio.GetFileLastWriteTime)(l_0_0.image_path)
    if ((sysio.GetLastResult)()).Success and l_0_1 ~= 0 then
      l_0_1 = l_0_1 / 10000000 - 11644473600
      if (MpCommon.GetCurrentTimeT)() - (l_0_1) < 120 and not (mp.IsKnownFriendlyFile)(l_0_0.image_path, false, false) then
        return mp.INFECTED
      end
    end
  end
  return mp.CLEAN
end

